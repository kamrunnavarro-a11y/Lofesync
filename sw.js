// LifeSync Service Worker v1
// Handles: offline caching, background sync, push notifications

const CACHE = "lifesync-v1";
const SHELL = ["/", "/index.html"];

// ── Install: cache the app shell ─────────────────────────────────────────────
self.addEventListener("install", e => {
  e.waitUntil(
    caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting())
  );
});

// ── Activate: clean up old caches ────────────────────────────────────────────
self.addEventListener("activate", e => {
  e.waitUntil(
    caches.keys().then(keys =>
      Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

// ── Fetch: serve from cache, fall back to network ────────────────────────────
self.addEventListener("fetch", e => {
  // Skip non-GET, chrome-extension, and Supabase API calls (always need fresh)
  const url = e.request.url;
  if (e.request.method !== "GET") return;
  if (url.includes("supabase.co")) return;
  if (url.includes("anthropic.com")) return;
  if (url.includes("openfoodfacts.org")) return;

  e.respondWith(
    caches.match(e.request).then(cached => {
      // Return cached if available, otherwise fetch and cache
      const fetched = fetch(e.request).then(res => {
        if (res.ok && e.request.url.startsWith(self.location.origin)) {
          const clone = res.clone();
          caches.open(CACHE).then(c => c.put(e.request, clone));
        }
        return res;
      }).catch(() => cached); // If offline and not cached, return whatever we have
      return cached || fetched;
    })
  );
});

// ── Push Notifications ────────────────────────────────────────────────────────
self.addEventListener("push", e => {
  const data = e.data?.json() || {};
  e.waitUntil(
    self.registration.showNotification(data.title || "LifeSync ✨", {
      body: data.body || "",
      icon: "/icon-192.png",
      badge: "/icon-192.png",
      tag: data.tag || "lifesync",
      data: { url: data.url || "/" },
      actions: data.actions || [],
      vibrate: [100, 50, 100],
    })
  );
});

self.addEventListener("notificationclick", e => {
  e.notification.close();
  const url = e.notification.data?.url || "/";
  e.waitUntil(
    clients.matchAll({ type: "window", includeUncontrolled: true }).then(list => {
      const existing = list.find(c => c.url === url);
      return existing ? existing.focus() : clients.openWindow(url);
    })
  );
});

// ── Scheduled notification triggers ──────────────────────────────────────────
// Called from the app via postMessage
self.addEventListener("message", e => {
  if (e.data?.type === "SCHEDULE_NOTIFICATIONS") {
    // Handled by the app's useEffect — SW just receives pushes from server
    // For local notifications we use the app's own setTimeout approach
  }
  if (e.data?.type === "SKIP_WAITING") {
    self.skipWaiting();
  }
});
