// LifeSync - compiled app
function bootApp() {
try {
var React = window.React;
var useState = window.useState;
var useEffect = window.useEffect;
var useRef = window.useRef;
var useCallback = window.useCallback;
var useMemo = window.useMemo;

var __rest = (this && this.__rest) || function (s, e) {
var t = {};
for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
t[p] = s[p];
if (s != null && typeof Object.getOwnPropertySymbols === “function”)
for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
t[p[i]] = s[p[i]];
}
return t;
};
const CSS = `@import url('https://fonts.googleapis.com/css2?family=Sora:wght@300;400;500;600;700;800&family=DM+Serif+Display:ital@0;1&family=Space+Mono:wght@400;700&display=swap'); :root { --bg:#0a0812;--surface:#13101e;--surface2:#1c1828;--surface3:#221e30; --border:rgba(180,150,255,0.12);--border-bright:rgba(200,170,255,0.28); --text:#f0ecff;--text-muted:#8b7fa8;--text-dim:#4a4060; --rose:#ff6b9d;--violet:#c77dff;--indigo:#8b9eff; --mint:#7fffd4;--gold:#ffd700;--peach:#ffb997;--sky:#87ceeb;--red:#ff4d6d; --glow-rose:0 0 30px rgba(255,107,157,0.4); --glow-violet:0 0 30px rgba(199,125,255,0.4); --glow-mint:0 0 30px rgba(127,255,212,0.35); --glow-gold:0 0 24px rgba(255,215,0,0.5); --grad-rose:linear-gradient(135deg,#ff6b9d,#c77dff); --grad-violet:linear-gradient(135deg,#c77dff,#8b9eff); --grad-mint:linear-gradient(135deg,#7fffd4,#87ceeb); --grad-gold:linear-gradient(135deg,#ffd700,#ffb997); } *{box-sizing:border-box;margin:0;padding:0} body{font-family:'Sora',sans-serif;background:var(--bg);color:var(--text);overflow-x:hidden} ::-webkit-scrollbar{width:4px} ::-webkit-scrollbar-track{background:var(--bg)} ::-webkit-scrollbar-thumb{background:rgba(199,125,255,0.3);border-radius:2px} body::before{content:'';position:fixed;inset:0;z-index:0;pointer-events:none; background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.025'/%3E%3C/svg%3E")} .orb{position:fixed;border-radius:50%;filter:blur(130px);opacity:0.07;pointer-events:none;z-index:0;animation:drift 22s ease-in-out infinite alternate} .orb1{width:600px;height:600px;background:#c77dff;top:-200px;right:-80px} .orb2{width:500px;height:500px;background:#ff6b9d;bottom:-150px;left:-80px;animation-delay:-8s} .orb3{width:380px;height:380px;background:#7fffd4;top:40%;left:38%;animation-delay:-15s} @keyframes drift{from{transform:translate(0,0) scale(1)}to{transform:translate(28px,18px) scale(1.08)}} .app{position:relative;z-index:1;display:flex;min-height:100vh} .sidebar{width:66px;flex-shrink:0;background:rgba(13,10,22,0.88);backdrop-filter:blur(24px); border-right:1px solid var(--border);display:flex;flex-direction:column;align-items:center; padding:18px 0;gap:4px;position:sticky;top:0;height:100vh;transition:width 0.22s ease;z-index:100} .sidebar.ex{width:218px;align-items:stretch;padding:18px 10px} .s-logo{width:38px;height:38px;border-radius:13px;background:var(--grad-rose);display:flex; align-items:center;justify-content:center;font-size:17px;margin-bottom:6px; box-shadow:var(--glow-rose);flex-shrink:0;cursor:pointer;transition:transform 0.2s} .s-logo:hover{transform:scale(1.06)} .s-logo-text{font-family:'DM Serif Display',serif;font-size:14px;color:var(--text);white-space:nowrap} .ni{width:42px;height:42px;border-radius:13px;display:flex;align-items:center;justify-content:center; cursor:pointer;transition:all 0.18s;color:var(--text-muted);position:relative;font-size:19px;flex-shrink:0} .sidebar.ex .ni{width:100%;justify-content:flex-start;padding:0 11px;gap:11px} .ni:hover{background:rgba(199,125,255,0.1);color:var(--violet)} .ni.active{background:rgba(199,125,255,0.14);color:var(--violet);box-shadow:inset 0 0 0 1px rgba(199,125,255,0.18)} .ni .nl{font-size:12.5px;font-weight:500;white-space:nowrap;display:none} .sidebar.ex .ni .nl{display:block} .nbadge{min-width:15px;height:15px;background:var(--rose);border-radius:7px;font-size:9px;font-weight:700;color:#fff;display:flex;align-items:center;justify-content:center;padding:0 3px;margin-left:auto} .sdiv{width:28px;height:1px;background:var(--border);margin:3px 0} .sidebar.ex .sdiv{width:100%} .main{flex:1;overflow-y:auto;padding:26px 30px;max-width:1180px} @media(max-width:768px){ .sidebar{display:none} .main{padding:14px 14px 80px} .mob-nav{position:fixed;bottom:0;left:0;right:0;z-index:200; background:rgba(13,10,22,0.96);backdrop-filter:blur(24px); border-top:1px solid var(--border); display:flex;justify-content:space-around;padding:8px 0 max(8px,env(safe-area-inset-bottom))} .mob-ni{display:flex;flex-direction:column;align-items:center;gap:3px; font-size:9.5px;color:var(--text-muted);cursor:pointer;padding:4px 8px;border-radius:10px;transition:all 0.18s} .mob-ni.active{color:var(--violet)} } @media(min-width:769px){.mob-nav{display:none}} .card{background:var(--surface);border:1px solid var(--border);border-radius:20px;padding:20px; position:relative;overflow:hidden;transition:border-color 0.2s} .card:hover{border-color:var(--border-bright)} .card.gr{box-shadow:var(--glow-rose);border-color:rgba(255,107,157,0.18)} .card.gv{box-shadow:var(--glow-violet);border-color:rgba(199,125,255,0.18)} .card.gm{box-shadow:var(--glow-mint);border-color:rgba(127,255,212,0.18)} .card.gg{box-shadow:var(--glow-gold);border-color:rgba(255,215,0,0.18)} .sc{background:var(--surface);border:1px solid var(--border);border-radius:18px;padding:16px; display:flex;flex-direction:column;gap:7px;transition:all 0.2s} .sc:hover{transform:translateY(-2px);border-color:var(--border-bright)} .si{width:40px;height:40px;border-radius:13px;display:flex;align-items:center;justify-content:center;font-size:19px} .sv{font-size:24px;font-weight:700;letter-spacing:-0.5px;line-height:1} .sl{font-size:12px;color:var(--text-muted);font-weight:500} .ss{font-size:11px;color:var(--text-dim)} .pb{height:6px;background:var(--surface2);border-radius:3px;overflow:hidden} .pf{height:100%;border-radius:3px;transition:width 0.9s cubic-bezier(.4,0,.2,1)} .b{display:inline-flex;align-items:center;gap:3px;padding:3px 9px;border-radius:20px;font-size:10.5px;font-weight:600} .br{background:rgba(255,107,157,0.14);color:var(--rose)} .bv{background:rgba(199,125,255,0.14);color:var(--violet)} .bm{background:rgba(127,255,212,0.14);color:var(--mint)} .bg{background:rgba(255,215,0,0.14);color:var(--gold)} .bi{background:rgba(139,158,255,0.14);color:var(--indigo)} .bp{background:rgba(255,185,151,0.14);color:var(--peach)} .bs{background:rgba(135,206,235,0.14);color:var(--sky)} .btn{display:inline-flex;align-items:center;justify-content:center;gap:7px; padding:9px 18px;border-radius:11px;font-family:'Sora',sans-serif; font-size:12.5px;font-weight:600;cursor:pointer;transition:all 0.18s;border:none;outline:none} .btn-p{background:var(--grad-rose);color:#fff;box-shadow:0 4px 18px rgba(255,107,157,0.3)} .btn-p:hover{transform:translateY(-1px);box-shadow:0 6px 24px rgba(255,107,157,0.42)} .btn-s{background:rgba(199,125,255,0.1);color:var(--violet);border:1px solid rgba(199,125,255,0.2)} .btn-s:hover{background:rgba(199,125,255,0.18)} .btn-g{background:transparent;color:var(--text-muted)} .btn-g:hover{color:var(--text);background:rgba(255,255,255,0.05)} .btn-sm{padding:5px 12px;font-size:11.5px;border-radius:8px} .btn-ic{padding:7px;border-radius:10px;min-width:34px;height:34px} .btn-danger{background:rgba(255,77,109,0.12);color:var(--red);border:1px solid rgba(255,77,109,0.2)} .btn-danger:hover{background:rgba(255,77,109,0.2)} .inp{background:var(--surface2);border:1px solid var(--border);border-radius:11px; padding:9px 13px;color:var(--text);font-family:'Sora',sans-serif;font-size:13.5px;width:100%; transition:border-color 0.2s} .inp:focus{outline:none;border-color:rgba(199,125,255,0.4);box-shadow:0 0 0 3px rgba(199,125,255,0.08)} .inp::placeholder{color:var(--text-dim)} textarea.inp{resize:vertical;min-height:80px} select.inp{cursor:pointer} .sh{margin-bottom:18px} .st{font-size:21px;font-weight:700;letter-spacing:-0.3px} .ss2{font-size:12.5px;color:var(--text-muted);margin-top:3px} .tabs{display:flex;gap:3px;background:var(--surface);border-radius:13px;padding:4px;flex-wrap:wrap} .tab{padding:7px 15px;border-radius:9px;font-size:12.5px;font-weight:500;cursor:pointer;transition:all 0.18s;color:var(--text-muted)} .tab.active{background:rgba(199,125,255,0.14);color:var(--violet)} .tab:hover:not(.active){color:var(--text)} @keyframes flame{0%,100%{transform:scaleY(1) rotate(-2deg)}50%{transform:scaleY(1.1) rotate(2deg)}} .fl{display:inline-block;animation:flame 1.5s ease-in-out infinite;transform-origin:bottom} .hr{display:flex;align-items:center;gap:11px;padding:13px 15px;border-radius:15px; border:1px solid var(--border);background:var(--surface);transition:all 0.18s;cursor:pointer} .hr:hover{border-color:var(--border-bright);background:var(--surface2)} .hr.done{border-color:rgba(127,255,212,0.2);background:rgba(127,255,212,0.04)} .hc{width:23px;height:23px;border-radius:7px;border:2px solid var(--border-bright); display:flex;align-items:center;justify-content:center;flex-shrink:0;transition:all 0.18s;font-size:12px} .hr.done .hc{background:var(--mint);border-color:var(--mint);box-shadow:var(--glow-mint)} .xb{height:7px;background:var(--surface2);border-radius:4px;overflow:hidden} .xf{height:100%;background:var(--grad-gold);border-radius:4px;transition:width 0.9s ease} .ach{display:flex;align-items:center;gap:13px;padding:13px 15px;border-radius:15px; border:1px solid var(--border);background:var(--surface);transition:all 0.18s} .ach.ul{border-color:rgba(255,215,0,0.28);background:rgba(255,215,0,0.04)} .ai2{width:46px;height:46px;border-radius:15px;display:flex;align-items:center;justify-content:center;font-size:23px;flex-shrink:0} .ai2.lk{filter:grayscale(1) opacity(0.25)} .cb{padding:11px 15px;border-radius:15px;font-size:13.5px;line-height:1.6;max-width:86%} .cb.user{background:var(--grad-violet);color:#fff;margin-left:auto;border-bottom-right-radius:4px} .cb.ai{background:var(--surface2);color:var(--text);border:1px solid var(--border);border-bottom-left-radius:4px} @keyframes pdim{0%,100%{opacity:1}50%{opacity:0.45}} .cb.loading{animation:pdim 1.4s ease-in-out infinite} .ring-wrap{position:relative;display:inline-flex;align-items:center;justify-content:center} .ring-label{position:absolute;text-align:center;pointer-events:none} .bar-chart{display:flex;align-items:flex-end;gap:3px} .bar-chart .bar{border-radius:4px 4px 0 0;min-height:3px;transition:height 0.55s ease} .toasts{position:fixed;top:18px;right:18px;z-index:9999;display:flex;flex-direction:column;gap:7px;pointer-events:none} .toast{background:var(--surface2);border:1px solid var(--border-bright);border-radius:13px; padding:13px 17px;display:flex;align-items:center;gap:11px;font-size:12.5px; box-shadow:0 8px 30px rgba(0,0,0,0.45);animation:tin 0.32s cubic-bezier(.34,1.56,.64,1);max-width:300px} .toast.success{border-color:rgba(127,255,212,0.28)} .toast.error{border-color:rgba(255,107,157,0.28)} .toast.xp{border-color:rgba(255,215,0,0.28)} @keyframes tin{from{transform:translateX(110%);opacity:0}to{transform:translateX(0);opacity:1}} .overlay{position:fixed;inset:0;z-index:1000;background:rgba(8,6,16,0.82); backdrop-filter:blur(10px);display:flex;align-items:center;justify-content:center; padding:18px;animation:fin 0.18s ease} .modal{background:var(--surface);border:1px solid var(--border-bright);border-radius:22px; padding:26px;width:100%;max-width:470px;max-height:90vh;overflow-y:auto; animation:min 0.28s cubic-bezier(.34,1.56,.64,1)} @keyframes fin{from{opacity:0}to{opacity:1}} @keyframes min{from{transform:scale(0.88) translateY(22px);opacity:0}to{transform:scale(1) translateY(0);opacity:1}} .cup{width:34px;height:40px;border:2px solid var(--border-bright);border-radius:3px 3px 8px 8px; cursor:pointer;overflow:hidden;position:relative;transition:all 0.2s;flex-shrink:0} .cup.filled{border-color:var(--sky)} .cup-fill{position:absolute;bottom:0;left:0;right:0;background:linear-gradient(180deg,rgba(135,206,235,0.6),rgba(135,206,235,0.9));transition:height 0.4s cubic-bezier(.34,1.56,.64,1)} .cup:hover{transform:scale(1.06)} @keyframes splash{0%{transform:scale(1)}50%{transform:scale(1.15)}100%{transform:scale(1)}} .cup.splash{animation:splash 0.35s ease} .hm-cell{width:18px;height:18px;border-radius:4px;cursor:default;transition:transform 0.15s} .hm-cell:hover{transform:scale(1.3)} .g2{display:grid;grid-template-columns:1fr 1fr;gap:14px} .g3{display:grid;grid-template-columns:repeat(3,1fr);gap:14px} .g4{display:grid;grid-template-columns:repeat(4,1fr);gap:14px} @media(max-width:900px){.g4{grid-template-columns:repeat(2,1fr)}} @media(max-width:600px){.g2,.g3,.g4{grid-template-columns:1fr}} .pe{animation:pi 0.3s ease} @keyframes pi{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}} .search-bar{position:fixed;top:0;left:0;right:0;z-index:2000;background:rgba(10,8,18,0.96); backdrop-filter:blur(20px);border-bottom:1px solid var(--border-bright); padding:16px 24px;animation:fin 0.18s ease;display:flex;gap:12px;align-items:center} .flex{display:flex}.fac{align-items:center}.fjb{justify-content:space-between} .gap2{gap:8px}.gap3{gap:12px}.gap4{gap:16px} .mb2{margin-bottom:8px}.mb3{margin-bottom:12px}.mb4{margin-bottom:16px} .mt2{margin-top:8px}.mt4{margin-top:16px}.w100{width:100%} .tm{color:var(--text-muted)}.tsm{font-size:12.5px}.txs{font-size:11px} .fb{font-weight:700}.fs{font-weight:600} .divider{height:1px;background:var(--border);margin:14px 0} .label{font-size:11.5px;color:var(--text-muted);display:block;margin-bottom:5px;font-weight:500} .sp{margin-bottom:20px}`;
const PATHS = {
dashboard: “M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z M9 22V12h6v10”,
nutrition: “M12 2a10 10 0 1 0 0 20 M8 14s1.5 2 4 2 4-2 4-2 M9 9h.01 M15 9h.01”,
fitness: “M6 4v16 M18 4v16 M6 12h12 M3 8h3 M18 8h3”,
habits: “M9 11l3 3L22 4 M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11”,
skin: “M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z”,
budget: “M12 1v22 M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6”,
goals: “M12 20h9 M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z”,
ai: “M12 2L2 7l10 5 10-5-10-5z M2 17l10 5 10-5 M2 12l10 5 10-5”,
progress: “M23 6l-9.5 9.5-5-5L1 18”,
settings: “M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6z M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z”,
plus: “M12 5v14 M5 12h14”, x: “M18 6L6 18 M6 6l12 12”, check: “M20 6L9 17l-5-5”,
send: “M22 2L11 13 M22 2L15 22l-4-9-9-4 22-7z”,
lock: “M19 11H5a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2z M7 11V7a5 5 0 0 1 10 0v4”,
search: “M21 21l-4.35-4.35 M17 11A6 6 0 1 1 5 11a6 6 0 0 1 12 0z”,
download: “M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4 M7 10l5 5 5-5 M12 15V3”,
upload: “M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4 M17 8l-5-5-5 5 M12 3v12”,
sleep: “M17 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2z”,
body: “M12 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z M6 22v-4a6 6 0 0 1 12 0v4”,
journal: “M4 19.5A2.5 2.5 0 0 1 6.5 17H20 M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z”,
cycle: “M12 2a10 10 0 1 0 0 20A10 10 0 0 0 12 2z M12 6v6l4 2”,
bill: “M9 14l2 2 4-4 M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z”,
clipboard: “M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2 M9 2h6a1 1 0 0 1 0 2H9a1 1 0 0 1 0-2z”,
refresh: “M23 4v6h-6 M1 20v-6h6 M3.51 9a9 9 0 0 1 14.85-3.36L23 10 M1 14l4.64 4.36A9 9 0 0 0 20.49 15”,
star: “M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z”,
flame: “M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 2.5z”,
zap: “M13 2L3 14h9l-1 8 10-12h-9l1-8z”,
trophy: “M6 9H4.5a2.5 2.5 0 0 1 0-5H6 M18 9h1.5a2.5 2.5 0 0 0 0-5H18 M4 22h16 M18 2H6v7a6 6 0 0 0 12 0V2z”,
};
function Ic(_a) {
var { n, size = 20, color = “currentColor” } = _a, p = __rest(_a, [“n”, “size”, “color”]);
const d = PATHS[n] || PATHS.star;
return (React.createElement(“svg”, Object.assign({ width: size, height: size, viewBox: “0 0 24 24”, fill: “none”, stroke: color, strokeWidth: “2”, strokeLinecap: “round”, strokeLinejoin: “round”, style: { flexShrink: 0 } }, p), d.split(” M”).map((seg, i) => React.createElement(“path”, { key: i, d: i === 0 ? seg : “M” + seg }))));
}
function useToast() {
const [toasts, setToasts] = useState([]);
const toast = useCallback((msg, type = “success”) => {
const id = Date.now() + Math.random();
setToasts(t => […t, { id, msg, type }]);
setTimeout(() => setToasts(t => t.filter(x => x.id !== id)), 3200);
}, []);
return { toasts, toast };
}
function Toasts({ toasts }) {
const icons = { success: “✨”, error: “⚠️”, xp: “⭐” };
return (React.createElement(“div”, { className: “toasts” }, toasts.map(t => React.createElement(“div”, { key: t.id, className: `toast ${t.type}` },
React.createElement(“span”, null, icons[t.type] || “✨”),
React.createElement(“span”, null, t.msg)))));
}
// ══ PWA REGISTRATION + NOTIFICATIONS ════════════════════════════════════════
function usePWA(data, toast) {
const [installPrompt, setInstallPrompt] = useState(null);
const [installed, setInstalled] = useState(false);
const [notifStatus, setNotifStatus] = useState(typeof Notification !== “undefined” ? Notification.permission : “unsupported”);
// Register service worker
useEffect(() => {
if (!(“serviceWorker” in navigator))
return;
navigator.serviceWorker.register(”/sw.js”).then(reg => {
console.log(”[LifeSync] SW registered”, reg.scope);
}).catch(e => console.warn(”[LifeSync] SW failed”, e));
}, []);
// Catch install prompt (Chrome/Edge/Android)
useEffect(() => {
const handler = e => { e.preventDefault(); setInstallPrompt(e); };
window.addEventListener(“beforeinstallprompt”, handler);
window.addEventListener(“appinstalled”, () => setInstalled(true));
// Check if already installed
if (window.matchMedia(”(display-mode: standalone)”).matches)
setInstalled(true);
return () => window.removeEventListener(“beforeinstallprompt”, handler);
}, []);
// Schedule local reminder notifications
useEffect(() => {
var _a;
if (notifStatus !== “granted”)
return;
const timers = [];
// 8pm habit reminder — only if habits not all done
const scheduleHabitReminder = () => {
const now = new Date();
const target = new Date(now);
target.setHours(20, 0, 0, 0);
if (target <= now)
target.setDate(target.getDate() + 1);
const ms = target - now;
timers.push(setTimeout(() => {
const done = data.habits.filter(h => h.doneToday).length;
const total = data.habits.length;
if (done < total) {
new Notification(“LifeSync ✨”, {
body: `${total - done} habit${total - done > 1 ? "s" : ""} left today — don't break your streak! 🔥`,
icon: “/icon-192.png”, tag: “habits”,
});
}
scheduleHabitReminder(); // reschedule for tomorrow
}, ms));
};
// Water reminder every 2 hours during waking hours (8am–10pm)
const scheduleWaterReminder = () => {
var _a, _b, _c;
const now = new Date();
const h = now.getHours();
if (h >= 8 && h < 22) {
const water = ((_b = (_a = data.nutrition) === null || _a === void 0 ? void 0 : _a.water) === null || _b === void 0 ? void 0 : _b.current) || 0;
const goal = ((_c = data.settings) === null || _c === void 0 ? void 0 : _c.waterGoal) || 8;
if (water < goal) {
timers.push(setTimeout(() => {
new Notification(“💧 Water time!”, {
body: `${water} of ${goal} cups logged. Stay hydrated! `,
icon: “/icon-192.png”, tag: “water”,
});
scheduleWaterReminder();
}, 2 * 60 * 60 * 1000));
}
}
};
// Bill due-soon alert — check once on load
const billsDueSoon = (((_a = data.budget) === null || _a === void 0 ? void 0 : _a.bills) || []).filter(b => {
if (b.paid)
return false;
const today = new Date().getDate();
return b.dueDay >= today && b.dueDay <= today + 3;
});
if (billsDueSoon.length > 0) {
setTimeout(() => {
new Notification(“💰 Bills due soon”, {
body: billsDueSoon.map(b => `${b.emoji} ${b.name} — $${b.amount} due ${b.dueDay}th`).join(”\n”),
icon: “/icon-192.png”, tag: “bills”,
});
}, 3000);
}
scheduleHabitReminder();
scheduleWaterReminder();
return () => timers.forEach(clearTimeout);
}, [notifStatus, data.habits, data.nutrition, data.settings, data.budget]);
const requestNotifs = async () => {
if (typeof Notification === “undefined”)
return;
const result = await Notification.requestPermission();
setNotifStatus(result);
if (result === “granted”)
toast(“Notifications enabled! 🔔”, “success”);
};
const install = async () => {
if (!installPrompt)
return;
installPrompt.prompt();
const { outcome } = await installPrompt.userChoice;
if (outcome === “accepted”) {
setInstalled(true);
toast(“LifeSync installed! 🎉”, “success”);
}
setInstallPrompt(null);
};
return { installed, installPrompt, notifStatus, requestNotifs, install };
}
// ══ ZEPP SYNC HOOK ═══════════════════════════════════════════════════════════
// Polls localStorage for the zepp_last_sync key that the Zepp Side Service
// writes after each BLE sync. When new data arrives, merges it into LifeSync.
function useZeppSync(setData, toast) {
const [syncState, setSyncState] = useState(() => {
try {
const s = localStorage.getItem(“zepp_last_sync”);
return s ? JSON.parse(s) : null;
}
catch (_a) {
return null;
}
});
// Poll every 5s — only updates syncState (pure, no side effects)
useEffect(() => {
const interval = setInterval(() => {
try {
const raw = localStorage.getItem(“zepp_last_sync”);
if (!raw)
return;
const parsed = JSON.parse(raw);
setSyncState(prev => {
if (!prev || parsed.timestamp > prev.timestamp)
return parsed;
return prev;
});
}
catch (_a) { }
}, 5000);
return () => clearInterval(interval);
}, []);
// React to new syncState — pull merged data from localStorage into app state
const prevTsRef = useRef(0);
useEffect(() => {
var _a, _b, _c;
if (!syncState)
return;
if (syncState.timestamp <= prevTsRef.current)
return;
prevTsRef.current = syncState.timestamp;
try {
const fullRaw = localStorage.getItem(“lifesync-v6”);
if (!fullRaw)
return;
const fresh = JSON.parse(fullRaw);
if (!fresh.zeppSync)
return;
setData(d => (Object.assign(Object.assign({}, d), { zeppSync: fresh.zeppSync, sleep: fresh.sleep || d.sleep, habits: fresh.habits || d.habits })));
toast(`⌚ Amazfit synced · ${((_b = (_a = syncState.summary) === null || _a === void 0 ? void 0 : _a.steps) === null || _b === void 0 ? void 0 : _b.toLocaleString()) || "—"} steps · ${((_c = syncState.summary) === null || _c === void 0 ? void 0 : _c.sleepHours) || "—"}h sleep`, “success”);
}
catch (_d) { }
}, [syncState, setData, toast]);
return syncState;
}
// ══ ZEPP SYNC PANEL (shown in Settings) ══════════════════════════════════════
function ZeppSyncPanel({ data, setData, toast }) {
var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m, _o, _p, _q, _r, _s, _t, _u;
const syncState = useZeppSync(setData, toast);
const zs = data.zeppSync;
const connected = !!zs;
const stressLabel = v => { if (!v)
return “—”; if (v < 30)
return “Relaxed 😌”; if (v < 60)
return “Moderate 😐”; if (v < 80)
return “High 😰”; return “Very High 😨”; };
const wearLabel = w => { if (w === 1 || w === 2)
return “✓ Wearing”; if (w === 0)
return “Off wrist”; return “—”; };
return (React.createElement(“div”, { className: “card”, style: { borderColor: connected ? “rgba(199,125,255,0.3)” : “var(–border)” } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: connected ? 14 : 0 } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 20 } }, “\u231A”),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Amazfit / Zepp Watch”),
((_a = zs === null || zs === void 0 ? void 0 : zs.device) === null || _a === void 0 ? void 0 : _a.lastSync) && React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)”, marginTop: 2 } },
“Last sync: “,
zs.device.lastSync))),
React.createElement(“span”, { className: `b ${connected ? "bv" : "bi"}`, style: { fontSize: 9.5 } }, connected ? “⌚ Connected” : “Not yet synced”)),
connected && zs && (React.createElement(React.Fragment, null,
React.createElement(“div”, { className: “g4”, style: { marginBottom: 14 } }, [
{ icon: “❤️”, val: ((_b = zs.heartRate) === null || _b === void 0 ? void 0 : _b.last) ? (zs.heartRate.last + “ bpm”) : “—”, label: “Heart Rate”, sub: ((_c = zs.heartRate) === null || _c === void 0 ? void 0 : _c.resting) ? `Resting: ${zs.heartRate.resting}` : “” },
{ icon: “😴”, val: zs.sleep ? `${(((_f = (_e = (_d = data.sleep) === null || _d === void 0 ? void 0 : _d.logs) === null || _e === void 0 ? void 0 : _e[0]) === null || _f === void 0 ? void 0 : _f.hours) || 0)}h` : “—”, label: “Last Sleep”, sub: ((_k = (_j = (_h = (_g = data.sleep) === null || _g === void 0 ? void 0 : _g.logs) === null || _h === void 0 ? void 0 : _h[0]) === null || _j === void 0 ? void 0 : _j.notes) === null || _k === void 0 ? void 0 : _k.includes(“Synced”)) ? `Score: ${((_l = data.sleep.logs[0].notes.match(/Score: (\w+)/)) === null || _l === void 0 ? void 0 : _l[1]) || "—"}` : “” },
{ icon: “🩸”, val: ((_m = zs.spo2) === null || _m === void 0 ? void 0 : _m.current) ? (zs.spo2.current + “%”) : “—”, label: “SpO2”, sub: “blood oxygen” },
{ icon: “🧠”, val: ((_o = zs.stress) === null || _o === void 0 ? void 0 : _o.current) != null ? stressLabel(zs.stress.current) : “—”, label: “Stress”, sub: ((_p = zs.stress) === null || _p === void 0 ? void 0 : _p.current) != null ? `${zs.stress.current}/100` : “” },
].map((s, i) => (React.createElement(“div”, { key: i, className: “sc” },
React.createElement(“div”, { style: { fontSize: 18 } }, s.icon),
React.createElement(“div”, { style: { fontSize: 13, fontWeight: 700, color: “var(–violet)”, lineHeight: 1.2 } }, s.val),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } }, s.label),
s.sub && React.createElement(“div”, { style: { fontSize: 10, color: “var(–text-dim)” } }, s.sub))))),
zs.activity && (React.createElement(“div”, { style: { display: “flex”, gap: 8, flexWrap: “wrap”, marginBottom: 12 } },
zs.activity.steps != null && React.createElement(“span”, { className: “b bv” },
“\uD83D\uDEB6 “,
zs.activity.steps.toLocaleString(),
“ steps”),
zs.activity.caloriesBurned != null && React.createElement(“span”, { className: “b bp” },
“\uD83D\uDD25 “,
zs.activity.caloriesBurned,
“ kcal burned”),
zs.activity.distanceMeters != null && React.createElement(“span”, { className: “b bm” },
“\uD83D\uDCCD “,
(zs.activity.distanceMeters / 1000).toFixed(1),
“ km”),
zs.activity.fatBurnMins != null && React.createElement(“span”, { className: “b bg” },
“\u26A1 “,
zs.activity.fatBurnMins,
“ fat burn mins”))),
React.createElement(“div”, { style: { display: “flex”, gap: 8, flexWrap: “wrap”, marginBottom: 10 } },
((_q = zs.pai) === null || _q === void 0 ? void 0 : _q.total) != null && React.createElement(“span”, { className: “b bg” },
“PAI: “,
zs.pai.total,
“ total \u00B7 “,
zs.pai.today,
“ today”),
((_r = zs.workout) === null || _r === void 0 ? void 0 : _r.vo2Max) && React.createElement(“span”, { className: “b bv” },
“VO2 Max: “,
zs.workout.vo2Max),
((_s = zs.bodyTemp) === null || _s === void 0 ? void 0 : _s.celsius) && React.createElement(“span”, { className: “b bs” },
“\uD83C\uDF21 “,
zs.bodyTemp.celsius,
“\u00B0C”),
((_t = zs.device) === null || _t === void 0 ? void 0 : _t.battery) != null && React.createElement(“span”, { className: “b bi” },
“\uD83D\uDD0B “,
zs.device.battery,
“%”),
((_u = zs.device) === null || _u === void 0 ? void 0 : *u.wearing) != null && React.createElement(“span”, { className: “b bm” }, wearLabel(zs.device.wearing))))),
!connected && (React.createElement(“div”, { style: { marginTop: 12 } },
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, lineHeight: 1.7, marginBottom: 10 } }, “Sync your Amazfit watch directly into LifeSync \u2014 no cloud account needed.”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 8 } }, [
[“1”, “Install Node.js if you don’t have it — nodejs.org”],
[“2”, “Install the Zepp CLI: npm install -g @zeppos/zeus-cli”],
[“3”, “Copy the zepp-lifesync/ folder from your LifeSync download”],
[“4”, “Run: zeus preview  inside that folder”],
[“5”, “Open Zepp App on your phone → Settings → Developer Mode → Scan QR”],
[“6”, “Tap "Sync Now" on your watch — data appears here instantly ✨”],
].map(([n, s]) => (React.createElement(“div”, { key: n, style: { display: “flex”, gap: 10, alignItems: “flex-start” } },
React.createElement(“div”, { style: { width: 20, height: 20, borderRadius: “50%”, background: “rgba(199,125,255,0.2)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 10, fontWeight: 700, color: “var(–violet)”, flexShrink: 0, marginTop: 1 } }, n),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)”, lineHeight: 1.5 } }, s))))),
React.createElement(“div”, { style: { marginTop: 12, fontSize: 11, color: “var(–text-dim)”, fontStyle: “italic” } }, “Syncs: heart rate, resting HR, sleep stages, SpO2, stress, PAI, steps, calories burned, distance, VO2 max, body temp”)))));
}
function Ring({ value, max, size = 80, stroke = 6, color = “var(–violet)”, label, sub }) {
const r = (size - stroke * 2) / 2, circ = 2 * Math.PI * r, pct = Math.min((value / max) * 100, 100), off = circ - (pct / 100) * circ;
return (React.createElement(“div”, { className: “ring-wrap”, style: { width: size, height: size } },
React.createElement(“svg”, { width: size, height: size, style: { transform: “rotate(-90deg)” } },
React.createElement(“circle”, { cx: size / 2, cy: size / 2, r: r, fill: “none”, stroke: “var(–surface2)”, strokeWidth: stroke }),
React.createElement(“circle”, { cx: size / 2, cy: size / 2, r: r, fill: “none”, stroke: color, strokeWidth: stroke, strokeDasharray: circ, strokeDashoffset: off, strokeLinecap: “round”, style: { transition: “stroke-dashoffset 0.9s ease” } })),
(label || sub) && (React.createElement(“div”, { className: “ring-label” },
label && React.createElement(“div”, { style: { fontSize: size / 4.8, fontWeight: 700, lineHeight: 1 } }, label),
sub && React.createElement(“div”, { style: { fontSize: size / 7.5, color: “var(–text-muted)”, lineHeight: 1.3, marginTop: 1 } }, sub)))));
}
function BarChart({ data, color = “var(–violet)”, height = 65, labels }) {
const max = Math.max(…data, 1);
return (React.createElement(“div”, null,
React.createElement(“div”, { className: “bar-chart”, style: { height, alignItems: “flex-end” } }, data.map((v, i) => (React.createElement(“div”, { key: i, className: “bar”, style: { flex: 1, background: i === data.length - 1 ? color : `${color}55`,
height: `${(v / max) * height}px`, transition: `height 0.55s ease ${i * 0.04}s` } })))),
labels && (React.createElement(“div”, { style: { display: “flex”, justifyContent: “space-between”, marginTop: 5, fontSize: 10, color: “var(–text-dim)” } }, labels.map((l, i) => React.createElement(“span”, { key: i }, l))))));
}
function Modal({ open, onClose, title, children, maxWidth = 470 }) {
useEffect(() => {
const h = e => { if (e.key === “Escape”)
onClose(); };
if (open)
document.addEventListener(“keydown”, h);
return () => document.removeEventListener(“keydown”, h);
}, [open, onClose]);
if (!open)
return null;
return (React.createElement(“div”, { className: “overlay”, onClick: onClose },
React.createElement(“div”, { className: “modal”, onClick: e => e.stopPropagation(), style: { maxWidth } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 20 } },
React.createElement(“h3”, { style: { fontWeight: 700, fontSize: 19 } }, title),
React.createElement(“button”, { className: “btn btn-g btn-ic”, onClick: onClose },
React.createElement(Ic, { n: “x”, size: 16 }))),
children)));
}
function Field({ label, children, style }) {
return React.createElement(“div”, { style: style },
React.createElement(“label”, { className: “label” }, label),
children);
}
const XP_PER_LEVEL = lvl => lvl * 250;
function calcLevel(xp) {
let lvl = 1, rem = xp;
while (rem >= XP_PER_LEVEL(lvl)) {
rem -= XP_PER_LEVEL(lvl);
lvl++;
}
return { level: lvl, xpInLevel: rem, xpNeeded: XP_PER_LEVEL(lvl) };
}
const TODAY = () => new Date().toLocaleDateString(“en-US”, { month: “short”, day: “numeric” });
const DAYS_LEFT = d => { if (!d)
return null; const yr = new Date().getFullYear(); const t = new Date(d + “,” + yr); const t2 = new Date(d + “,” + (yr + 1)); const best = t > Date.now() ? t : t2; return Math.max(0, Math.ceil((best - Date.now()) / 86400000)); };
const WEEK_LABELS = [“Mon”, “Tue”, “Wed”, “Thu”, “Fri”, “Sat”, “Sun”];
const catSpent = (txs, name) => txs.filter(t => t.category === name && t.amount < 0).reduce((s, t) => s + Math.abs(t.amount), 0);
function getCyclePhase(lastStart, cycleLen) {
const yr = new Date().getFullYear();
const start = new Date(lastStart + “, “ + yr);
const day = Math.floor((Date.now() - start.getTime()) / 86400000) + 1;
const d = ((day - 1) % cycleLen) + 1;
if (d <= 5)
return { phase: “Menstrual”, color: “var(–rose)”, day: d, emoji: “🌸”, advice: “Rest & gentle movement. Iron-rich foods.” };
if (d <= 13)
return { phase: “Follicular”, color: “var(–mint)”, day: d, emoji: “🌱”, advice: “Energy rising! Great for strength training.” };
if (d <= 16)
return { phase: “Ovulation”, color: “var(–gold)”, day: d, emoji: “⭐”, advice: “Peak energy & confidence — HIIT time!” };
return { phase: “Luteal”, color: “var(–violet)”, day: d, emoji: “🌙”, advice: “Ease up, prioritize sleep & magnesium.” };
}
function makeData() {
return {
user: { name: “Aria”, avatar: “🌸”, xp: 1340, joinDate: “Jan 1 2026”, lastSaved: new Date().toISOString() },
settings: { calorieGoal: 1800, proteinGoal: 120, carbsGoal: 200, fatGoal: 60, waterGoal: 8,
workoutGoalPerWeek: 5, savingsGoal: 1000, currency: “USD”, weightUnit: “lbs”,
gender: “female” },
streaks: { habits: 12, workouts: 5, logging: 21, skincare: 8, sleep: 4 },
habits: [
{ id: 1, name: “Drink 2L water”, icon: “💧”, category: “Health”, streak: 12, doneToday: false, target: 8, current: 5, isNumeric: true },
{ id: 2, name: “Morning skincare”, icon: “✨”, category: “Skincare”, streak: 8, doneToday: false, target: 1, current: 0, isNumeric: false },
{ id: 3, name: “10k steps”, icon: “🚶”, category: “Fitness”, streak: 5, doneToday: true, target: 10000, current: 10432, isNumeric: true },
{ id: 4, name: “Evening journal”, icon: “📓”, category: “Mind”, streak: 21, doneToday: false, target: 1, current: 0, isNumeric: false },
{ id: 5, name: “Supplements”, icon: “💊”, category: “Health”, streak: 3, doneToday: false, target: 1, current: 0, isNumeric: false },
{ id: 6, name: “Stretch 15 min”, icon: “🧘”, category: “Fitness”, streak: 7, doneToday: true, target: 1, current: 1, isNumeric: false },
],
nutrition: {
calories: { current: 1420, goal: 1800 }, protein: { current: 72, goal: 120 },
carbs: { current: 160, goal: 200 }, fat: { current: 48, goal: 60 }, water: { current: 5, goal: 8 },
logs: [
{ id: 1, name: “Acai bowl”, time: “8:30 AM”, cal: 380, protein: 8, carbs: 65, fat: 10, emoji: “🫐” },
{ id: 2, name: “Grilled chicken salad”, time: “1:00 PM”, cal: 520, protein: 42, carbs: 30, fat: 22, emoji: “🥗” },
{ id: 3, name: “Greek yogurt + honey”, time: “4:00 PM”, cal: 180, protein: 14, carbs: 28, fat: 3, emoji: “🍯” },
{ id: 4, name: “Matcha latte”, time: “9:00 AM”, cal: 120, protein: 4, carbs: 18, fat: 4, emoji: “🍵” },
],
weekData: [1650, 1800, 1720, 1900, 1560, 1800, 1420],
},
fitness: {
workoutsThisWeek: 4,
workouts: [
{ id: 1, name: “Full Body Strength”, date: “Today”, duration: 55, calories: 320, type: “Strength”, emoji: “🏋️”, exercises: [“Squats 4×8”, “Bench 3×10”, “Deadlift 3×6”, “OHP 3×10”] },
{ id: 2, name: “Morning Run 5K”, date: “Yesterday”, duration: 28, calories: 250, type: “Cardio”, emoji: “🏃”, exercises: [“5K run @ 5:35/km”] },
{ id: 3, name: “Pilates Flow”, date: “Mon”, duration: 45, calories: 180, type: “Flexibility”, emoji: “🧘”, exercises: [“Core work”, “Hip flexors”, “Spine mobility”] },
{ id: 4, name: “HIIT Circuit”, date: “Sun”, duration: 30, calories: 280, type: “HIIT”, emoji: “⚡”, exercises: [“Burpees 4×15”, “Jump squats 4×20”, “Mountain climbers 4×30s”] },
],
weekData: [320, 250, 0, 180, 280, 0, 320],
templates: [
{ id: 1, name: “Push Day”, emoji: “💪”, exercises: [“Bench Press 4×8”, “Incline DB 3×10”, “Shoulder Press 3×10”, “Tricep Pushdown 3×12”, “Lateral Raises 3×15”] },
{ id: 2, name: “Pull Day”, emoji: “🏋️”, exercises: [“Pull-ups 4×8”, “Barbell Row 4×8”, “Face Pulls 3×15”, “Bicep Curls 3×12”, “Hammer Curls 3×12”] },
{ id: 3, name: “Leg Day”, emoji: “🦵”, exercises: [“Squats 4×8”, “Romanian Deadlift 3×10”, “Leg Press 3×12”, “Leg Curl 3×12”, “Calf Raises 4×15”] },
{ id: 4, name: “HIIT 30”, emoji: “⚡”, exercises: [“Burpees 4×15”, “Jump Squats 4×20”, “Mountain Climbers 4×30s”, “Box Jumps 3×10”, “Sprint Intervals 5×30s”] },
],
},
skincare: {
streak: 8, skinScore: 78,
routine: {
morning: [
{ name: “Vitamin C Serum”, brand: “Paula’s Choice”, done: true },
{ name: “SPF 50 Sunscreen”, brand: “La Roche-Posay”, done: true },
{ name: “Hydrating Toner”, brand: “Laneige”, done: false },
],
evening: [
{ name: “Oil Cleanser”, brand: “DHC”, done: false },
{ name: “Retinol Serum”, brand: “The Ordinary”, done: false },
{ name: “Night Cream”, brand: “CeraVe”, done: false },
],
},
weekData: [1, 1, 1, 0, 1, 1, 1],
products: [
{ id: 1, name: “Vitamin C Serum”, brand: “Paula’s Choice”, category: “Treatment”, emoji: “🍊”, rating: 5, replenishDate: “Jun 15” },
{ id: 2, name: “SPF 50 Sunscreen”, brand: “La Roche-Posay”, category: “Protection”, emoji: “☀️”, rating: 5, replenishDate: “Jul 1” },
{ id: 3, name: “Retinol Serum”, brand: “The Ordinary”, category: “Treatment”, emoji: “🧴”, rating: 4, replenishDate: “Aug 10” },
{ id: 4, name: “Night Cream”, brand: “CeraVe”, category: “Moisturizer”, emoji: “🌙”, rating: 5, replenishDate: “Sep 5” },
],
},
sleep: {
goalHours: 8, bedtimeGoal: “11:00 PM”,
logs: [
{ id: 1, date: “May 12”, bedtime: “11:00 PM”, wake: “7:00 AM”, hours: 8.0, quality: 4, notes: “Slept well” },
{ id: 2, date: “May 11”, bedtime: “12:30 AM”, wake: “7:30 AM”, hours: 7.0, quality: 3, notes: “Took a while” },
{ id: 3, date: “May 10”, bedtime: “10:30 PM”, wake: “6:30 AM”, hours: 8.0, quality: 5, notes: “Perfect sleep” },
{ id: 4, date: “May 9”, bedtime: “1:00 AM”, wake: “8:00 AM”, hours: 7.0, quality: 3, notes: “” },
{ id: 5, date: “May 8”, bedtime: “11:30 PM”, wake: “7:00 AM”, hours: 7.5, quality: 4, notes: “” },
{ id: 6, date: “May 7”, bedtime: “10:00 PM”, wake: “6:00 AM”, hours: 8.0, quality: 5, notes: “Early night” },
{ id: 7, date: “May 6”, bedtime: “1:30 AM”, wake: “7:30 AM”, hours: 6.0, quality: 2, notes: “Stressed” },
],
},
body: {
measurements: [
{ id: 1, date: “May 12”, weight: 134.9, waist: 68, hips: 92, chest: 86, arms: 28, thighs: 54 },
{ id: 2, date: “May 1”, weight: 135.6, waist: 69, hips: 93, chest: 86, arms: 28, thighs: 55 },
{ id: 3, date: “Apr 15”, weight: 136.3, waist: 70, hips: 93, chest: 87, arms: 28, thighs: 55 },
{ id: 4, date: “Apr 1”, weight: 137.2, waist: 71, hips: 94, chest: 87, arms: 29, thighs: 56 },
],
},
cycle: {
lastPeriodStart: “Apr 28”, cycleLength: 28, periodLength: 5,
logs: [
{ date: “Apr 28”, flow: “medium”, cramps: 3, mood: “tired”, notes: “” },
{ date: “Apr 29”, flow: “heavy”, cramps: 4, mood: “irritable”, notes: “” },
{ date: “Apr 30”, flow: “medium”, cramps: 2, mood: “okay”, notes: “” },
{ date: “May 1”, flow: “light”, cramps: 1, mood: “better”, notes: “” },
{ date: “May 2”, flow: “spotting”, cramps: 0, mood: “good”, notes: “” },
],
},
journal: {
entries: [
{ id: 1, date: “May 12”, mood: “😊”, energy: 8, tags: [”#grateful”, “#productive”], text: “Really good day. Hit my workout and meal prep goals. Skin is looking clearer.”, moodScore: 8 },
{ id: 2, date: “May 11”, mood: “😐”, energy: 6, tags: [”#tired”, “#stressed”], text: “Work was hectic. Didn’t work out but made healthy food choices.”, moodScore: 6 },
{ id: 3, date: “May 10”, mood: “😄”, energy: 9, tags: [”#happy”, “#grateful”], text: “Best day in a while! Morning run felt amazing. Everything clicking.”, moodScore: 9 },
{ id: 4, date: “May 9”, mood: “😔”, energy: 5, tags: [”#anxious”, “#tired”], text: “Hard day. Stressed about finances.”, moodScore: 5 },
{ id: 5, date: “May 8”, mood: “🙂”, energy: 7, tags: [”#calm”, “#productive”], text: “Decent day. Got a lot done.”, moodScore: 7 },
],
},
budget: {
savingsGoal: 1000,
incomeSources: [
{ id: 1, name: “Salary”, amount: 3800, emoji: “💼”, recurring: true },
{ id: 2, name: “Freelance”, amount: 400, emoji: “💻”, recurring: false },
],
categories: [
{ id: 1, name: “Groceries”, budget: 500, emoji: “🛒”, color: “var(–mint)” },
{ id: 2, name: “Dining out”, budget: 200, emoji: “🍽️”, color: “var(–rose)” },
{ id: 3, name: “Skincare & Beauty”, budget: 150, emoji: “✨”, color: “var(–violet)” },
{ id: 4, name: “Gym & Wellness”, budget: 100, emoji: “💪”, color: “var(–indigo)” },
{ id: 5, name: “Shopping”, budget: 300, emoji: “🛍️”, color: “var(–peach)” },
{ id: 6, name: “Transport”, budget: 150, emoji: “🚇”, color: “var(–sky)” },
{ id: 7, name: “Subscriptions”, budget: 100, emoji: “📱”, color: “var(–gold)” },
{ id: 8, name: “Healthcare”, budget: 80, emoji: “🏥”, color: “var(–mint)” },
],
transactions: [
{ id: 1, date: “May 12”, name: “Trader Joe’s”, amount: -87.40, category: “Groceries”, emoji: “🛒”, note: “” },
{ id: 2, date: “May 12”, name: “Freelance payment”, amount: 400.00, category: “Income”, emoji: “💻”, note: “Logo design” },
{ id: 3, date: “May 11”, name: “Sephora”, amount: -64.50, category: “Skincare & Beauty”, emoji: “✨”, note: “” },
{ id: 4, date: “May 11”, name: “Chipotle”, amount: -13.85, category: “Dining out”, emoji: “🍽️”, note: “” },
{ id: 5, date: “May 10”, name: “Uber”, amount: -18.20, category: “Transport”, emoji: “🚗”, note: “” },
{ id: 6, date: “May 10”, name: “Costco”, amount: -124.60, category: “Groceries”, emoji: “🛒”, note: “Monthly bulk” },
{ id: 7, date: “May 9”, name: “Netflix”, amount: -15.99, category: “Subscriptions”, emoji: “📺”, note: “” },
{ id: 8, date: “May 9”, name: “Gym membership”, amount: -45.00, category: “Gym & Wellness”, emoji: “🏋️”, note: “” },
{ id: 9, date: “May 8”, name: “ZARA”, amount: -89.00, category: “Shopping”, emoji: “🛍️”, note: “” },
{ id: 10, date: “May 8”, name: “Spotify”, amount: -9.99, category: “Subscriptions”, emoji: “🎵”, note: “” },
{ id: 11, date: “May 7”, name: “Whole Foods”, amount: -56.30, category: “Groceries”, emoji: “🛒”, note: “” },
{ id: 12, date: “May 6”, name: “Starbucks”, amount: -6.75, category: “Dining out”, emoji: “☕”, note: “” },
{ id: 13, date: “May 5”, name: “Salary deposit”, amount: 3800.00, category: “Income”, emoji: “💼”, note: “May paycheck” },
{ id: 14, date: “May 5”, name: “Amazon”, amount: -42.99, category: “Shopping”, emoji: “📦”, note: “Supplements” },
{ id: 15, date: “May 4”, name: “CVS Pharmacy”, amount: -22.40, category: “Healthcare”, emoji: “🏥”, note: “” },
{ id: 16, date: “May 3”, name: “Sweetgreen”, amount: -16.50, category: “Dining out”, emoji: “🥗”, note: “” },
{ id: 17, date: “May 2”, name: “The Ordinary”, amount: -28.00, category: “Skincare & Beauty”, emoji: “🧴”, note: “” },
{ id: 18, date: “May 1”, name: “Metro card refill”, amount: -33.00, category: “Transport”, emoji: “🚇”, note: “” },
],
bills: [
{ id: 1, name: “Rent”, amount: 1400, dueDay: 1, emoji: “🏠”, paid: true, autoPay: true },
{ id: 2, name: “Electric”, amount: 85, dueDay: 15, emoji: “💡”, paid: false, autoPay: false },
{ id: 3, name: “Internet”, amount: 60, dueDay: 18, emoji: “📡”, paid: false, autoPay: true },
{ id: 4, name: “Phone”, amount: 45, dueDay: 22, emoji: “📱”, paid: false, autoPay: true },
{ id: 5, name: “Netflix”, amount: 15.99, dueDay: 9, emoji: “📺”, paid: true, autoPay: true },
{ id: 6, name: “Spotify”, amount: 9.99, dueDay: 8, emoji: “🎵”, paid: true, autoPay: true },
{ id: 7, name: “Gym”, amount: 45, dueDay: 9, emoji: “💪”, paid: true, autoPay: false },
],
assets: [
{ id: 1, name: “Checking Account”, amount: 3200, emoji: “🏦” },
{ id: 2, name: “Savings Account”, amount: 6800, emoji: “💰” },
{ id: 3, name: “401k”, amount: 12400, emoji: “📈” },
{ id: 4, name: “Roth IRA”, amount: 4800, emoji: “💎” },
],
liabilities: [
{ id: 1, name: “Credit Card”, amount: 420, emoji: “💳” },
{ id: 2, name: “Student Loan”, amount: 8200, emoji: “🎓” },
],
monthlyData: [
{ month: “Jan”, income: 3900, spent: 2600 }, { month: “Feb”, income: 3800, spent: 2900 },
{ month: “Mar”, income: 4100, spent: 2750 }, { month: “Apr”, income: 4000, spent: 3100 },
{ month: “May”, income: 4200, spent: 2840 },
],
},
goals: [
{ id: 1, name: “Reach 127 lbs”, category: “Weight”, current: 134.9, target: 127, unit: “lbs”, deadline: “Aug 1”, emoji: “⚖️”, color: “var(–rose)”, reverse: true },
{ id: 2, name: “Save $10,000”, category: “Budget”, current: 6800, target: 10000, unit: “$”, deadline: “Dec 31”, emoji: “💰”, color: “var(–gold)”, reverse: false },
{ id: 3, name: “Run 5K in 25min”, category: “Fitness”, current: 28, target: 25, unit: “min”, deadline: “Jul 1”, emoji: “🏃”, color: “var(–mint)”, reverse: true },
{ id: 4, name: “30-day clear skin”, category: “Skincare”, current: 21, target: 30, unit: “days”, deadline: “Jun 1”, emoji: “✨”, color: “var(–violet)”, reverse: false },
],
checkins: [
{ id: 1, date: “May 12”, weight: 134.9, mood: 8, energy: 7, notes: “Feeling good! Skin clearing up ✨” },
{ id: 2, date: “May 5”, weight: 135.6, mood: 7, energy: 6, notes: “Little tired but stayed consistent” },
{ id: 3, date: “Apr 28”, weight: 136.3, mood: 9, energy: 8, notes: “Best week yet! Hit all workout goals 💪” },
],
achievements: [
{ id: 1, name: “First Steps”, emoji: “👟”, desc: “Logged your first workout”, unlocked: true, color: “var(–mint)” },
{ id: 2, name: “Hydration Queen”, emoji: “💧”, desc: “Hit water goal 7 days in a row”, unlocked: true, color: “var(–indigo)” },
{ id: 3, name: “Glow Up”, emoji: “✨”, desc: “Complete skincare 7 days straight”, unlocked: true, color: “var(–violet)” },
{ id: 4, name: “Money Moves”, emoji: “💰”, desc: “Save 30% of income for a month”, unlocked: false, color: “var(–gold)” },
{ id: 5, name: “Iron Will”, emoji: “🏋️”, desc: “Work out 5x/week for 4 weeks”, unlocked: false, color: “var(–rose)” },
{ id: 6, name: “Journaling Journey”, emoji: “📓”, desc: “Journal for 21 days straight”, unlocked: true, color: “var(–peach)” },
{ id: 7, name: “Century Club”, emoji: “💯”, desc: “Hit calorie goal 100 days”, unlocked: false, color: “var(–sky)” },
{ id: 8, name: “Sleep Royalty”, emoji: “😴”, desc: “8+ hours sleep 7 days”, unlocked: false, color: “var(–indigo)” },
{ id: 9, name: “Streak Legend”, emoji: “🔥”, desc: “Any habit for 30 days”, unlocked: false, color: “var(–gold)” },
{ id: 10, name: “Budget Boss”, emoji: “📊”, desc: “Stay under budget all month”, unlocked: false, color: “var(–mint)” },
],
messages: [
{ role: “ai”, content: “Hey Aria! ✨ I’m Luna, your personal wellness AI. You’re on a 21-day journaling streak and your skin score is up 8 points this month! What would you like to focus on today?” },
],
};
}
// Empty/fresh data — used by “Start Fresh” button to wipe demo data
function makeEmptyData() {
return {
user: { name: “You”, avatar: “🌸”, xp: 0, joinDate: new Date().toLocaleDateString(“en-US”, { month: “short”, day: “numeric”, year: “numeric” }), lastSaved: new Date().toISOString() },
settings: { calorieGoal: 2000, proteinGoal: 120, carbsGoal: 250, fatGoal: 70, waterGoal: 8,
workoutGoalPerWeek: 4, savingsGoal: 500, currency: “USD”, weightUnit: “lbs”, gender: “male” },
streaks: { habits: 0, workouts: 0, logging: 0, skincare: 0, sleep: 0 },
habits: [],
nutrition: {
calories: { current: 0, goal: 2000 }, protein: { current: 0, goal: 120 },
carbs: { current: 0, goal: 250 }, fat: { current: 0, goal: 70 }, water: { current: 0, goal: 8 },
logs: [],
weekData: [0, 0, 0, 0, 0, 0, 0],
},
fitness: {
workoutsThisWeek: 0, workouts: [], weekData: [0, 0, 0, 0, 0, 0, 0],
templates: [
{ id: 1, name: “Push Day”, emoji: “💪”, exercises: [“Bench Press 4×8”, “Incline DB 3×10”, “Shoulder Press 3×10”, “Tricep Pushdown 3×12”] },
{ id: 2, name: “Pull Day”, emoji: “🏋️”, exercises: [“Pull-ups 4×8”, “Barbell Row 4×8”, “Face Pulls 3×15”, “Bicep Curls 3×12”] },
{ id: 3, name: “Leg Day”, emoji: “🦵”, exercises: [“Squats 4×8”, “Romanian Deadlift 3×10”, “Leg Press 3×12”, “Calf Raises 4×15”] },
{ id: 4, name: “HIIT 30”, emoji: “⚡”, exercises: [“Burpees 4×15”, “Jump Squats 4×20”, “Mountain Climbers 4×30s”] },
],
},
skincare: {
streak: 0, skinScore: 50,
routine: { morning: [], evening: [] },
weekData: [0, 0, 0, 0, 0, 0, 0],
products: [],
},
sleep: {
goalHours: 8, bedtimeGoal: “11:00 PM”,
logs: [],
},
body: { measurements: [] },
cycle: { lastPeriodStart: “Jan 1”, cycleLength: 28, periodLength: 5, logs: [] },
journal: { entries: [] },
budget: {
savingsGoal: 500,
incomeSources: [],
categories: [
{ id: 1, name: “Groceries”, budget: 400, emoji: “🛒”, color: “var(–mint)” },
{ id: 2, name: “Dining out”, budget: 200, emoji: “🍽️”, color: “var(–rose)” },
{ id: 3, name: “Gym & Wellness”, budget: 80, emoji: “💪”, color: “var(–indigo)” },
{ id: 4, name: “Shopping”, budget: 200, emoji: “🛍️”, color: “var(–peach)” },
{ id: 5, name: “Transport”, budget: 150, emoji: “🚇”, color: “var(–sky)” },
{ id: 6, name: “Subscriptions”, budget: 80, emoji: “📱”, color: “var(–gold)” },
{ id: 7, name: “Healthcare”, budget: 60, emoji: “🏥”, color: “var(–mint)” },
],
transactions: [],
bills: [],
assets: [],
liabilities: [],
monthlyData: [
{ month: “Jan”, income: 0, spent: 0 }, { month: “Feb”, income: 0, spent: 0 },
{ month: “Mar”, income: 0, spent: 0 }, { month: “Apr”, income: 0, spent: 0 },
{ month: “May”, income: 0, spent: 0 },
],
},
goals: [],
checkins: [],
achievements: [
{ id: 1, name: “First Steps”, emoji: “👟”, desc: “Logged your first workout”, unlocked: false, color: “var(–mint)” },
{ id: 2, name: “Hydration Hero”, emoji: “💧”, desc: “Hit water goal 7 days in a row”, unlocked: false, color: “var(–indigo)” },
{ id: 3, name: “Glow Up”, emoji: “✨”, desc: “Complete skincare 7 days straight”, unlocked: false, color: “var(–violet)” },
{ id: 4, name: “Money Moves”, emoji: “💰”, desc: “Save 30% of income for a month”, unlocked: false, color: “var(–gold)” },
{ id: 5, name: “Iron Will”, emoji: “🏋️”, desc: “Work out 5x/week for 4 weeks”, unlocked: false, color: “var(–rose)” },
{ id: 6, name: “Journaling Journey”, emoji: “📓”, desc: “Journal for 21 days straight”, unlocked: false, color: “var(–peach)” },
{ id: 7, name: “Century Club”, emoji: “💯”, desc: “Hit calorie goal 100 days”, unlocked: false, color: “var(–sky)” },
{ id: 8, name: “Sleep King”, emoji: “😴”, desc: “8+ hours sleep 7 days”, unlocked: false, color: “var(–indigo)” },
{ id: 9, name: “Streak Legend”, emoji: “🔥”, desc: “Any habit for 30 days”, unlocked: false, color: “var(–gold)” },
{ id: 10, name: “Budget Boss”, emoji: “📊”, desc: “Stay under budget all month”, unlocked: false, color: “var(–mint)” },
],
messages: [
{ role: “ai”, content: “Hey! ✨ I’m Luna, your wellness AI. Fresh start — let’s set you up. What would you like to focus on first: habits, fitness, nutrition, or budget?” },
],
};
}
function WaterCups({ current, goal, onAdd }) {
const [splash, setSplash] = useState(-1);
const tap = i => { if (i >= current) {
setSplash(i);
setTimeout(() => setSplash(-1), 380);
onAdd(i + 1);
} };
return (React.createElement(“div”, { style: { display: “flex”, gap: 6, flexWrap: “wrap”, marginTop: 8 } }, Array.from({ length: goal }).map((*, i) => (React.createElement(“div”, { key: i, className: `cup ${i < current ? "filled" : ""} ${i === splash ? "splash" : ""}`, onClick: () => tap(i), title: i < current ? “Logged” : “Click to log” },
React.createElement(“div”, { className: “cup-fill”, style: { height: i < current ? “100%” : “0%” } }),
React.createElement(“div”, { style: { position: “absolute”, top: “50%”, left: “50%”, transform: “translate(-50%,-50%)”, fontSize: 13, zIndex: 1 } }, i < current ? “💧” : “”))))));
}
function DashPage({ data, setData, toast, setPage }) {
var _a, _b, _c, _d, _e, _f, _g, _h, _j;
const { level, xpInLevel, xpNeeded } = calcLevel(data.user.xp);
const h = new Date().getHours();
const greeting = h < 12 ? “Good morning” : h < 17 ? “Good afternoon” : “Good evening”;
const done = data.habits.filter(x => x.doneToday).length;
const totalSpent = data.budget.transactions.filter(t => t.amount < 0).reduce((s, t) => s + Math.abs(t.amount), 0);
const totalIncome = data.budget.transactions.filter(t => t.amount > 0).reduce((s, t) => s + t.amount, 0);
const networth = data.budget.assets.reduce((s, a) => s + a.amount, 0) - data.budget.liabilities.reduce((s, l) => s + l.amount, 0);
const avgSleep = (data.sleep.logs.slice(0, 7).reduce((s, l) => s + l.hours, 0) / Math.min(data.sleep.logs.length, 7)).toFixed(1);
const cycle = getCyclePhase(data.cycle.lastPeriodStart, data.cycle.cycleLength);
const caloriesLeft = data.settings.calorieGoal - data.nutrition.calories.current;
const addWater = cups => {
setData(d => (Object.assign(Object.assign({}, d), { nutrition: Object.assign(Object.assign({}, d.nutrition), { water: Object.assign(Object.assign({}, d.nutrition.water), { current: cups }) }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 5 }) })));
toast(”+5 XP · Hydration logged 💧”, “xp”);
};
const zs = data.zeppSync;
const watchFresh = zs && (Date.now() - (((_a = zs.device) === null || _a === void 0 ? void 0 : _a.rawTimestamp) || 0)) < 3600000; // within 1 hour
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 24, flexWrap: “wrap”, gap: 12 } },
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, marginBottom: 4, display: “flex”, alignItems: “center”, gap: 8 } },
greeting,
“ \u00B7 “,
new Date().toLocaleDateString(“en-US”, { weekday: “long”, month: “long”, day: “numeric” }),
watchFresh && React.createElement(“span”, { className: “b bv”, style: { fontSize: 9.5 } }, “\u231A Watch synced”)),
React.createElement(“h1”, { style: { fontSize: 28, fontWeight: 800, letterSpacing: -0.5, lineHeight: 1 } },
data.user.name,
“ “,
React.createElement(“span”, { style: { background: “var(–grad-rose)”, WebkitBackgroundClip: “text”, WebkitTextFillColor: “transparent” } }, “\u2728”))),
React.createElement(“div”, { className: “card gg”, style: { padding: “11px 18px”, cursor: “pointer”, textAlign: “center” }, onClick: () => setPage(“progress”) },
React.createElement(“div”, { style: { fontSize: 10, color: “var(–text-muted)”, marginBottom: 3, textTransform: “uppercase”, letterSpacing: 1 } },
“Level “,
level),
React.createElement(“div”, { style: { fontSize: 17, fontWeight: 800, background: “var(–grad-gold)”, WebkitBackgroundClip: “text”, WebkitTextFillColor: “transparent” } },
data.user.xp.toLocaleString(),
“ XP”),
React.createElement(“div”, { className: “xb”, style: { marginTop: 5, width: 100 } },
React.createElement(“div”, { className: “xf”, style: { width: `${(xpInLevel / xpNeeded) * 100}%` } })))),
React.createElement(“div”, { style: { display: “flex”, gap: 10, overflowX: “auto”, paddingBottom: 4, marginBottom: 20 } }, [{ label: “Habits”, val: data.streaks.habits, c: “var(–violet)” }, { label: “Workouts”, val: data.streaks.workouts, c: “var(–rose)” }, { label: “Logging”, val: data.streaks.logging, c: “var(–gold)” }, { label: “Skincare”, val: data.streaks.skincare, c: “var(–mint)” }, { label: “Sleep”, val: data.streaks.sleep, c: “var(–sky)” }].map(s => (React.createElement(“div”, { key: s.label, className: “card”, style: { padding: “9px 14px”, flexShrink: 0, display: “flex”, alignItems: “center”, gap: 7 } },
React.createElement(“span”, { className: “fl” }, “\uD83D\uDD25”),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontSize: 17, fontWeight: 800, color: s.c, lineHeight: 1 } }, s.val),
React.createElement(“div”, { style: { fontSize: 10, color: “var(–text-muted)” } }, s.label)))))),
React.createElement(“div”, { className: “g4 sp” }, [
{ icon: “🔥”, val: data.nutrition.calories.current, label: “Calories”, sub: caloriesLeft > 0 ? `${caloriesLeft} left` : “Goal hit! 🎉”, pct: data.nutrition.calories.current / data.settings.calorieGoal, color: “var(–peach)”, page: “nutrition” },
{ icon: “💪”, val: data.fitness.workoutsThisWeek, label: “Workouts”, sub: `goal: ${data.settings.workoutGoalPerWeek}/wk`, pct: data.fitness.workoutsThisWeek / data.settings.workoutGoalPerWeek, color: “var(–violet)”, page: “fitness” },
{ icon: “😴”, val: (((_b = zs === null || zs === void 0 ? void 0 : zs.heartRate) === null || _b === void 0 ? void 0 : _b.resting) ? `${zs.heartRate.resting} bpm` : avgSleep + “h”), label: (((_c = zs === null || zs === void 0 ? void 0 : zs.heartRate) === null || _c === void 0 ? void 0 : _c.resting) ? “Resting HR” : “Avg Sleep”), sub: ((_d = zs === null || zs === void 0 ? void 0 : zs.heartRate) === null || _d === void 0 ? void 0 : _d.resting) ? “from watch ⌚” : `goal: ${data.sleep.goalHours}h`, pct: ((_e = zs === null || zs === void 0 ? void 0 : zs.heartRate) === null || _e === void 0 ? void 0 : _e.resting) ? (zs.heartRate.resting / 100) : (+avgSleep / data.sleep.goalHours), color: “var(–sky)”, page: ((_f = zs === null || zs === void 0 ? void 0 : zs.heartRate) === null || _f === void 0 ? void 0 : _f.resting) ? “sleep” : “sleep” },
{ icon: “💰”, val: `$${(totalIncome - totalSpent).toFixed(0)}`, label: “Net Saved”, sub: totalIncome > totalSpent ? “on track ✨” : “check budget”, pct: (totalIncome - totalSpent) / data.settings.savingsGoal, color: totalIncome > totalSpent ? “var(–mint)” : “var(–rose)”, page: “budget” },
].map((s, i) => (React.createElement(“div”, { key: i, className: “sc”, style: { cursor: “pointer” }, onClick: () => setPage(s.page) },
React.createElement(“div”, { className: “si”, style: { background: `${s.color}18` } }, s.icon),
React.createElement(“div”, { className: “sv”, style: { color: s.color } }, s.val),
React.createElement(“div”, { className: “sl” }, s.label),
React.createElement(“div”, { className: “ss” }, s.sub),
React.createElement(“div”, { className: “pb”, style: { marginTop: 6 } },
React.createElement(“div”, { className: “pf”, style: { width: `${Math.min((s.pct || 0) * 100, 100)}%`, background: s.color } })))))),
React.createElement(“div”, { className: “g2 sp” },
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb3” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Today’s Habits”),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: () => setPage(“habits”) }, “View all \u2192”)),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 8 } }, data.habits.slice(0, 4).map(h => (React.createElement(“div”, { key: h.id, className: `hr ${h.doneToday ? "done" : ""}`, onClick: () => {
setData(d => (Object.assign(Object.assign({}, d), { habits: d.habits.map(x => x.id === h.id ? Object.assign(Object.assign({}, x), { doneToday: !x.doneToday }) : x), user: !h.doneToday ? Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 25 }) : d.user })));
if (!h.doneToday)
toast(`+25 XP · ${h.name} ✅`, “xp”);
} },
React.createElement(“div”, { className: “hc” }, h.doneToday ? “✓” : “”),
React.createElement(“span”, { style: { fontSize: 18 } }, h.icon),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 12.5, fontWeight: 600 } }, h.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } },
“\uD83D\uDD25 “,
h.streak,
“ day streak”))))))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb3” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Nutrition”),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: () => setPage(“nutrition”) }, “Log \u2192”)),
React.createElement(“div”, { style: { display: “flex”, justifyContent: “space-around”, flexWrap: “wrap”, gap: 10 } },
React.createElement(Ring, { value: data.nutrition.calories.current, max: data.settings.calorieGoal, size: 76, color: “var(–peach)”, label: `${Math.round((data.nutrition.calories.current / data.settings.calorieGoal) * 100)}%`, sub: “Cals” }),
React.createElement(Ring, { value: data.nutrition.protein.current, max: data.settings.proteinGoal, size: 64, color: “var(–rose)”, label: `${data.nutrition.protein.current}g`, sub: “Prot” }),
React.createElement(Ring, { value: data.nutrition.carbs.current, max: data.settings.carbsGoal, size: 64, color: “var(–indigo)”, label: `${data.nutrition.carbs.current}g`, sub: “Carbs” })))),
React.createElement(“div”, { className: “g2 sp” },
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb2” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “\uD83D\uDCA7 Water Today”),
React.createElement(“span”, { className: “b bs” },
data.nutrition.water.current,
“/”,
data.settings.waterGoal)),
React.createElement(WaterCups, { current: data.nutrition.water.current, goal: data.settings.waterGoal, onAdd: addWater })),
((_g = data.settings) === null || _g === void 0 ? void 0 : _g.gender) !== “male” ? (React.createElement(“div”, { className: “card”, style: { cursor: “pointer” }, onClick: () => setPage(“cycle”) },
React.createElement(“div”, { className: “flex fac fjb mb2” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Cycle Phase”),
React.createElement(“span”, { className: “b”, style: { background: `${cycle.color}18`, color: cycle.color } },
cycle.emoji,
“ “,
cycle.phase)),
React.createElement(“div”, { style: { fontSize: 13, color: “var(–text-muted)”, marginBottom: 8 } },
“Day “,
cycle.day,
“ of “,
data.cycle.cycleLength),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, fontStyle: “italic” } },
“\uD83D\uDCA1 “,
cycle.advice))) : (React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb2” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “\uD83D\uDCAA Recovery”),
React.createElement(“span”, { className: “b bm” }, “Ready”)),
React.createElement(“div”, { style: { fontSize: 13, color: “var(–text-muted)”, marginBottom: 8 } },
“Resting HR: “,
((_j = (_h = data.zeppSync) === null || _h === void 0 ? void 0 : _h.heartRate) === null || _j === void 0 ? void 0 : _j.resting) || “—”,
“ bpm”),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, fontStyle: “italic” } }, “\uD83D\uDCA1 Hit the gym today \u2014 you’re recovered”)))),
React.createElement(“div”, { className: “g2 sp” },
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb3” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Bills This Month”),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: () => setPage(“budget”) }, “Manage \u2192”)),
data.budget.bills.slice(0, 4).map(b => (React.createElement(“div”, { key: b.id, className: “flex fac fjb”, style: { padding: “8px 0”, borderBottom: “1px solid var(–border)” } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 18 } }, b.emoji),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontSize: 12.5, fontWeight: 600 } }, b.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } },
“Due “,
b.dueDay,
“th”,
b.autoPay ? “ · AutoPay” : “”))),
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13 } },
“$”,
b.amount),
React.createElement(“span”, { className: `b ${b.paid ? "bm" : "br"}` }, b.paid ? “Paid” : “Due”)))))),
React.createElement(“div”, { className: “card”, style: { cursor: “pointer” }, onClick: () => setPage(“budget”) },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 12 } }, “Net Worth”),
React.createElement(“div”, { style: { fontSize: 26, fontWeight: 800, color: “var(–gold)”, marginBottom: 4 } },
“$”,
networth.toLocaleString()),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, marginBottom: 14 } },
“Assets: “,
React.createElement(“strong”, { style: { color: “var(–mint)” } },
“$”,
data.budget.assets.reduce((s, a) => s + a.amount, 0).toLocaleString()),
“ \u00B7 Debt: “,
React.createElement(“strong”, { style: { color: “var(–rose)” } },
“$”,
data.budget.liabilities.reduce((s, l) => s + l.amount, 0).toLocaleString())))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb mb3” },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “\uD83C\uDFC6 Achievements”),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: () => setPage(“progress”) }, “All \u2192”)),
React.createElement(“div”, { style: { display: “flex”, gap: 9, overflowX: “auto”, paddingBottom: 4 } }, data.achievements.filter(a => a.unlocked).map(a => (React.createElement(“div”, { key: a.id, style: { flexShrink: 0, display: “flex”, flexDirection: “column”, alignItems: “center”, gap: 4, padding: “10px 12px”, background: “var(–surface2)”, borderRadius: 14, border: `1px solid ${a.color}33`, width: 82, textAlign: “center” } },
React.createElement(“span”, { style: { fontSize: 26 } }, a.emoji),
React.createElement(“span”, { style: { fontSize: 9.5, fontWeight: 600, color: a.color, lineHeight: 1.2 } }, a.name))))))));
}
function HabitsPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [nh, setNh] = useState({ name: “”, icon: “⭐”, category: “Health”, isNumeric: false, target: 1 });
const done = data.habits.filter(h => h.doneToday).length;
const toggle = h => {
setData(d => (Object.assign(Object.assign({}, d), { habits: d.habits.map(x => x.id === h.id ? Object.assign(Object.assign({}, x), { doneToday: !x.doneToday, streak: !x.doneToday ? x.streak + 1 : Math.max(0, x.streak - 1) }) : x), user: !h.doneToday ? Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 25 }) : d.user, streaks: !h.doneToday ? Object.assign(Object.assign({}, d.streaks), { habits: d.streaks.habits + 1 }) : d.streaks })));
if (!h.doneToday)
toast(`+25 XP · ${h.name} ✅`, “xp”);
};
const add = () => {
if (!nh.name.trim())
return;
setData(d => (Object.assign(Object.assign({}, d), { habits: […d.habits, Object.assign(Object.assign({ id: Date.now() }, nh), { streak: 0, doneToday: false, current: 0 })] })));
toast(“New habit added! 🌟”);
setShowAdd(false);
setNh({ name: “”, icon: “⭐”, category: “Health”, isNumeric: false, target: 1 });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Habits \uD83C\uDF31”),
React.createElement(“p”, { className: “ss2” },
done,
“/”,
data.habits.length,
“ today \u00B7 Best: “,
Math.max(…data.habits.map(h => h.streak)),
“d \uD83D\uDD25”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“New Habit”)),
React.createElement(“div”, { className: “card gv sp”, style: { display: “flex”, alignItems: “center”, gap: 20, flexWrap: “wrap” } },
React.createElement(Ring, { value: done, max: data.habits.length, size: 96, color: “var(–violet)”, label: `${done}/${data.habits.length}`, sub: “Today” }),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 18, fontWeight: 800, marginBottom: 6 } }, done === data.habits.length ? “All done! 🎉” : done > data.habits.length / 2 ? “Over halfway! 💪” : “Let’s get it! ✨”),
React.createElement(“div”, { style: { display: “flex”, gap: 8, flexWrap: “wrap” } }, [“Health”, “Skincare”, “Fitness”, “Mind”].map(cat => { const t = data.habits.filter(h => h.category === cat).length, c = data.habits.filter(h => h.category === cat && h.doneToday).length; return t ? React.createElement(“span”, { key: cat, className: “b bv” },
cat,
“: “,
c,
“/”,
t) : null; })))),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 9 } }, data.habits.map(h => (React.createElement(“div”, { key: h.id, className: `hr ${h.doneToday ? "done" : ""}` },
React.createElement(“div”, { onClick: () => toggle(h), style: { display: “contents” } },
React.createElement(“div”, { className: “hc” }, h.doneToday ? “✓” : “”),
React.createElement(“span”, { style: { fontSize: 21 } }, h.icon),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13.5 } }, h.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)”, display: “flex”, gap: 8, marginTop: 2 } },
React.createElement(“span”, null,
“\uD83D\uDD25 “,
h.streak,
“d”),
React.createElement(“span”, { className: “b bv”, style: { fontSize: 10 } }, h.category)))),
h.isNumeric && React.createElement(“div”, { style: { textAlign: “right”, marginRight: 8 }, onClick: () => toggle(h) },
React.createElement(“div”, { style: { fontSize: 15, fontWeight: 700, color: h.doneToday ? “var(–mint)” : “var(–text)” } },
h.current,
“/”,
h.target),
React.createElement(“div”, { style: { width: 56, marginTop: 3 } },
React.createElement(“div”, { className: “pb” },
React.createElement(“div”, { className: “pf”, style: { width: `${Math.min((h.current / h.target) * 100, 100)}%`, background: “var(–mint)” } })))),
React.createElement(“button”, { className: “btn btn-g btn-ic”, style: { width: 28, height: 28, fontSize: 16, color: “var(–text-dim)”, flexShrink: 0 }, onClick: e => { e.stopPropagation(); setData(d => (Object.assign(Object.assign({}, d), { habits: d.habits.filter(x => x.id !== h.id) }))); } }, “\u00D7”))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “Add Habit \u2728” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(Field, { label: “Name” },
React.createElement(“input”, { className: “inp”, placeholder: “e.g. Drink green tea”, value: nh.name, onChange: e => setNh(n => (Object.assign(Object.assign({}, n), { name: e.target.value }))) })),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Icon” },
React.createElement(“input”, { className: “inp”, value: nh.icon, onChange: e => setNh(n => (Object.assign(Object.assign({}, n), { icon: e.target.value }))), style: { textAlign: “center”, fontSize: 22, padding: “8px” } })),
React.createElement(Field, { label: “Category” },
React.createElement(“select”, { className: “inp”, value: nh.category, onChange: e => setNh(n => (Object.assign(Object.assign({}, n), { category: e.target.value }))) }, [“Health”, “Skincare”, “Fitness”, “Mind”, “Custom”].map(c => React.createElement(“option”, { key: c }, c))))),
React.createElement(“div”, { style: { display: “flex”, alignItems: “center”, gap: 10 } },
React.createElement(“input”, { type: “checkbox”, checked: nh.isNumeric, onChange: e => setNh(n => (Object.assign(Object.assign({}, n), { isNumeric: e.target.checked }))), style: { accentColor: “var(–violet)”, width: 16, height: 16 } }),
React.createElement(“label”, { style: { fontSize: 13 } }, “Numeric target”)),
nh.isNumeric && React.createElement(Field, { label: “Daily Target” },
React.createElement(“input”, { className: “inp”, type: “number”, value: nh.target, onChange: e => setNh(n => (Object.assign(Object.assign({}, n), { target: +e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 20 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Add Habit \u2728”)))));
}
function NutritionPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [search, setSearch] = useState(””);
const [searching, setSearching] = useState(false);
const [results, setResults] = useState([]);
const [nf, setNf] = useState({ name: “”, emoji: “🍽️”, cal: “”, protein: “”, carbs: “”, fat: “” });
const n = data.nutrition;
const searchFood = async () => {
if (!search.trim())
return;
setSearching(true);
setResults([]);
try {
const ctrl = new AbortController();
const tid = setTimeout(() => ctrl.abort(), 8000);
const r = await fetch(`https://world.openfoodfacts.org/cgi/search.pl?search_terms=${encodeURIComponent(search)}&json=1&fields=product_name,nutriments&page_size=6`, { signal: ctrl.signal });
clearTimeout(tid);
const d = await r.json();
setResults((d.products || []).filter(p => p.product_name && p.nutriments).slice(0, 6));
}
catch (_a) {
toast(“Food database offline — enter manually”, “error”);
}
setSearching(false);
};
const pickResult = p => {
const nm = p.nutriments;
setNf({ name: p.product_name, emoji: “🍽️”, cal: Math.round(nm[“energy-kcal_100g”] || nm[“energy-kcal”] || 0), protein: Math.round(nm.proteins_100g || 0), carbs: Math.round(nm.carbohydrates_100g || 0), fat: Math.round(nm.fat_100g || 0) });
setResults([]);
setSearch(””);
};
const add = () => {
if (!nf.name.trim() || nf.cal === “”)
return;
const cal = +nf.cal, protein = +nf.protein || 0, carbs = +nf.carbs || 0, fat = +nf.fat || 0;
setData(d => (Object.assign(Object.assign({}, d), { nutrition: Object.assign(Object.assign({}, d.nutrition), { calories: Object.assign(Object.assign({}, d.nutrition.calories), { current: d.nutrition.calories.current + cal }), protein: Object.assign(Object.assign({}, d.nutrition.protein), { current: d.nutrition.protein.current + protein }), carbs: Object.assign(Object.assign({}, d.nutrition.carbs), { current: d.nutrition.carbs.current + carbs }), fat: Object.assign(Object.assign({}, d.nutrition.fat), { current: d.nutrition.fat.current + fat }), logs: [{ id: Date.now(), name: nf.name, emoji: nf.emoji, cal, protein, carbs, fat, time: new Date().toLocaleTimeString([], { hour: “2-digit”, minute: “2-digit” }) }, …d.nutrition.logs] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 10 }) })));
toast(`+10 XP · ${nf.name} logged 🍴`, “xp”);
setShowAdd(false);
setNf({ name: “”, emoji: “🍽️”, cal: “”, protein: “”, carbs: “”, fat: “” });
};
const del = id => setData(d => {
const log = d.nutrition.logs.find(l => l.id === id);
if (!log)
return d;
return Object.assign(Object.assign({}, d), { nutrition: Object.assign(Object.assign({}, d.nutrition), { calories: Object.assign(Object.assign({}, d.nutrition.calories), { current: Math.max(0, d.nutrition.calories.current - log.cal) }), protein: Object.assign(Object.assign({}, d.nutrition.protein), { current: Math.max(0, d.nutrition.protein.current - log.protein) }), carbs: Object.assign(Object.assign({}, d.nutrition.carbs), { current: Math.max(0, d.nutrition.carbs.current - log.carbs) }), fat: Object.assign(Object.assign({}, d.nutrition.fat), { current: Math.max(0, d.nutrition.fat.current - log.fat) }), logs: d.nutrition.logs.filter(l => l.id !== id) }) });
});
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Nutrition \uD83E\uDD57”),
React.createElement(“p”, { className: “ss2” }, “Track macros & calories”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Log Food”)),
React.createElement(“div”, { className: “card gr sp” },
React.createElement(“div”, { style: { display: “flex”, justifyContent: “space-around”, flexWrap: “wrap”, gap: 14, padding: “6px 0” } }, [{ v: n.calories.current, max: data.settings.calorieGoal, label: “Cals”, sub: `/${data.settings.calorieGoal}`, color: “var(–peach)”, size: 106 }, { v: n.protein.current, max: data.settings.proteinGoal, label: “Protein”, sub: `${n.protein.current}g`, color: “var(–rose)”, size: 88 }, { v: n.carbs.current, max: data.settings.carbsGoal, label: “Carbs”, sub: `${n.carbs.current}g`, color: “var(–indigo)”, size: 88 }, { v: n.fat.current, max: data.settings.fatGoal, label: “Fat”, sub: `${n.fat.current}g`, color: “var(–violet)”, size: 88 }].map((m, i) => (React.createElement(“div”, { key: i, style: { textAlign: “center” } },
React.createElement(Ring, { value: m.v, max: m.max, size: m.size, color: m.color, label: i === 0 ? m.v : m.sub, sub: m.label })))))),
React.createElement(“div”, { className: “card sp” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Weekly Calories”),
React.createElement(BarChart, { data: n.weekData, color: “var(–peach)”, height: 75, labels: WEEK_LABELS })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Today’s Food Log”),
n.logs.length === 0 && React.createElement(“div”, { style: { textAlign: “center”, padding: 30, color: “var(–text-muted)”, fontSize: 13 } }, “No food logged yet \uD83E\uDD57”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 9 } }, n.logs.map(log => (React.createElement(“div”, { key: log.id, style: { display: “flex”, alignItems: “center”, gap: 11, padding: “11px 13px”, background: “var(–surface2)”, borderRadius: 13, border: “1px solid var(–border)” } },
React.createElement(“span”, { style: { fontSize: 22 } }, log.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13 } }, log.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } }, log.time)),
React.createElement(“span”, { className: “b bp” },
log.cal,
“ kcal”),
React.createElement(“span”, { className: “b br” },
log.protein,
“g P”),
React.createElement(“button”, { className: “btn btn-g btn-ic”, style: { width: 26, height: 26, fontSize: 15, color: “var(–text-dim)” }, onClick: () => del(log.id) }, “\u00D7”)))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “Log Food \uD83C\uDF74” },
React.createElement(“div”, { style: { marginBottom: 16 } },
React.createElement(“label”, { className: “label” }, “Search Food Database (3M+ items, free)”),
React.createElement(“div”, { style: { display: “flex”, gap: 8 } },
React.createElement(“input”, { className: “inp”, placeholder: “e.g. Greek yogurt, banana…”, value: search, onChange: e => setSearch(e.target.value), onKeyDown: e => e.key === “Enter” && searchFood() }),
React.createElement(“button”, { className: “btn btn-s”, onClick: searchFood, style: { flexShrink: 0 } }, searching ? “…” : “Search”)),
results.length > 0 && (React.createElement(“div”, { style: { marginTop: 8, display: “flex”, flexDirection: “column”, gap: 6, maxHeight: 200, overflowY: “auto” } }, results.map((r, i) => {
var _a, _b;
return (React.createElement(“div”, { key: i, style: { padding: “9px 12px”, background: “var(–surface2)”, borderRadius: 10, cursor: “pointer”, border: “1px solid var(–border)”, fontSize: 12.5 }, onClick: () => pickResult(r), onMouseEnter: e => e.currentTarget.style.borderColor = “var(–violet)”, onMouseLeave: e => e.currentTarget.style.borderColor = “var(–border)” },
React.createElement(“div”, { style: { fontWeight: 600 } }, r.product_name),
React.createElement(“div”, { style: { color: “var(–text-muted)”, fontSize: 11 } },
Math.round(((_a = r.nutriments) === null || _a === void 0 ? void 0 : _a[“energy-kcal_100g”]) || 0),
“ kcal \u00B7 “,
Math.round(((_b = r.nutriments) === null || *b === void 0 ? void 0 : *b.proteins_100g) || 0),
“g P per 100g”)));
})))),
React.createElement(“div”, { style: { height: 1, background: “var(–border)”, margin: “12px 0” } }),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, marginBottom: 12 } }, “Or enter manually:”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } },
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(Field, { label: “Emoji”, style: { width: 58 } },
React.createElement(“input”, { className: “inp”, value: nf.emoji, onChange: e => setNf(f => (Object.assign(Object.assign({}, f), { emoji: e.target.value }))), style: { textAlign: “center”, fontSize: 20, padding: “8px 4px” } })),
React.createElement(Field, { label: “Food Name”, style: { flex: 1 } },
React.createElement(“input”, { className: “inp”, placeholder: “Avocado toast”, value: nf.name, onChange: e => setNf(f => (Object.assign(Object.assign({}, f), { name: e.target.value }))) }))),
React.createElement(“div”, { className: “g2” }, [[“cal”, “Calories (kcal)”], [“protein”, “Protein (g)”], [“carbs”, “Carbs (g)”], [“fat”, “Fat (g)”]].map(([k, lbl]) => (React.createElement(Field, { key: k, label: lbl },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “0”, value: nf[k], onChange: e => setNf(f => (Object.assign(Object.assign({}, f), { [k]: e.target.value }))) })))))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Log Food \uD83C\uDF7D\uFE0F”)))));
}
function FitnessPage({ data, setData, toast }) {
const [tab, setTab] = useState(“log”);
const [showAdd, setShowAdd] = useState(false);
const [nw, setNw] = useState({ name: “”, type: “Strength”, emoji: “🏋️”, duration: “”, calories: “”, exercises: “” });
const types = { Strength: “var(–violet)”, Cardio: “var(–rose)”, HIIT: “var(–peach)”, Flexibility: “var(–mint)” };
const add = () => {
if (!nw.name.trim())
return;
const w = Object.assign(Object.assign({ id: Date.now(), date: “Today” }, nw), { duration: +nw.duration || 0, calories: +nw.calories || 0, exercises: nw.exercises.split(”\n”).filter(Boolean) });
setData(d => (Object.assign(Object.assign({}, d), { fitness: Object.assign(Object.assign({}, d.fitness), { workoutsThisWeek: d.fitness.workoutsThisWeek + 1, workouts: [w, …d.fitness.workouts] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 50 }), streaks: Object.assign(Object.assign({}, d.streaks), { workouts: d.streaks.workouts + 1 }) })));
toast(`+50 XP · ${nw.name} logged! 💪`, “xp”);
setShowAdd(false);
setNw({ name: “”, type: “Strength”, emoji: “🏋️”, duration: “”, calories: “”, exercises: “” });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Fitness \uD83D\uDCAA”),
React.createElement(“p”, { className: “ss2” },
data.fitness.workoutsThisWeek,
“/”,
data.settings.workoutGoalPerWeek,
“ workouts this week”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Log Workout”)),
React.createElement(“div”, { className: “tabs sp” }, [“log”, “templates”].map(t => React.createElement(“div”, { key: t, className: `tab ${tab === t ? "active" : ""}`, onClick: () => setTab(t), style: { textTransform: “capitalize” } }, t))),
tab === “log” && (React.createElement(React.Fragment, null,
React.createElement(“div”, { className: “card gv sp” },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 14 } },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Weekly Calories Burned”),
React.createElement(“span”, { className: “b bv” },
“\uD83D\uDD25 “,
data.fitness.weekData.reduce((a, b) => a + b, 0),
“ kcal”)),
React.createElement(BarChart, { data: data.fitness.weekData, color: “var(–violet)”, height: 75, labels: WEEK_LABELS })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Recent Workouts”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } }, data.fitness.workouts.map(w => (React.createElement(“div”, { key: w.id, style: { display: “flex”, alignItems: “flex-start”, gap: 13, padding: “13px 15px”, background: “var(–surface2)”, borderRadius: 15, border: “1px solid var(–border)” } },
React.createElement(“span”, { style: { fontSize: 24, marginTop: 2 } }, w.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13.5 } }, w.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)”, display: “flex”, gap: 9, marginTop: 3, flexWrap: “wrap” } },
React.createElement(“span”, null,
“\u23F1 “,
w.duration,
“min”),
React.createElement(“span”, null,
“\uD83D\uDD25 “,
w.calories,
“ kcal”),
React.createElement(“span”, null, w.date)),
w.exercises && w.exercises.length > 0 && (React.createElement(“div”, { style: { marginTop: 7, display: “flex”, gap: 5, flexWrap: “wrap” } },
(Array.isArray(w.exercises) ? w.exercises : []).slice(0, 3).map((e, i) => React.createElement(“span”, { key: i, className: “b bi”, style: { fontSize: 9.5 } }, e)),
Array.isArray(w.exercises) && w.exercises.length > 3 && React.createElement(“span”, { className: “b bi”, style: { fontSize: 9.5 } },
“+”,
w.exercises.length - 3,
“ more”)))),
React.createElement(“span”, { className: “b”, style: { background: `${types[w.type] || "var(--violet)"}1a`, color: types[w.type] || “var(–violet)”, flexShrink: 0 } }, w.type)))))))),
tab === “templates” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } }, data.fitness.templates.map(t => (React.createElement(“div”, { key: t.id, className: “card”, style: { cursor: “pointer” } },
React.createElement(“div”, { className: “flex fac fjb mb2” },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 22 } }, t.emoji),
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 14 } }, t.name)),
React.createElement(“button”, { className: “btn btn-s btn-sm”, onClick: () => { setNw({ name: t.name, type: “Strength”, emoji: t.emoji, duration: “”, calories: “”, exercises: t.exercises.join(”\n”) }); setShowAdd(true); setTab(“log”); } }, “Use \u2192”)),
React.createElement(“div”, { style: { display: “flex”, gap: 6, flexWrap: “wrap” } }, t.exercises.map((e, i) => React.createElement(“span”, { key: i, className: “b bv”, style: { fontSize: 10 } }, e)))))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “Log Workout \uD83D\uDCAA” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } },
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(Field, { label: “Emoji”, style: { width: 58 } },
React.createElement(“input”, { className: “inp”, value: nw.emoji, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { emoji: e.target.value }))), style: { textAlign: “center”, fontSize: 20, padding: “8px 4px” } })),
React.createElement(Field, { label: “Workout Name”, style: { flex: 1 } },
React.createElement(“input”, { className: “inp”, placeholder: “Morning Run”, value: nw.name, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { name: e.target.value }))) }))),
React.createElement(Field, { label: “Type” },
React.createElement(“select”, { className: “inp”, value: nw.type, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { type: e.target.value }))) }, Object.keys(types).map(t => React.createElement(“option”, { key: t }, t)))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Duration (min)” },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “45”, value: nw.duration, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { duration: e.target.value }))) })),
React.createElement(Field, { label: “Calories burned” },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “300”, value: nw.calories, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { calories: e.target.value }))) }))),
React.createElement(Field, { label: “Exercises (one per line)” },
React.createElement(“textarea”, { className: “inp”, rows: 4, placeholder: “Squats 4×8\nBench 3×10”, value: nw.exercises, onChange: e => setNw(w => (Object.assign(Object.assign({}, w), { exercises: e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Log \uD83D\uDCAA”)))));
}
function SkincarePage({ data, setData, toast }) {
const [tab, setTab] = useState(“routine”);
const toggle = (time, i) => {
const wasDone = data.skincare.routine[time][i].done;
setData(d => (Object.assign(Object.assign({}, d), { skincare: Object.assign(Object.assign({}, d.skincare), { routine: Object.assign(Object.assign({}, d.skincare.routine), { [time]: d.skincare.routine[time].map((s, j) => j === i ? Object.assign(Object.assign({}, s), { done: !s.done }) : s) }) }), user: !wasDone ? Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 15 }) : d.user })));
if (!wasDone)
toast(`+15 XP · ${data.skincare.routine[time][i].name} ✨`, “xp”);
};
const am = data.skincare.routine.morning.every(s => s.done), pm = data.skincare.routine.evening.every(s => s.done);
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “sh” },
React.createElement(“h2”, { className: “st” }, “Skincare \u2728”),
React.createElement(“p”, { className: “ss2” },
“\uD83D\uDD25 “,
data.skincare.streak,
“ day streak \u00B7 Score: “,
data.skincare.skinScore,
“/100”)),
React.createElement(“div”, { className: “tabs sp” }, [“routine”, “products”].map(t => React.createElement(“div”, { key: t, className: `tab ${tab === t ? "active" : ""}`, onClick: () => setTab(t), style: { textTransform: “capitalize” } }, t))),
tab === “routine” && (React.createElement(React.Fragment, null,
React.createElement(“div”, { className: “card gm sp flex fac gap4”, style: { flexWrap: “wrap” } },
React.createElement(Ring, { value: data.skincare.skinScore, max: 100, size: 96, color: “var(–mint)”, label: data.skincare.skinScore, sub: “Score” }),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 17, fontWeight: 700, marginBottom: 5 } }, “Glowing \u2728”),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, marginBottom: 10 } }, “Consistency is paying off!”),
React.createElement(“div”, { style: { display: “flex”, gap: 7 } },
React.createElement(“span”, { className: “b bm” },
“\uD83D\uDD25 “,
data.skincare.streak,
“ days”),
React.createElement(“span”, { className: “b bv” }, am && pm ? “All done! 🎉” : “In progress…”)))),
React.createElement(“div”, { className: “g2 sp” }, [[“morning”, “☀️ Morning”], [“evening”, “🌙 Evening”]].map(([time, label]) => (React.createElement(“div”, { key: time, className: “card” },
React.createElement(“div”, { className: “flex fac gap2”, style: { marginBottom: 13 } },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 14 } }, label),
(time === “morning” ? am : pm) && React.createElement(“span”, { className: “b bm” }, “Done \u2713”)),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 9 } }, data.skincare.routine[time].map((s, i) => (React.createElement(“div”, { key: i, className: `hr ${s.done ? "done" : ""}`, onClick: () => toggle(time, i) },
React.createElement(“div”, { className: “hc” }, s.done ? “✓” : “”),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13 } }, s.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } }, s.brand)))))))))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “7-Day Streak”),
React.createElement(“div”, { style: { display: “flex”, gap: 8, justifyContent: “space-between” } }, WEEK_LABELS.map((day, i) => (React.createElement(“div”, { key: day, style: { display: “flex”, flexDirection: “column”, alignItems: “center”, gap: 5 } },
React.createElement(“div”, { style: { width: 34, height: 34, borderRadius: 9, background: data.skincare.weekData[i] ? “rgba(127,255,212,0.18)” : “var(–surface2)”, border: `1px solid ${data.skincare.weekData[i] ? "var(--mint)" : "var(--border)"}`, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 15 } }, data.skincare.weekData[i] ? “✨” : “”),
React.createElement(“span”, { style: { fontSize: 9.5, color: “var(–text-dim)” } }, day.slice(0, 1))))))))),
tab === “products” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } }, data.skincare.products.map(p => (React.createElement(“div”, { key: p.id, className: “card flex fac gap3” },
React.createElement(“div”, { style: { width: 44, height: 44, borderRadius: 13, background: “rgba(199,125,255,0.12)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 22, flexShrink: 0 } }, p.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5 } }, p.name),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)” } },
p.brand,
“ \u00B7 “,
p.category),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-dim)”, marginTop: 3 } },
“Replenish: “,
p.replenishDate)),
React.createElement(“div”, { style: { display: “flex”, gap: 2 } }, Array.from({ length: 5 }).map((*, i) => React.createElement(“span”, { key: i, style: { fontSize: 12, color: i < p.rating ? “var(–gold)” : “var(–text-dim)” } }, i < p.rating ? “★” : “☆”))))))))));
}
function SleepPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [ns, setNs] = useState({ bedtime: “11:00 PM”, wake: “7:00 AM”, quality: 4, notes: “” });
const logs = data.sleep.logs;
const avgHours = (logs.slice(0, 7).reduce((s, l) => s + l.hours, 0) / Math.min(logs.length, 7)).toFixed(1);
const qualityColor = q => q >= 4 ? “var(–mint)” : q >= 3 ? “var(–gold)” : q >= 2 ? “var(–peach)” : “var(–rose)”;
const calcHours = (bed, wake) => {
const p = t => { const [h, m] = t.replace(/(AM|PM)/, “”).trim().split(”:”).map(Number); return (t.includes(“PM”) && h !== 12 ? h + 12 : h === 12 && t.includes(“AM”) ? 0 : h) * 60 + m; };
let diff = p(wake) - p(bed);
if (diff < 0)
diff += 1440;
return +(diff / 60).toFixed(1);
};
const add = () => {
const hours = calcHours(ns.bedtime, ns.wake);
const log = { id: Date.now(), date: TODAY(), bedtime: ns.bedtime, wake: ns.wake, hours, quality: ns.quality, notes: ns.notes };
setData(d => (Object.assign(Object.assign({}, d), { sleep: Object.assign(Object.assign({}, d.sleep), { logs: [log, …d.sleep.logs] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 20 }), streaks: Object.assign(Object.assign({}, d.streaks), { sleep: hours >= d.sleep.goalHours ? (d.streaks.sleep || 0) + 1 : 0 }) })));
toast(`+20 XP · ${hours}h sleep logged 😴`, “xp”);
setShowAdd(false);
setNs({ bedtime: “11:00 PM”, wake: “7:00 AM”, quality: 4, notes: “” });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Sleep \uD83D\uDE34”),
React.createElement(“p”, { className: “ss2” },
“Avg “,
avgHours,
“h \u00B7 Goal “,
data.sleep.goalHours,
“h \u00B7 \uD83D\uDD25 “,
data.streaks.sleep,
“ streak”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Log Sleep”)),
React.createElement(“div”, { className: “g3 sp” }, [{ label: “Avg Hours”, val: avgHours + “h”, color: “var(–sky)”, icon: “😴”, sub: `Goal: ${data.sleep.goalHours}h` }, { label: “Avg Quality”, val: (logs.slice(0, 7).reduce((s, l) => s + l.quality, 0) / Math.min(logs.length, 7)).toFixed(1) + “/5”, color: “var(–violet)”, icon: “⭐”, sub: “sleep quality” }, { label: “Streak”, val: data.streaks.sleep + “d”, color: “var(–gold)”, icon: “🔥”, sub: “consecutive nights” }].map((s, i) => (React.createElement(“div”, { key: i, className: “sc” },
React.createElement(“div”, { className: “si”, style: { background: `${s.color}18` } }, s.icon),
React.createElement(“div”, { className: “sv”, style: { color: s.color } }, s.val),
React.createElement(“div”, { className: “sl” }, s.label),
React.createElement(“div”, { className: “ss” }, s.sub))))),
React.createElement(“div”, { className: “card sp” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “7-Day Sleep Hours”),
React.createElement(BarChart, { data: […logs].reverse().slice(0, 7).map(l => l.hours), color: “var(–sky)”, height: 75, labels: […logs].reverse().slice(0, 7).map(l => l.date.slice(-2)) })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Sleep Log”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 10 } }, logs.map(log => (React.createElement(“div”, { key: log.id, style: { padding: “13px 15px”, background: “var(–surface2)”, borderRadius: 14, border: “1px solid var(–border)” } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 6 } },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, log.date),
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { className: “b bs” },
log.hours,
“h”),
React.createElement(“span”, { className: “b”, style: { background: `${qualityColor(log.quality)}18`, color: qualityColor(log.quality) } },
log.quality,
“/5 \u2B50”))),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)” } },
“\uD83C\uDF19 “,
log.bedtime,
“ \u2192 \u2600\uFE0F “,
log.wake),
log.notes && React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-dim)”, marginTop: 4, fontStyle: “italic” } }, log.notes)))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “Log Sleep \uD83D\uDE34” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Bedtime” },
React.createElement(“input”, { className: “inp”, value: ns.bedtime, onChange: e => setNs(s => (Object.assign(Object.assign({}, s), { bedtime: e.target.value }))), placeholder: “11:00 PM” })),
React.createElement(Field, { label: “Wake Time” },
React.createElement(“input”, { className: “inp”, value: ns.wake, onChange: e => setNs(s => (Object.assign(Object.assign({}, s), { wake: e.target.value }))), placeholder: “7:00 AM” }))),
React.createElement(Field, { label: `Quality: ${ns.quality}/5 ${"⭐".repeat(ns.quality)}` },
React.createElement(“input”, { type: “range”, min: 1, max: 5, value: ns.quality, onChange: e => setNs(s => (Object.assign(Object.assign({}, s), { quality: +e.target.value }))), style: { width: “100%”, accentColor: “var(–violet)” } })),
React.createElement(Field, { label: “Notes” },
React.createElement(“input”, { className: “inp”, placeholder: “How did you sleep?”, value: ns.notes, onChange: e => setNs(s => (Object.assign(Object.assign({}, s), { notes: e.target.value }))) })),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)” } },
“Calculated: “,
calcHours(ns.bedtime, ns.wake),
“h”)),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Log Sleep \uD83D\uDE34”)))));
}
function BodyPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [nm, setNm] = useState({ weight: “”, waist: “”, hips: “”, chest: “”, arms: “”, thighs: “” });
const logs = data.body.measurements, latest = logs[0] || {}, prev = logs[1] || {};
const delta = k => { if (!latest[k] || !prev[k])
return null; return (latest[k] - prev[k]).toFixed(1); };
const metrics = [{ key: “weight”, label: “Weight”, unit: “lbs”, color: “var(–rose)”, emoji: “⚖️” }, { key: “waist”, label: “Waist”, unit: “cm”, color: “var(–violet)”, emoji: “📏” }, { key: “hips”, label: “Hips”, unit: “cm”, color: “var(–peach)”, emoji: “📐” }, { key: “chest”, label: “Chest”, unit: “cm”, color: “var(–indigo)”, emoji: “📏” }, { key: “arms”, label: “Arms”, unit: “cm”, color: “var(–mint)”, emoji: “💪” }, { key: “thighs”, label: “Thighs”, unit: “cm”, color: “var(–sky)”, emoji: “🦵” }];
const add = () => {
const m = { id: Date.now(), date: TODAY() };
metrics.forEach(k => { if (nm[k.key])
m[k.key] = +nm[k.key]; });
setData(d => (Object.assign(Object.assign({}, d), { body: Object.assign(Object.assign({}, d.body), { measurements: [m, …d.body.measurements] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 20 }) })));
toast(”+20 XP · Measurements logged! 📏”, “xp”);
setShowAdd(false);
setNm({ weight: “”, waist: “”, hips: “”, chest: “”, arms: “”, thighs: “” });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Body \uD83D\uDCCF”),
React.createElement(“p”, { className: “ss2” },
logs.length,
“ measurements \u00B7 Track your progress”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Log”)),
React.createElement(“div”, { className: “g3 sp” }, metrics.map(m => {
const d = delta(m.key), down = d && +d < 0;
return (React.createElement(“div”, { key: m.key, className: “sc” },
React.createElement(“div”, { style: { fontSize: 20 } }, m.emoji),
React.createElement(“div”, { className: “sv”, style: { color: m.color } },
latest[m.key] || “—”,
React.createElement(“span”, { style: { fontSize: 12, fontWeight: 400 } },
“ “,
m.unit)),
React.createElement(“div”, { className: “sl” }, m.label),
d && React.createElement(“div”, { style: { fontSize: 10.5, color: down ? “var(–mint)” : “var(–rose)” } },
down ? “↓” : “↑”,
“ “,
Math.abs(+d),
m.unit)));
})),
logs.length >= 3 && (React.createElement(“div”, { className: “card sp” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Weight Trend”),
React.createElement(BarChart, { data: […logs].slice(0, 7).reverse().map(l => l.weight || 0), color: “var(–rose)”, height: 70, labels: […logs].slice(0, 7).reverse().map(l => l.date.slice(-5)) }))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “History”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 10 } }, logs.map(log => (React.createElement(“div”, { key: log.id, style: { padding: “13px 15px”, background: “var(–surface2)”, borderRadius: 14, border: “1px solid var(–border)” } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13, marginBottom: 8 } }, log.date),
React.createElement(“div”, { style: { display: “flex”, gap: 10, flexWrap: “wrap” } }, metrics.filter(m => log[m.key]).map(m => React.createElement(“span”, { key: m.key, className: “b”, style: { background: `${m.color}18`, color: m.color, fontSize: 11 } },
m.label,
“: “,
log[m.key],
m.unit)))))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “Log Measurements \uD83D\uDCCF” },
React.createElement(“div”, { className: “g2”, style: { gap: 12 } }, metrics.map(m => React.createElement(Field, { key: m.key, label: `${m.emoji} ${m.label} (${m.unit})` },
React.createElement(“input”, { className: “inp”, type: “number”, step: “0.1”, placeholder: latest[m.key] || “0”, value: nm[m.key], onChange: e => setNm(n => (Object.assign(Object.assign({}, n), { [m.key]: e.target.value }))) })))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Log \uD83D\uDCCF”)))));
}
function CyclePage({ data, setData, toast }) {
const [showLog, setShowLog] = useState(false);
const [nl, setNl] = useState({ flow: “medium”, cramps: 2, mood: “okay”, notes: “” });
const c = data.cycle, phase = getCyclePhase(c.lastPeriodStart, c.cycleLength);
const nextPeriod = () => { const s = new Date(c.lastPeriodStart + “, 2026”); s.setDate(s.getDate() + c.cycleLength); return s.toLocaleDateString(“en-US”, { month: “short”, day: “numeric” }); };
const ovulationDate = () => { const s = new Date(c.lastPeriodStart + “, 2026”); s.setDate(s.getDate() + 14); return s.toLocaleDateString(“en-US”, { month: “short”, day: “numeric” }); };
const phases = [{ name: “Menstrual”, days: “1-5”, color: “var(–rose)”, emoji: “🌸”, desc: “Rest, iron-rich foods, gentle movement” }, { name: “Follicular”, days: “6-13”, color: “var(–mint)”, emoji: “🌱”, desc: “Energy rising, great for strength training” }, { name: “Ovulation”, days: “14-16”, color: “var(–gold)”, emoji: “⭐”, desc: “Peak energy & confidence — HIIT time!” }, { name: “Luteal”, days: “17-28”, color: “var(–violet)”, emoji: “🌙”, desc: “Slow down, prioritize sleep & magnesium” }];
const addLog = () => {
setData(d => (Object.assign(Object.assign({}, d), { cycle: Object.assign(Object.assign({}, d.cycle), { logs: [Object.assign({ date: TODAY() }, nl), …d.cycle.logs] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 15 }) })));
toast(”+15 XP · Cycle logged 🌸”, “xp”);
setShowLog(false);
setNl({ flow: “medium”, cramps: 2, mood: “okay”, notes: “” });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Cycle \uD83C\uDF38”),
React.createElement(“p”, { className: “ss2” },
“Day “,
phase.day,
“ of “,
c.cycleLength,
“ \u00B7 “,
c.cycleLength,
“-day cycle”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowLog(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Log Today”)),
React.createElement(“div”, { className: “card gr sp” },
React.createElement(“div”, { className: “flex fac gap3”, style: { flexWrap: “wrap” } },
React.createElement(“div”, { style: { width: 80, height: 80, borderRadius: “50%”, background: `${phase.color}22`, border: `2px solid ${phase.color}`, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 36, flexShrink: 0 } }, phase.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 20, fontWeight: 800, color: phase.color } },
phase.phase,
“ Phase”),
React.createElement(“div”, { style: { fontSize: 13, color: “var(–text-muted)”, margin: “4px 0 8px” } },
“Day “,
phase.day,
“ of “,
c.cycleLength),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, fontStyle: “italic” } },
“\uD83D\uDCA1 “,
phase.advice)))),
React.createElement(“div”, { className: “g2 sp” },
React.createElement(“div”, { className: “sc” },
React.createElement(“div”, { style: { fontSize: 20 } }, “\uD83E\uDE78”),
React.createElement(“div”, { className: “sv”, style: { color: “var(–rose)” } }, nextPeriod()),
React.createElement(“div”, { className: “sl” }, “Next Period”),
React.createElement(“div”, { className: “ss” }, “Predicted”)),
React.createElement(“div”, { className: “sc” },
React.createElement(“div”, { style: { fontSize: 20 } }, “\uD83E\uDD5A”),
React.createElement(“div”, { className: “sv”, style: { color: “var(–gold)” } }, ovulationDate()),
React.createElement(“div”, { className: “sl” }, “Ovulation”),
React.createElement(“div”, { className: “ss” }, “Predicted”))),
React.createElement(“div”, { className: “card sp” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Cycle Phases Guide”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 10 } }, phases.map(p => (React.createElement(“div”, { key: p.name, style: { display: “flex”, gap: 13, padding: “12px 14px”, borderRadius: 13, background: p.name === phase.phase ? `${p.color}12` : “var(–surface2)”, border: `1px solid ${p.name === phase.phase ? p.color : "var(--border)"}` } },
React.createElement(“span”, { style: { fontSize: 22 } }, p.emoji),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13, color: p.color } },
p.name,
“ “,
React.createElement(“span”, { style: { color: “var(–text-dim)”, fontWeight: 400, fontSize: 11 } },
“\u00B7 Day “,
p.days)),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)”, marginTop: 3 } }, p.desc)),
p.name === phase.phase && React.createElement(“span”, { className: “b”, style: { marginLeft: “auto”, background: `${p.color}18`, color: p.color, flexShrink: 0, alignSelf: “center” } }, “Now”)))))),
c.logs.length > 0 && (React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Recent Logs”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 9 } }, c.logs.slice(0, 5).map((log, i) => (React.createElement(“div”, { key: i, style: { display: “flex”, gap: 10, padding: “10px 13px”, background: “var(–surface2)”, borderRadius: 12 } },
React.createElement(“span”, { style: { fontSize: 16 } }, “\uD83E\uDE78”),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 12.5 } }, log.date),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)”, display: “flex”, gap: 7, marginTop: 2 } },
React.createElement(“span”, null,
“Flow: “,
log.flow),
React.createElement(“span”, null,
“Cramps: “,
log.cramps,
“/5”),
React.createElement(“span”, null,
“Mood: “,
log.mood))))))))),
React.createElement(Modal, { open: showLog, onClose: () => setShowLog(false), title: “Log Today \uD83C\uDF38” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(Field, { label: “Flow” },
React.createElement(“select”, { className: “inp”, value: nl.flow, onChange: e => setNl(l => (Object.assign(Object.assign({}, l), { flow: e.target.value }))) }, [“spotting”, “light”, “medium”, “heavy”, “very heavy”].map(f => React.createElement(“option”, { key: f }, f)))),
React.createElement(Field, { label: `Cramps: ${nl.cramps}/5` },
React.createElement(“input”, { type: “range”, min: 0, max: 5, value: nl.cramps, onChange: e => setNl(l => (Object.assign(Object.assign({}, l), { cramps: +e.target.value }))), style: { width: “100%”, accentColor: “var(–rose)” } })),
React.createElement(Field, { label: “Mood” },
React.createElement(“select”, { className: “inp”, value: nl.mood, onChange: e => setNl(l => (Object.assign(Object.assign({}, l), { mood: e.target.value }))) }, [“great”, “good”, “okay”, “tired”, “irritable”, “sad”, “anxious”].map(m => React.createElement(“option”, { key: m }, m)))),
React.createElement(Field, { label: “Notes” },
React.createElement(“input”, { className: “inp”, placeholder: “Symptoms, notes…”, value: nl.notes, onChange: e => setNl(l => (Object.assign(Object.assign({}, l), { notes: e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowLog(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: addLog }, “Log \uD83C\uDF38”)))));
}
function JournalPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [ne, setNe] = useState({ mood: “😊”, moodScore: 7, energy: 7, tags: “”, text: “” });
const MOODS = [“😔”, “😐”, “🙂”, “😊”, “😄”];
const TAGS = [”#grateful”, “#productive”, “#tired”, “#stressed”, “#happy”, “#anxious”, “#calm”, “#energized”];
const heatColor = s => { if (s >= 8)
return “rgba(127,255,212,0.8)”; if (s >= 6)
return “rgba(199,125,255,0.6)”; if (s >= 4)
return “rgba(255,185,151,0.5)”; return “rgba(255,107,157,0.5)”; };
const add = () => {
const entry = Object.assign(Object.assign({ id: Date.now(), date: TODAY() }, ne), { tags: ne.tags.split(” “).filter(t => t.startsWith(”#”)) });
setData(d => (Object.assign(Object.assign({}, d), { journal: Object.assign(Object.assign({}, d.journal), { entries: [entry, …d.journal.entries] }), user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 20 }), streaks: Object.assign(Object.assign({}, d.streaks), { logging: d.streaks.logging + 1 }) })));
toast(”+20 XP · Journal entry saved 📓”, “xp”);
setShowAdd(false);
setNe({ mood: “😊”, moodScore: 7, energy: 7, tags: “”, text: “” });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Journal \uD83D\uDCD3”),
React.createElement(“p”, { className: “ss2” },
“\uD83D\uDD25 “,
data.streaks.logging,
“ day streak \u00B7 “,
data.journal.entries.length,
“ entries”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Write”)),
React.createElement(“div”, { className: “card sp” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Mood Heatmap”),
React.createElement(“div”, { style: { display: “flex”, gap: 5, flexWrap: “wrap” } },
data.journal.entries.map((e, i) => React.createElement(“div”, { key: i, className: “hm-cell”, title: `${e.date}: ${e.mood} ${e.moodScore}/10`, style: { background: heatColor(e.moodScore || 5) } })),
Array.from({ length: Math.max(0, 20 - data.journal.entries.length) }).map((*, i) => React.createElement(“div”, { key: `e${i}`, className: “hm-cell”, style: { background: “var(–surface2)” } }))),
React.createElement(“div”, { style: { display: “flex”, gap: 10, marginTop: 10, fontSize: 11, color: “var(–text-muted)”, flexWrap: “wrap” } }, [[“rgba(127,255,212,0.8)”, “Great (8+)”], [“rgba(199,125,255,0.6)”, “Good (6-7)”], [“rgba(255,107,157,0.5)”, “Low (<4)”]].map(([c, l]) => (React.createElement(“span”, { key: l, style: { display: “flex”, alignItems: “center”, gap: 4 } },
React.createElement(“span”, { style: { width: 10, height: 10, borderRadius: 3, background: c, display: “inline-block” } }),
l))))),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } }, data.journal.entries.map(e => (React.createElement(“div”, { key: e.id, className: “card”, style: { borderLeft: `3px solid ${e.moodScore >= 8 ? "var(--mint)" : e.moodScore >= 6 ? "var(--violet)" : e.moodScore >= 4 ? "var(--peach)" : "var(--rose)"}` } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 8 } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 22 } }, e.mood),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13 } }, e.date),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)” } },
“Mood: “,
e.moodScore,
“/10 \u00B7 Energy: “,
e.energy,
“/10”))),
React.createElement(“div”, { style: { display: “flex”, gap: 5, flexWrap: “wrap”, justifyContent: “flex-end” } }, (Array.isArray(e.tags) ? e.tags : []).map((t, i) => React.createElement(“span”, { key: i, className: “b bv”, style: { fontSize: 9.5 } }, t)))),
e.text && React.createElement(“p”, { style: { fontSize: 12.5, color: “var(–text-muted)”, lineHeight: 1.6 } }, e.text))))),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “New Journal Entry \uD83D\uDCD3” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(“div”, null,
React.createElement(“label”, { className: “label” }, “Mood”),
React.createElement(“div”, { style: { display: “flex”, gap: 10, justifyContent: “center”, marginTop: 4 } }, MOODS.map((m, i) => React.createElement(“div”, { key: m, onClick: () => setNe(e => (Object.assign(Object.assign({}, e), { mood: m, moodScore: (i + 1) * 2 }))), style: { fontSize: 28, cursor: “pointer”, opacity: ne.mood === m ? 1 : 0.35, transition: “all 0.15s”, transform: ne.mood === m ? “scale(1.25)” : “scale(1)” } }, m)))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: `Mood: ${ne.moodScore}/10` },
React.createElement(“input”, { type: “range”, min: 1, max: 10, value: ne.moodScore, onChange: e => setNe(n => (Object.assign(Object.assign({}, n), { moodScore: +e.target.value }))), style: { width: “100%”, accentColor: “var(–violet)” } })),
React.createElement(Field, { label: `Energy: ${ne.energy}/10` },
React.createElement(“input”, { type: “range”, min: 1, max: 10, value: ne.energy, onChange: e => setNe(n => (Object.assign(Object.assign({}, n), { energy: +e.target.value }))), style: { width: “100%”, accentColor: “var(–rose)” } }))),
React.createElement(“div”, null,
React.createElement(“label”, { className: “label” }, “Quick Tags”),
React.createElement(“div”, { style: { display: “flex”, gap: 6, flexWrap: “wrap”, marginTop: 4 } }, TAGS.map(t => React.createElement(“span”, { key: t, onClick: () => setNe(e => (Object.assign(Object.assign({}, e), { tags: e.tags.includes(t) ? e.tags.replace(t, “”).trim() : e.tags + “ “ + t }))), className: `b ${ne.tags.includes(t) ? "bv" : "bi"}`, style: { cursor: “pointer” } }, t)))),
React.createElement(Field, { label: “Today’s Note” },
React.createElement(“textarea”, { className: “inp”, rows: 4, placeholder: “How are you feeling?”, value: ne.text, onChange: e => setNe(n => (Object.assign(Object.assign({}, n), { text: e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Save \uD83D\uDCD3”)))));
}
function BudgetPage({ data, setData, toast }) {
const [tab, setTab] = useState(“overview”);
const [showAddTx, setShowAddTx] = useState(false);
const [showAddBill, setShowAddBill] = useState(false);
const [filterCat, setFilterCat] = useState(“All”);
const [nt, setNt] = useState({ name: “”, amount: “”, category: “Groceries”, emoji: “💸”, note: “”, type: “expense” });
const [nb, setNb] = useState({ name: “”, amount: “”, dueDay: “”, emoji: “📄”, autoPay: false });
const b = data.budget;
const computedCats = b.categories.map(c => (Object.assign(Object.assign({}, c), { spent: +catSpent(b.transactions, c.name).toFixed(2) })));
const totalSpent = b.transactions.filter(t => t.amount < 0).reduce((s, t) => s + Math.abs(t.amount), 0);
const totalIncome = b.transactions.filter(t => t.amount > 0).reduce((s, t) => s + t.amount, 0);
const saved = totalIncome - totalSpent;
const savePct = totalIncome > 0 ? Math.round((saved / totalIncome) * 100) : 0;
const networth = b.assets.reduce((s, a) => s + a.amount, 0) - b.liabilities.reduce((s, l) => s + l.amount, 0);
const allCats = [“All”, “Income”, …b.categories.map(c => c.name)];
const filteredTx = filterCat === “All” ? b.transactions : b.transactions.filter(t => t.category === filterCat);
const addTx = () => {
if (!nt.name.trim() || !nt.amount)
return;
const amt = nt.type === “income” ? +Math.abs(+nt.amount) : -Math.abs(+nt.amount);
const tx = { id: Date.now(), date: TODAY(), name: nt.name, amount: amt, category: nt.type === “income” ? “Income” : nt.category, emoji: nt.emoji, note: nt.note };
setData(d => (Object.assign(Object.assign({}, d), { budget: Object.assign(Object.assign({}, d.budget), { transactions: [tx, …d.budget.transactions] }) })));
toast(nt.type === “income” ? `+$${Math.abs(amt).toFixed(2)} income logged 💚` : `-$${Math.abs(amt).toFixed(2)} logged`);
setShowAddTx(false);
setNt({ name: “”, amount: “”, category: “Groceries”, emoji: “💸”, note: “”, type: “expense” });
};
const addBill = () => {
if (!nb.name.trim() || !nb.amount || !nb.dueDay)
return;
setData(d => (Object.assign(Object.assign({}, d), { budget: Object.assign(Object.assign({}, d.budget), { bills: […d.budget.bills, { id: Date.now(), name: nb.name, amount: +nb.amount, dueDay: +nb.dueDay, emoji: nb.emoji, paid: false, autoPay: nb.autoPay }] }) })));
toast(`Bill "${nb.name}" added!`);
setShowAddBill(false);
setNb({ name: “”, amount: “”, dueDay: “”, emoji: “📄”, autoPay: false });
};
const toggleBillPaid = id => setData(d => (Object.assign(Object.assign({}, d), { budget: Object.assign(Object.assign({}, d.budget), { bills: d.budget.bills.map(bl => bl.id === id ? Object.assign(Object.assign({}, bl), { paid: !bl.paid }) : bl) }) })));
const delTx = id => setData(d => (Object.assign(Object.assign({}, d), { budget: Object.assign(Object.assign({}, d.budget), { transactions: d.budget.transactions.filter(t => t.id !== id) }) })));
const exportCSV = () => {
const rows = [[“Date”, “Description”, “Amount”, “Category”, “Note”], …b.transactions.map(t => [t.date, `"${t.name}"`, t.amount, t.category, t.note || “”])];
const csv = rows.map(r => r.join(”,”)).join(”\n”);
const url = URL.createObjectURL(new Blob([csv], { type: “text/csv” }));
const a = document.createElement(“a”);
a.href = url;
a.download = “lifesync-finance.csv”;
a.click();
toast(“Finance CSV exported! 📊”);
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh”, style: { flexWrap: “wrap”, gap: 10 } },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Finance \uD83D\uDCB0”),
React.createElement(“p”, { className: “ss2” },
savePct,
“% saved \u00B7 “,
computedCats.filter(c => c.spent > c.budget).length,
“ over budget”)),
React.createElement(“div”, { style: { display: “flex”, gap: 8, flexWrap: “wrap” } },
React.createElement(“button”, { className: “btn btn-s btn-sm”, onClick: exportCSV },
React.createElement(Ic, { n: “download”, size: 13 }),
“CSV”),
React.createElement(“button”, { className: “btn btn-p btn-sm”, onClick: () => setShowAddBill(true) }, “+ Bill”),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAddTx(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“Add Transaction”))),
React.createElement(“div”, { className: “tabs sp” }, [“overview”, “transactions”, “budgets”, “bills”, “networth”].map(t => React.createElement(“div”, { key: t, className: `tab ${tab === t ? "active" : ""}`, onClick: () => setTab(t), style: { textTransform: “capitalize” } }, t))),
tab === “overview” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 18 } },
React.createElement(“div”, { className: “g3” }, [{ icon: “💵”, val: `$${totalIncome.toLocaleString()}`, label: “Income”, color: “var(–mint)”, sub: `${b.incomeSources.length} sources` }, { icon: “💸”, val: `$${totalSpent.toFixed(0)}`, label: “Spent”, color: “var(–rose)”, sub: `${Math.round((totalSpent / totalIncome) * 100)}% of income` }, { icon: “🏦”, val: `$${saved.toFixed(0)}`, label: “Saved”, color: saved >= b.savingsGoal ? “var(–gold)” : “var(–text)”, sub: saved >= b.savingsGoal ? “Goal reached! 🎉” : `$${(b.savingsGoal - saved).toFixed(0)} to go` }].map((s, i) => (React.createElement(“div”, { key: i, className: “sc” },
React.createElement(“div”, { className: “si”, style: { background: `${s.color}18` } }, s.icon),
React.createElement(“div”, { className: “sv”, style: { color: s.color } }, s.val),
React.createElement(“div”, { className: “sl” }, s.label),
React.createElement(“div”, { className: “ss” }, s.sub))))),
React.createElement(“div”, { className: “card gg flex fac gap4”, style: { flexWrap: “wrap” } },
React.createElement(Ring, { value: saved, max: b.savingsGoal, size: 96, color: “var(–gold)”, label: `${savePct}%`, sub: “saved” }),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 17, fontWeight: 700, marginBottom: 4 } }, savePct >= 100 ? “Goal hit! 🎉” : savePct >= 50 ? “Halfway there! 💪” : “Building momentum ✨”),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, marginBottom: 10 } },
“$”,
saved.toFixed(0),
“ of $”,
b.savingsGoal.toLocaleString(),
“ goal”),
React.createElement(“div”, { className: “xb”, style: { height: 8 } },
React.createElement(“div”, { className: “xf”, style: { width: `${Math.min((saved / b.savingsGoal) * 100, 100)}%` } })))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “5-Month Trend”),
React.createElement(“div”, { style: { display: “flex”, gap: 6, height: 90, alignItems: “flex-end” } }, b.monthlyData.map((m, i) => {
const max = Math.max(…b.monthlyData.map(x => x.income));
return (React.createElement(“div”, { key: m.month, style: { flex: 1, display: “flex”, flexDirection: “column”, alignItems: “center”, gap: 4 } },
React.createElement(“div”, { style: { width: “100%”, position: “relative”, height: (m.income / max) * 70 } },
React.createElement(“div”, { style: { position: “absolute”, bottom: 0, left: 0, right: 0, height: (m.income / max) * 70, background: “rgba(127,255,212,0.3)”, borderRadius: “4px 4px 0 0” } }),
React.createElement(“div”, { style: { position: “absolute”, bottom: 0, left: 0, right: 0, height: (m.spent / max) * 70, background: “rgba(255,107,157,0.5)”, borderRadius: “4px 4px 0 0” } })),
React.createElement(“span”, { style: { fontSize: 10, color: “var(–text-dim)” } }, m.month)));
})),
React.createElement(“div”, { style: { display: “flex”, gap: 12, marginTop: 8, fontSize: 11 } },
React.createElement(“span”, { style: { display: “flex”, alignItems: “center”, gap: 4, color: “var(–text-muted)” } },
React.createElement(“span”, { style: { width: 8, height: 8, borderRadius: 2, background: “rgba(127,255,212,0.5)”, display: “inline-block” } }),
“Income”),
React.createElement(“span”, { style: { display: “flex”, alignItems: “center”, gap: 4, color: “var(–text-muted)” } },
React.createElement(“span”, { style: { width: 8, height: 8, borderRadius: 2, background: “rgba(255,107,157,0.5)”, display: “inline-block” } }),
“Spent”))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 13 } },
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Top Categories”),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: () => setTab(“transactions”) }, “All \u2192”)),
[…computedCats].sort((a, b) => b.spent - a.spent).slice(0, 4).map(cat => (React.createElement(“div”, { key: cat.id, style: { marginBottom: 13 } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 5 } },
React.createElement(“span”, { className: “flex fac gap2”, style: { fontSize: 13, fontWeight: 600 } },
cat.emoji,
“ “,
cat.name,
cat.spent > cat.budget && React.createElement(“span”, { className: “b br”, style: { fontSize: 9.5 } }, “Over!”)),
React.createElement(“span”, { style: { fontSize: 11.5, color: cat.spent > cat.budget ? “var(–rose)” : “var(–text-muted)” } },
“$”,
cat.spent.toFixed(0),
“ / $”,
cat.budget)),
React.createElement(“div”, { className: “pb” },
React.createElement(“div”, { className: “pf”, style: { width: `${Math.min((cat.spent / cat.budget) * 100, 100)}%`, background: cat.spent > cat.budget ? “var(–rose)” : cat.color } })))))))),
tab === “transactions” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 14 } },
React.createElement(“div”, { style: { display: “flex”, gap: 6, flexWrap: “wrap” } }, allCats.map(cat => React.createElement(“button”, { key: cat, onClick: () => setFilterCat(cat), className: `btn btn-sm ${filterCat === cat ? "btn-s" : "btn-g"}`, style: { fontSize: 11 } }, cat))),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)” } },
filteredTx.length,
“ transactions \u00B7 “,
React.createElement(“span”, { style: { color: “var(–rose)” } },
“-$”,
filteredTx.filter(t => t.amount < 0).reduce((s, t) => s + Math.abs(t.amount), 0).toFixed(2)),
“ \u00B7 “,
React.createElement(“span”, { style: { color: “var(–mint)” } },
“+$”,
filteredTx.filter(t => t.amount > 0).reduce((s, t) => s + t.amount, 0).toFixed(2))),
React.createElement(“div”, { className: “card”, style: { padding: 0, overflow: “hidden” } },
filteredTx.length === 0 && React.createElement(“div”, { style: { padding: 36, textAlign: “center”, color: “var(–text-muted)”, fontSize: 13 } }, “No transactions”),
filteredTx.map((tx, idx) => (React.createElement(“div”, { key: tx.id, className: “flex fac gap3”, style: { padding: “13px 17px”, borderBottom: idx < filteredTx.length - 1 ? “1px solid var(–border)” : “none”, cursor: “default” }, onMouseEnter: e => e.currentTarget.style.background = “var(–surface2)”, onMouseLeave: e => e.currentTarget.style.background = “” },
React.createElement(“div”, { style: { width: 38, height: 38, borderRadius: 11, background: tx.amount > 0 ? “rgba(127,255,212,0.1)” : “var(–surface2)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 19, flexShrink: 0 } }, tx.emoji),
React.createElement(“div”, { style: { flex: 1, minWidth: 0 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13 } }, tx.name),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-muted)”, display: “flex”, gap: 7, marginTop: 2, flexWrap: “wrap” } },
React.createElement(“span”, null, tx.date),
React.createElement(“span”, { className: `b ${tx.amount > 0 ? "bm" : "bi"}`, style: { fontSize: 9.5 } }, tx.category),
tx.note && React.createElement(“span”, { style: { color: “var(–text-dim)”, fontStyle: “italic” } }, tx.note))),
React.createElement(“span”, { style: { fontWeight: 700, fontSize: 15, color: tx.amount > 0 ? “var(–mint)” : “var(–rose)”, flexShrink: 0 } },
tx.amount > 0 ? “+” : “-”,
“$”,
Math.abs(tx.amount).toFixed(2)),
React.createElement(“button”, { className: “btn btn-g btn-ic”, style: { width: 26, height: 26, fontSize: 15, color: “var(–text-dim)”, flexShrink: 0 }, onClick: () => delTx(tx.id) }, “\u00D7”))))))),
tab === “budgets” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)” } },
“Budgeted: “,
React.createElement(“strong”, { style: { color: “var(–text)” } },
“$”,
computedCats.reduce((s, c) => s + c.budget, 0).toLocaleString()),
“ \u00B7 Spent: “,
React.createElement(“strong”, { style: { color: “var(–rose)” } },
“$”,
totalSpent.toFixed(0))),
computedCats.map(cat => {
const pct = Math.min((cat.spent / cat.budget) * 100, 100), over = cat.spent > cat.budget, rem = cat.budget - cat.spent;
return (React.createElement(“div”, { key: cat.id, className: “card”, style: { borderLeft: `3px solid ${over ? "var(--rose)" : cat.color}` } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 10 } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 21 } }, cat.emoji),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5 } }, cat.name),
React.createElement(“div”, { style: { fontSize: 11, color: over ? “var(–rose)” : “var(–mint)” } }, over ? `Over by $${Math.abs(rem).toFixed(0)}` : `$${rem.toFixed(0)} remaining`))),
React.createElement(“div”, { style: { textAlign: “right” } },
React.createElement(“div”, { style: { fontWeight: 800, fontSize: 16, color: over ? “var(–rose)” : “var(–text)” } },
“$”,
cat.spent.toFixed(0)),
React.createElement(“div”, { style: { fontSize: 10.5, color: “var(–text-dim)” } },
“/ $”,
cat.budget))),
React.createElement(“div”, { className: “pb”, style: { height: 7 } },
React.createElement(“div”, { className: “pf”, style: { width: `${pct}%`, background: over ? “var(–rose)” : cat.color, height: 7 } }))));
}))),
tab === “bills” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 14 } },
React.createElement(“div”, { className: “flex fac fjb” },
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontSize: 13, color: “var(–text-muted)” } },
“Monthly: “,
React.createElement(“strong”, { style: { color: “var(–text)” } },
“$”,
b.bills.reduce((s, bl) => s + bl.amount, 0).toFixed(0))),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, marginTop: 2 } },
“Annual: “,
React.createElement(“strong”, { style: { color: “var(–text)” } },
“$”,
(b.bills.reduce((s, bl) => s + bl.amount, 0) * 12).toLocaleString())))),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 10 } }, b.bills.map(bl => (React.createElement(“div”, { key: bl.id, className: “card flex fac gap3” },
React.createElement(“div”, { style: { width: 42, height: 42, borderRadius: 12, background: bl.paid ? “rgba(127,255,212,0.12)” : “var(–surface2)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 20, flexShrink: 0 } }, bl.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5 } }, bl.name),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)” } },
“Due: “,
bl.dueDay,
“th”,
bl.autoPay ? “ · AutoPay ✓” : “”)),
React.createElement(“div”, { style: { textAlign: “right” } },
React.createElement(“div”, { style: { fontWeight: 800, fontSize: 15 } },
“$”,
bl.amount),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-dim)” } }, “monthly”)),
React.createElement(“button”, { className: `btn btn-sm ${bl.paid ? "btn-s" : "btn-p"}`, onClick: () => toggleBillPaid(bl.id), style: { flexShrink: 0, fontSize: 11 } }, bl.paid ? “Paid ✓” : “Mark Paid”))))))),
tab === “networth” && (React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 16 } },
React.createElement(“div”, { className: “card gg” },
React.createElement(“div”, { style: { fontSize: 13, color: “var(–text-muted)”, marginBottom: 4 } }, “Total Net Worth”),
React.createElement(“div”, { style: { fontSize: 32, fontWeight: 800, color: “var(–gold)” } },
“$”,
networth.toLocaleString()),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, marginTop: 4 } },
“Assets “,
React.createElement(“strong”, { style: { color: “var(–mint)” } },
“+$”,
b.assets.reduce((s, a) => s + a.amount, 0).toLocaleString()),
“ \u00B7 Liabilities “,
React.createElement(“strong”, { style: { color: “var(–rose)” } },
“-$”,
b.liabilities.reduce((s, l) => s + l.amount, 0).toLocaleString()))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Assets”),
b.assets.map(a => React.createElement(“div”, { key: a.id, className: “flex fac fjb”, style: { padding: “10px 0”, borderBottom: “1px solid var(–border)” } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 18 } }, a.emoji),
React.createElement(“span”, { style: { fontSize: 13, fontWeight: 600 } }, a.name)),
React.createElement(“span”, { style: { fontWeight: 700, color: “var(–mint)” } },
“$”,
a.amount.toLocaleString()))),
React.createElement(“div”, { className: “flex fac fjb”, style: { paddingTop: 10, fontWeight: 700 } },
React.createElement(“span”, null, “Total”),
React.createElement(“span”, { style: { color: “var(–mint)” } },
“$”,
b.assets.reduce((s, a) => s + a.amount, 0).toLocaleString()))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Liabilities”),
b.liabilities.map(l => React.createElement(“div”, { key: l.id, className: “flex fac fjb”, style: { padding: “10px 0”, borderBottom: “1px solid var(–border)” } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 18 } }, l.emoji),
React.createElement(“span”, { style: { fontSize: 13, fontWeight: 600 } }, l.name)),
React.createElement(“span”, { style: { fontWeight: 700, color: “var(–rose)” } },
“-$”,
l.amount.toLocaleString()))),
React.createElement(“div”, { className: “flex fac fjb”, style: { paddingTop: 10, fontWeight: 700 } },
React.createElement(“span”, null, “Total”),
React.createElement(“span”, { style: { color: “var(–rose)” } },
“-$”,
b.liabilities.reduce((s, l) => s + l.amount, 0).toLocaleString()))))),
React.createElement(Modal, { open: showAddTx, onClose: () => setShowAddTx(false), title: “Add Transaction” },
React.createElement(“div”, { className: “tabs”, style: { marginBottom: 14 } },
React.createElement(“div”, { className: `tab ${nt.type === "expense" ? "active" : ""}`, onClick: () => setNt(t => (Object.assign(Object.assign({}, t), { type: “expense”, emoji: “💸” }))) }, “\uD83D\uDCB8 Expense”),
React.createElement(“div”, { className: `tab ${nt.type === "income" ? "active" : ""}`, onClick: () => setNt(t => (Object.assign(Object.assign({}, t), { type: “income”, emoji: “💵” }))) }, “\uD83D\uDCB5 Income”)),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } },
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(Field, { label: “Emoji”, style: { width: 58 } },
React.createElement(“input”, { className: “inp”, value: nt.emoji, onChange: e => setNt(t => (Object.assign(Object.assign({}, t), { emoji: e.target.value }))), style: { textAlign: “center”, fontSize: 20, padding: “8px 4px” } })),
React.createElement(Field, { label: “Description”, style: { flex: 1 } },
React.createElement(“input”, { className: “inp”, placeholder: “Trader Joe’s”, value: nt.name, onChange: e => setNt(t => (Object.assign(Object.assign({}, t), { name: e.target.value }))) }))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Amount ($)” },
React.createElement(“input”, { className: “inp”, type: “number”, step: “0.01”, placeholder: “0.00”, value: nt.amount, onChange: e => setNt(t => (Object.assign(Object.assign({}, t), { amount: e.target.value }))) })),
nt.type === “expense” && React.createElement(Field, { label: “Category” },
React.createElement(“select”, { className: “inp”, value: nt.category, onChange: e => setNt(t => (Object.assign(Object.assign({}, t), { category: e.target.value }))) }, b.categories.map(c => React.createElement(“option”, { key: c.id }, c.name))))),
React.createElement(Field, { label: “Note” },
React.createElement(“input”, { className: “inp”, placeholder: “Optional note”, value: nt.note, onChange: e => setNt(t => (Object.assign(Object.assign({}, t), { note: e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAddTx(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: addTx }, “Add”))),
React.createElement(Modal, { open: showAddBill, onClose: () => setShowAddBill(false), title: “Add Bill \uD83D\uDCC4” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } },
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(Field, { label: “Emoji”, style: { width: 58 } },
React.createElement(“input”, { className: “inp”, value: nb.emoji, onChange: e => setNb(b => (Object.assign(Object.assign({}, b), { emoji: e.target.value }))), style: { textAlign: “center”, fontSize: 20, padding: “8px 4px” } })),
React.createElement(Field, { label: “Bill Name”, style: { flex: 1 } },
React.createElement(“input”, { className: “inp”, placeholder: “Electric”, value: nb.name, onChange: e => setNb(b => (Object.assign(Object.assign({}, b), { name: e.target.value }))) }))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Amount ($)” },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “85”, value: nb.amount, onChange: e => setNb(b => (Object.assign(Object.assign({}, b), { amount: e.target.value }))) })),
React.createElement(Field, { label: “Due Day” },
React.createElement(“input”, { className: “inp”, type: “number”, min: “1”, max: “31”, placeholder: “15”, value: nb.dueDay, onChange: e => setNb(b => (Object.assign(Object.assign({}, b), { dueDay: e.target.value }))) }))),
React.createElement(“div”, { style: { display: “flex”, alignItems: “center”, gap: 10 } },
React.createElement(“input”, { type: “checkbox”, checked: nb.autoPay, onChange: e => setNb(b => (Object.assign(Object.assign({}, b), { autoPay: e.target.checked }))), style: { accentColor: “var(–violet)”, width: 16, height: 16 } }),
React.createElement(“label”, { style: { fontSize: 13 } }, “AutoPay”))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAddBill(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: addBill }, “Add Bill”)))));
}
function GoalsPage({ data, setData, toast }) {
const [showAdd, setShowAdd] = useState(false);
const [ng, setNg] = useState({ name: “”, category: “Custom”, current: “”, target: “”, unit: “”, deadline: “”, emoji: “🎯”, color: “var(–violet)”, reverse: false });
const add = () => {
if (!ng.name.trim() || !ng.target)
return;
setData(d => (Object.assign(Object.assign({}, d), { goals: […d.goals, Object.assign(Object.assign({ id: Date.now() }, ng), { current: +ng.current || 0, target: +ng.target })] })));
toast(“New goal added! 🎯”);
setShowAdd(false);
setNg({ name: “”, category: “Custom”, current: “”, target: “”, unit: “”, deadline: “”, emoji: “🎯”, color: “var(–violet)”, reverse: false });
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “flex fac fjb sh” },
React.createElement(“div”, null,
React.createElement(“h2”, { className: “st” }, “Goals \uD83C\uDFAF”),
React.createElement(“p”, { className: “ss2” },
data.goals.length,
“ active goals”)),
React.createElement(“button”, { className: “btn btn-p”, onClick: () => setShowAdd(true) },
React.createElement(Ic, { n: “plus”, size: 15, color: “#fff” }),
“New Goal”)),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 14 } }, data.goals.map(g => {
const pct = g.reverse ? Math.min(100, Math.round(((g.target * 2 - g.current) / (g.target)) * 100)) : Math.min(100, Math.round((g.current / g.target) * 100));
const days = DAYS_LEFT(g.deadline), done = pct >= 100;
return (React.createElement(“div”, { key: g.id, className: “card”, style: { borderLeft: `3px solid ${g.color}` } },
React.createElement(“div”, { className: “flex fac gap3”, style: { flexWrap: “wrap” } },
React.createElement(“span”, { style: { fontSize: 28 } }, g.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { className: “flex fac fjb”, style: { flexWrap: “wrap”, gap: 6 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 15 } }, g.name),
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { className: “b”, style: { background: `${g.color}1a`, color: g.color, fontSize: 10 } }, g.category),
done && React.createElement(“span”, { className: “b bm” }, “Done! \uD83C\uDF89”))),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, margin: “5px 0 10px” } },
“Current: “,
React.createElement(“strong”, { style: { color: “var(–text)” } },
g.current,
“ “,
g.unit),
“ \u2192 Target: “,
React.createElement(“strong”, { style: { color: g.color } },
g.target,
“ “,
g.unit)),
React.createElement(“div”, { className: “pb”, style: { marginBottom: 6 } },
React.createElement(“div”, { className: “pf”, style: { width: `${pct}%`, background: g.color } })),
React.createElement(“div”, { className: “flex fac fjb”, style: { fontSize: 11, color: “var(–text-dim)” } },
React.createElement(“span”, null,
pct,
“% complete”),
days !== null && React.createElement(“span”, null,
“\u23F0 “,
days,
“d left”)),
React.createElement(“div”, { className: “flex fac gap2”, style: { marginTop: 10 } },
React.createElement(“input”, { className: “inp”, type: “number”, step: “0.1”, placeholder: “Update progress…”, style: { maxWidth: 160, fontSize: 12 }, onBlur: e => { if (e.target.value) {
setData(d => (Object.assign(Object.assign({}, d), { goals: d.goals.map(x => x.id === g.id ? Object.assign(Object.assign({}, x), { current: +e.target.value }) : x) })));
e.target.value = “”;
} }, onKeyDown: e => { if (e.key === “Enter” && e.target.value) {
setData(d => (Object.assign(Object.assign({}, d), { goals: d.goals.map(x => x.id === g.id ? Object.assign(Object.assign({}, x), { current: +e.target.value }) : x) })));
e.target.value = “”;
} } }),
React.createElement(“button”, { className: “btn btn-g btn-sm”, style: { fontSize: 12, color: “var(–text-dim)” }, onClick: () => setData(d => (Object.assign(Object.assign({}, d), { goals: d.goals.filter(x => x.id !== g.id) }))) }, “Remove”))))));
})),
React.createElement(Modal, { open: showAdd, onClose: () => setShowAdd(false), title: “New Goal \uD83C\uDFAF” },
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 11 } },
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(Field, { label: “Emoji”, style: { width: 58 } },
React.createElement(“input”, { className: “inp”, value: ng.emoji, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { emoji: e.target.value }))), style: { textAlign: “center”, fontSize: 20, padding: “8px 4px” } })),
React.createElement(Field, { label: “Goal Name”, style: { flex: 1 } },
React.createElement(“input”, { className: “inp”, placeholder: “Run 5K under 25min”, value: ng.name, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { name: e.target.value }))) }))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Category” },
React.createElement(“select”, { className: “inp”, value: ng.category, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { category: e.target.value }))) }, [“Weight”, “Fitness”, “Nutrition”, “Budget”, “Skincare”, “Sleep”, “Habits”, “Custom”].map(c => React.createElement(“option”, { key: c }, c)))),
React.createElement(Field, { label: “Unit” },
React.createElement(“input”, { className: “inp”, placeholder: “lbs, min, $, days…”, value: ng.unit, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { unit: e.target.value }))) }))),
React.createElement(“div”, { className: “g2” },
React.createElement(Field, { label: “Current” },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “0”, value: ng.current, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { current: e.target.value }))) })),
React.createElement(Field, { label: “Target” },
React.createElement(“input”, { className: “inp”, type: “number”, placeholder: “100”, value: ng.target, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { target: e.target.value }))) }))),
React.createElement(Field, { label: “Deadline (e.g. Aug 1)” },
React.createElement(“input”, { className: “inp”, placeholder: “Aug 1”, value: ng.deadline, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { deadline: e.target.value }))) })),
React.createElement(“div”, { style: { display: “flex”, alignItems: “center”, gap: 10 } },
React.createElement(“input”, { type: “checkbox”, checked: ng.reverse, onChange: e => setNg(g => (Object.assign(Object.assign({}, g), { reverse: e.target.checked }))), style: { accentColor: “var(–violet)”, width: 16, height: 16 } }),
React.createElement(“label”, { style: { fontSize: 13 } }, “Lower is better (weight, run time)”))),
React.createElement(“div”, { style: { display: “flex”, gap: 9, marginTop: 18 } },
React.createElement(“button”, { className: “btn btn-g w100”, onClick: () => setShowAdd(false) }, “Cancel”),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: add }, “Add Goal \uD83C\uDFAF”)))));
}
function ProgressPage({ data }) {
const { level, xpInLevel, xpNeeded } = calcLevel(data.user.xp);
const unlocked = data.achievements.filter(a => a.unlocked).length;
const avgMood = (data.journal.entries.slice(0, 7).reduce((s, e) => s + (e.moodScore || 5), 0) / Math.min(data.journal.entries.length, 7)).toFixed(1);
const avgSleep = (data.sleep.logs.slice(0, 7).reduce((s, l) => s + l.hours, 0) / Math.min(data.sleep.logs.length, 7)).toFixed(1);
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “sh” },
React.createElement(“h2”, { className: “st” }, “Progress \uD83D\uDCCA”),
React.createElement(“p”, { className: “ss2” }, “Your wellness analytics”)),
React.createElement(“div”, { className: “card gg sp flex fac gap4”, style: { flexWrap: “wrap” } },
React.createElement(“div”, { style: { width: 68, height: 68, borderRadius: “50%”, background: “var(–grad-gold)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 30, flexShrink: 0 } }, “\u2B50”),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontSize: 21, fontWeight: 800 } },
“Level “,
level,
“ Wellness Warrior”),
React.createElement(“div”, { style: { fontSize: 12.5, color: “var(–text-muted)”, marginBottom: 9 } },
data.user.xp.toLocaleString(),
“ XP \u00B7 “,
xpNeeded - xpInLevel,
“ to Level “,
level + 1),
React.createElement(“div”, { className: “xb”, style: { height: 9 } },
React.createElement(“div”, { className: “xf”, style: { width: `${(xpInLevel / xpNeeded) * 100}%` } })))),
React.createElement(“div”, { className: “g4 sp” }, [{ icon: “😊”, val: avgMood + “/10”, label: “Avg Mood”, color: “var(–violet)” }, { icon: “😴”, val: avgSleep + “h”, label: “Avg Sleep”, color: “var(–sky)” }, { icon: “🔥”, val: Math.max(…data.habits.map(h => h.streak)) + “d”, label: “Best Streak”, color: “var(–gold)” }, { icon: “🏆”, val: `${unlocked}/${data.achievements.length}`, label: “Achievements”, color: “var(–mint)” }].map((s, i) => (React.createElement(“div”, { key: i, className: “sc” },
React.createElement(“div”, { className: “si”, style: { background: `${s.color}18` } }, s.icon),
React.createElement(“div”, { className: “sv”, style: { color: s.color } }, s.val),
React.createElement(“div”, { className: “sl” }, s.label))))),
React.createElement(“div”, { className: “g2 sp” },
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Calories (7d)”),
React.createElement(BarChart, { data: data.nutrition.weekData, color: “var(–peach)”, height: 70, labels: WEEK_LABELS.map(d => d[0]) })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Workouts (7d)”),
React.createElement(BarChart, { data: data.fitness.weekData, color: “var(–violet)”, height: 70, labels: WEEK_LABELS.map(d => d[0]) })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Sleep (7d)”),
React.createElement(BarChart, { data: […data.sleep.logs].reverse().slice(0, 7).map(l => l.hours), color: “var(–sky)”, height: 70, labels: […data.sleep.logs].reverse().slice(0, 7).map(l => l.date.slice(-2)) })),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Mood (7d)”),
React.createElement(BarChart, { data: (data.journal.entries.length ? […data.journal.entries].slice(0, 7).reverse() : []).map(e => e.moodScore || 5), color: “var(–rose)”, height: 70, labels: […data.journal.entries].reverse().slice(0, 7).map(e => e.date.slice(-2)) }))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 4 } }, “\uD83C\uDFC6 Achievements”),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, marginBottom: 14 } },
unlocked,
“/”,
data.achievements.length,
“ unlocked”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 9 } }, data.achievements.map(a => (React.createElement(“div”, { key: a.id, className: `ach ${a.unlocked ? "ul" : ""}` },
React.createElement(“div”, { className: `ai2 ${a.unlocked ? "" : "lk"}`, style: { background: `${a.color}1a` } }, a.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, color: a.unlocked ? a.color : “var(–text-dim)” } }, a.name),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)” } }, a.desc)),
a.unlocked ? React.createElement(“span”, { className: “b bg” }, “\u2713 Earned”) : React.createElement(Ic, { n: “lock”, size: 15, color: “var(–text-dim)” }))))))));
}
function CheckInPage({ data, setData, toast }) {
const [mood, setMood] = useState(7), [energy, setEnergy] = useState(7), [weight, setWeight] = useState(””), [notes, setNotes] = useState(””), [done, setDone] = useState(false);
const submit = () => {
setData(d => { var _a; return (Object.assign(Object.assign({}, d), { checkins: [{ id: Date.now(), date: TODAY(), weight: +weight || ((_a = d.checkins[0]) === null || _a === void 0 ? void 0 : _a.weight) || 0, mood, energy, notes }, …d.checkins], user: Object.assign(Object.assign({}, d.user), { xp: d.user.xp + 30 }) })); });
toast(”+30 XP · Check-in saved! 🌟”, “xp”);
setDone(true);
};
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “sh” },
React.createElement(“h2”, { className: “st” }, “Check-In \uD83D\uDCCB”),
React.createElement(“p”, { className: “ss2” }, “Weekly wellness snapshot”)),
!done ? (React.createElement(“div”, { className: “card gr”, style: { maxWidth: 480 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 17, marginBottom: 18 } }, “How are you feeling? \uD83C\uDF38”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 16 } },
React.createElement(Field, { label: `Mood: ${mood}/10 ${mood >= 8 ? "😄" : mood >= 6 ? "🙂" : "😔"}` },
React.createElement(“input”, { type: “range”, min: 1, max: 10, value: mood, onChange: e => setMood(+e.target.value), style: { width: “100%”, accentColor: “var(–rose)” } })),
React.createElement(Field, { label: `Energy: ${energy}/10 ${energy >= 8 ? "⚡" : energy >= 6 ? "💫" : "😴"}` },
React.createElement(“input”, { type: “range”, min: 1, max: 10, value: energy, onChange: e => setEnergy(+e.target.value), style: { width: “100%”, accentColor: “var(–violet)” } })),
React.createElement(Field, { label: “Weight (optional)” },
React.createElement(“input”, { className: “inp”, type: “number”, step: “0.1”, placeholder: “134.9”, value: weight, onChange: e => setWeight(e.target.value) })),
React.createElement(Field, { label: “Notes” },
React.createElement(“textarea”, { className: “inp”, rows: 3, placeholder: “How was your week?”, value: notes, onChange: e => setNotes(e.target.value) })),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: submit }, “Save Check-In \u2728”)))) : (React.createElement(“div”, { className: “card gm”, style: { maxWidth: 480, textAlign: “center”, padding: 40 } },
React.createElement(“div”, { style: { fontSize: 48, marginBottom: 14 } }, “\uD83C\uDF89”),
React.createElement(“div”, { style: { fontSize: 21, fontWeight: 800, marginBottom: 7 } }, “Check-in saved!”),
React.createElement(“div”, { style: { color: “var(–text-muted)”, fontSize: 13 } }, “+30 XP earned. Keep it up!”),
React.createElement(“button”, { className: “btn btn-s”, style: { marginTop: 18 }, onClick: () => setDone(false) }, “Log another”))),
React.createElement(“div”, { className: “card”, style: { marginTop: 18 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 13 } }, “Past Check-ins”),
data.checkins.map((c, i) => (React.createElement(“div”, { key: i, style: { padding: “13px 15px”, background: “var(–surface2)”, borderRadius: 14, border: “1px solid var(–border)”, marginBottom: 9 } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 7 } },
React.createElement(“span”, { style: { fontWeight: 700 } }, c.date),
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { className: “b br” },
“\uD83D\uDE0A “,
c.mood,
“/10”),
React.createElement(“span”, { className: “b bv” },
“\u26A1 “,
c.energy,
“/10”),
c.weight && React.createElement(“span”, { className: “b bm” },
“\u2696\uFE0F “,
c.weight,
“ lbs”))),
c.notes && React.createElement(“p”, { style: { fontSize: 12.5, color: “var(–text-muted)” } }, c.notes)))))));
}
function AICoachPage({ data, setData, toast }) {
var _a;
const [input, setInput] = useState(””), [loading, setLoading] = useState(false);
const endRef = useRef(null), inputRef = useRef(null);
useEffect(() => { var _a; return (_a = endRef.current) === null || _a === void 0 ? void 0 : _a.scrollIntoView({ behavior: “smooth” }); }, [data.messages]);
const avgSleep = (data.sleep.logs.slice(0, 7).reduce((s, l) => s + l.hours, 0) / Math.min(data.sleep.logs.length, 7)).toFixed(1);
const cycle = getCyclePhase(data.cycle.lastPeriodStart, data.cycle.cycleLength);
const recentMoods = data.journal.entries.slice(0, 5).map(e => `${e.date}: ${e.moodScore}/10`).join(”, “);
const computedCats = data.budget.categories.map(c => (Object.assign(Object.assign({}, c), { spent: +catSpent(data.budget.transactions, c.name).toFixed(2) })));
const overBudget = computedCats.filter(c => c.spent > c.budget).map(c => c.name).join(”, “) || “none”;
const system = `You are Luna, a warm empowering AI wellness coach in LifeSync for ${data.user.name}. DATA: Level ${calcLevel(data.user.xp).level}, ${data.user.xp} XP. Streaks: habits ${data.streaks.habits}d, workouts ${data.streaks.workouts}d, journaling ${data.streaks.logging}d. Today: ${data.habits.filter(h => h.doneToday).length}/${data.habits.length} habits. Calories: ${data.nutrition.calories.current}/${data.settings.calorieGoal}. Water: ${data.nutrition.water.current}/${data.settings.waterGoal} cups. Avg sleep: ${avgSleep}h (goal ${data.sleep.goalHours}h). ${((_a = data.settings) === null || _a === void 0 ? void 0 : _a.gender) === "male" ? "" : (`Cycle phase: ${cycle.phase} day ${cycle.day}. `)}Recent moods: ${recentMoods}. Over budget: ${overBudget}. Be warm, brief (2-4 sentences), 1-2 emojis, specific and data-driven.`;
const send = async () => {
var _a, _b, _c;
if (!input.trim() || loading)
return;
const msg = input.trim();
setInput(””);
setData(d => (Object.assign(Object.assign({}, d), { messages: […d.messages, { role: “user”, content: msg }] })));
setLoading(true);
try {
// NVIDIA NIM API — OpenAI-compatible, free tier
const NVIDIA_KEY = “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”;
const apiMessages = [
{ role: “system”, content: system },
…data.messages.slice(-10).map(m => ({ role: m.role === “ai” ? “assistant” : “user”, content: m.content })),
{ role: “user”, content: msg }
];
const res = await fetch(“https://integrate.api.nvidia.com/v1/chat/completions”, {
method: “POST”,
headers: {
“Content-Type”: “application/json”,
“Authorization”: “Bearer “ + NVIDIA_KEY,
“Accept”: “application/json”
},
body: JSON.stringify({
model: “minimaxai/minimax-m2.7”,
messages: apiMessages,
temperature: 0.7,
top_p: 0.95,
max_tokens: 1000,
stream: false
})
});
if (!res.ok) {
const errText = await res.text().catch(() => “”);
throw new Error(“API error “ + res.status + “: “ + errText.slice(0, 150));
}
const d = await res.json();
const text = ((_c = (_b = (_a = d.choices) === null || _a === void 0 ? void 0 : _a[0]) === null || _b === void 0 ? void 0 : _b.message) === null || _c === void 0 ? void 0 : _c.content) || “I’m here to help! Ask me anything about your wellness journey ✨”;
setData(d => (Object.assign(Object.assign({}, d), { messages: […d.messages, { role: “ai”, content: text }] })));
}
catch (err) {
setData(d => (Object.assign(Object.assign({}, d), { messages: […d.messages, { role: “ai”, content: “Couldn’t reach the AI right now (” + (err.message || “unknown error”) + “). Try again in a moment! ✨” }] })));
}
setLoading(false);
};
const suggestions = [“What should I focus on today?”, “Analyze my week”, “Help me hit my protein goal”, “Plan a workout”, “How’s my budget?”, “Tips for my cycle phase?”];
return (React.createElement(“div”, { className: “pe”, style: { display: “flex”, flexDirection: “column”, height: “calc(100vh - 110px)” } },
React.createElement(“div”, { className: “sh” },
React.createElement(“h2”, { className: “st” }, “AI Coach \u2728”),
React.createElement(“p”, { className: “ss2” }, “Luna knows your full health data \u00B7 Powered by MiniMax”)),
React.createElement(“div”, { className: “card”, style: { flex: 1, display: “flex”, flexDirection: “column”, overflow: “hidden” } },
React.createElement(“div”, { style: { flex: 1, overflowY: “auto”, display: “flex”, flexDirection: “column”, gap: 13, padding: “4px 0”, marginBottom: 4 } },
data.messages.map((m, i) => (React.createElement(“div”, { key: i, style: { display: “flex”, gap: 9, alignItems: “flex-end”, flexDirection: m.role === “user” ? “row-reverse” : “row” } },
m.role === “ai” && React.createElement(“div”, { style: { width: 30, height: 30, borderRadius: “50%”, background: “var(–grad-violet)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 14, flexShrink: 0 } }, “\u2728”),
React.createElement(“div”, { className: `cb ${m.role === "ai" ? "ai" : "user"}` }, m.content)))),
loading && React.createElement(“div”, { style: { display: “flex”, gap: 9, alignItems: “flex-end” } },
React.createElement(“div”, { style: { width: 30, height: 30, borderRadius: “50%”, background: “var(–grad-violet)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 14 } }, “\u2728”),
React.createElement(“div”, { className: “cb ai loading”, style: { width: 70, height: 34 } },
React.createElement(“span”, { style: { letterSpacing: 4 } }, “\u00B7\u00B7\u00B7”))),
React.createElement(“div”, { ref: endRef })),
data.messages.length < 3 && React.createElement(“div”, { style: { display: “flex”, gap: 6, flexWrap: “wrap”, marginBottom: 11 } }, suggestions.map(s => React.createElement(“button”, { key: s, className: “btn btn-s btn-sm”, style: { fontSize: 11 }, onClick: () => { var _a; setInput(s); (_a = inputRef.current) === null || _a === void 0 ? void 0 : _a.focus(); } }, s))),
React.createElement(“div”, { style: { display: “flex”, gap: 9 } },
React.createElement(“input”, { ref: inputRef, className: “inp”, placeholder: “Ask Luna anything about your health, goals, or life\u2026”, value: input, onChange: e => setInput(e.target.value), onKeyDown: e => e.key === “Enter” && send() }),
React.createElement(“button”, { className: “btn btn-p btn-ic”, onClick: send, disabled: loading || !input.trim() },
React.createElement(Ic, { n: “send”, size: 15, color: “#fff” }))))));
}
function SettingsPage({ data, setData, toast, installed = false, installPrompt = null, install = () => { }, notifStatus = ‘default’, requestNotifs = () => { } }) {
const [s, setS] = useState(Object.assign({}, data.settings));
const [name, setName] = useState(data.user.name);
const save = () => { setData(d => (Object.assign(Object.assign({}, d), { settings: s, user: Object.assign(Object.assign({}, d.user), { name }) }))); toast(“Settings saved! ✨”); };
const exportData = () => {
const url = URL.createObjectURL(new Blob([JSON.stringify(data, null, 2)], { type: “application/json” }));
const a = document.createElement(“a”);
a.href = url;
a.download = `lifesync-backup-${new Date().toISOString().slice(0, 10)}.json`;
a.click();
toast(“Full backup exported! 💾”);
};
const importData = e => {
var _a;
const file = (_a = e.target.files) === null || _a === void 0 ? void 0 : _a[0];
if (!file)
return;
const reader = new FileReader();
reader.onload = ev => { try {
setData(JSON.parse(ev.target.result));
toast(“Backup restored! ✨”);
}
catch (_a) {
toast(“Invalid file”, “error”);
} };
reader.readAsText(file);
};
const otherIntegrations = [
{ name: “Apple Health”, emoji: “🍎”, status: “Manual (iOS Shortcuts)”, howto: “iOS Shortcuts app → Create automation → Log data via a LifeSync shortcut. Full HealthKit access needs the React Native build.” },
{ name: “Plaid (Banking)”, emoji: “🏦”, status: “Requires signup”, howto: “Sign up at plaid.com/docs → Free dev tier → Connects Chase, BofA, most US banks. Auto-imports all transactions with categories.” },
{ name: “Workday (Payroll)”, emoji: “💼”, status: “Needs IT access”, howto: “Ask HR/IT: ‘I need read access to my employee data via Workday REST API — payroll and time-off endpoints.’ They provide OAuth credentials.” },
{ name: “Google Fit”, emoji: “📱”, status: “API available (free)”, howto: “Enable Google Fit API at console.cloud.google.com → OAuth flow → Pulls steps, sleep, workouts on Android devices.” },
{ name: “Open Food Facts”, emoji: “🥗”, status: “✅ Already connected!”, howto: “Free, no key needed. Already powering your Nutrition food search — 3M+ products worldwide.” },
];
return (React.createElement(“div”, { className: “pe” },
React.createElement(“div”, { className: “sh” },
React.createElement(“h2”, { className: “st” }, “Settings \u2699\uFE0F”),
React.createElement(“p”, { className: “ss2” }, “Personalize LifeSync”)),
React.createElement(“div”, { className: “card gm”, style: { display: “flex”, alignItems: “center”, gap: 14, padding: “14px 18px” } },
React.createElement(“div”, { style: { width: 38, height: 38, borderRadius: 12, background: “rgba(127,255,212,0.15)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 20, flexShrink: 0 } }, “\u2601\uFE0F”),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13 } }, “Supabase Cloud Storage”),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)”, marginTop: 2 } }, “Auto-saves every 3 seconds \u00B7 Syncs across devices”)),
React.createElement(“span”, { className: “b bm”, style: { fontSize: 10 } }, “\u25CF Connected”)),
React.createElement(“div”, { className: “card”, style: { borderColor: installed ? “rgba(127,255,212,0.3)” : “var(–border)” } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: installed || notifStatus === “granted” ? 12 : 0 } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 20 } }, “\uD83D\uDCF1”),
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5 } }, “Install as App”),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)”, marginTop: 2 } }, installed ? “Installed on this device” : “Add to home screen”))),
installed ? React.createElement(“span”, { className: “b bm”, style: { fontSize: 10 } }, “\u2713 Installed”) :
installPrompt ? React.createElement(“button”, { className: “btn btn-p btn-sm”, onClick: install }, “Install”) :
React.createElement(“span”, { className: “b bi”, style: { fontSize: 10 } }, “Open in browser to install”)),
installed && (React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)” } }, “LifeSync is installed on this device. Opens like a native app, works offline. \u2728”)),
React.createElement(“div”, { style: { height: 1, background: “var(–border)”, margin: “12px 0” } }),
React.createElement(“div”, { className: “flex fac fjb” },
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13 } }, “\uD83D\uDD14 Notifications”),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)”, marginTop: 2 } }, notifStatus === “granted” ? “Habit reminders · Water alerts · Bill warnings” :
notifStatus === “denied” ? “Blocked in browser settings” :
notifStatus === “unsupported” ? “Not supported on this device” :
“Get reminders for habits, water & bills”)),
notifStatus === “default” && React.createElement(“button”, { className: “btn btn-s btn-sm”, onClick: requestNotifs }, “Enable”),
notifStatus === “granted” && React.createElement(“span”, { className: “b bm”, style: { fontSize: 10 } }, “\u2713 On”),
notifStatus === “denied” && React.createElement(“span”, { className: “b br”, style: { fontSize: 10 } }, “Blocked”))),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 14 } },
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Profile”),
React.createElement(Field, { label: “Your Name” },
React.createElement(“input”, { className: “inp”, value: name, onChange: e => setName(e.target.value) }))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Daily Goals”),
React.createElement(“div”, { className: “g2”, style: { gap: 12 } }, [[“calorieGoal”, “Calorie Goal”, “kcal”], [“proteinGoal”, “Protein Goal”, “g”], [“carbsGoal”, “Carbs Goal”, “g”], [“fatGoal”, “Fat Goal”, “g”], [“waterGoal”, “Water Goal”, “cups”], [“workoutGoalPerWeek”, “Workouts / Week”, “sessions”], [“savingsGoal”, “Monthly Savings”, “$”]].map(([k, label, unit]) => (React.createElement(Field, { key: k, label: `${label} (${unit})` },
React.createElement(“input”, { className: “inp”, type: “number”, value: s[k], onChange: e => setS(x => (Object.assign(Object.assign({}, x), { [k]: +e.target.value }))) })))))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Preferences”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 12 } },
React.createElement(“div”, { className: “flex fac fjb” },
React.createElement(“div”, null,
React.createElement(“div”, { style: { fontSize: 13 } }, “Mode”),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)”, marginTop: 2 } }, s.gender === “male” ? “Hides cycle tracking” : “Shows cycle tracking”)),
React.createElement(“select”, { className: “inp”, style: { width: 130 }, value: s.gender || “female”, onChange: e => setS(x => (Object.assign(Object.assign({}, x), { gender: e.target.value }))) },
React.createElement(“option”, { value: “female” }, “Female”),
React.createElement(“option”, { value: “male” }, “Male”))),
React.createElement(“div”, { className: “flex fac fjb” },
React.createElement(“span”, { style: { fontSize: 13 } }, “Weight Unit”),
React.createElement(“select”, { className: “inp”, style: { width: 100 }, value: s.weightUnit, onChange: e => setS(x => (Object.assign(Object.assign({}, x), { weightUnit: e.target.value }))) },
React.createElement(“option”, null, “lbs”),
React.createElement(“option”, null, “kg”))),
React.createElement(“div”, { className: “flex fac fjb” },
React.createElement(“span”, { style: { fontSize: 13 } }, “Currency”),
React.createElement(“select”, { className: “inp”, style: { width: 100 }, value: s.currency, onChange: e => setS(x => (Object.assign(Object.assign({}, x), { currency: e.target.value }))) }, [“USD”, “EUR”, “GBP”, “CAD”, “AUD”, “JPY”].map(c => React.createElement(“option”, { key: c }, c)))))),
React.createElement(“button”, { className: “btn btn-p w100”, onClick: save, style: { padding: “12px” } }, “Save Settings \u2728”),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 14 } }, “Data & Backup”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 10 } },
React.createElement(“button”, { className: “btn btn-p w100”, onClick: () => {
if (window.confirm(“Start fresh? This will erase all demo data (Aria, fake habits, fake transactions) and give you a blank slate. Your settings stay.”)) {
setData(makeEmptyData());
toast(“Fresh start! Set up your profile in Settings ✨”, “success”);
}
} },
React.createElement(Ic, { n: “sparkles”, size: 14 }),
“Start Fresh (clear demo data)”),
React.createElement(“button”, { className: “btn btn-s w100”, onClick: exportData },
React.createElement(Ic, { n: “download”, size: 14 }),
“Export Full Backup (JSON)”),
React.createElement(“label”, { className: “btn btn-s w100”, style: { cursor: “pointer”, justifyContent: “center” } },
React.createElement(Ic, { n: “upload”, size: 14 }),
“Restore from Backup”,
React.createElement(“input”, { type: “file”, accept: “.json”, onChange: importData, style: { display: “none” } })),
React.createElement(“button”, { className: “btn btn-danger w100”, onClick: () => { if (window.confirm(“Reset ALL data including settings? This cannot be undone.”)) {
localStorage.removeItem(“lifesync-v6”);
window.location.reload();
} } },
React.createElement(Ic, { n: “refresh”, size: 14 }),
“Reset Everything”))),
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, color: “var(–text-muted)”, marginBottom: -6 } }, “\uD83D\uDD17 Watch Integration”),
React.createElement(ZeppSyncPanel, { data: data, setData: setData, toast: toast }),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 4 } }, “\uD83D\uDD17 Other Integrations”),
React.createElement(“div”, { style: { fontSize: 12, color: “var(–text-muted)”, marginBottom: 14 } }, “Connect more data sources”),
otherIntegrations.map(item => (React.createElement(“div”, { key: item.name, style: { padding: “13px 0”, borderBottom: “1px solid var(–border)” } },
React.createElement(“div”, { className: “flex fac fjb”, style: { marginBottom: 6 } },
React.createElement(“div”, { className: “flex fac gap2” },
React.createElement(“span”, { style: { fontSize: 18 } }, item.emoji),
React.createElement(“span”, { style: { fontWeight: 600, fontSize: 13 } }, item.name)),
React.createElement(“span”, { className: “b bi”, style: { fontSize: 9.5 } }, item.status)),
React.createElement(“div”, { style: { fontSize: 11.5, color: “var(–text-muted)”, lineHeight: 1.5 } }, item.howto))))),
React.createElement(“div”, { className: “card” },
React.createElement(“div”, { style: { fontWeight: 700, fontSize: 13.5, marginBottom: 4 } }, “\u2328\uFE0F Keyboard Shortcuts”),
React.createElement(“div”, { style: { display: “flex”, flexDirection: “column”, gap: 7, marginTop: 10 } }, [[”/ “, “Open search”], [“D”, “Dashboard”], [“H”, “Habits”], [“N”, “Nutrition”], [“F”, “Fitness”], [“B”, “Budget”], [“G”, “Goals”], [“A”, “AI Coach”], [“P”, “Progress”], [“S”, “Settings”]].map(([k, v]) => (React.createElement(“div”, { key: k, className: “flex fac fjb”, style: { fontSize: 12.5 } },
React.createElement(“span”, { style: { color: “var(–text-muted)” } }, v),
React.createElement(“kbd”, { style: { background: “var(–surface2)”, border: “1px solid var(–border)”, borderRadius: 6, padding: “2px 8px”, fontSize: 11, fontFamily: “monospace” } }, k)))))))));
}
function GlobalSearch({ data, onNavigate, onClose }) {
const [q, setQ] = useState(””);
const inputRef = useRef(null);
useEffect(() => { var _a; (_a = inputRef.current) === null || _a === void 0 ? void 0 : _a.focus(); }, []);
const results = useMemo(() => {
if (!q.trim())
return [];
const ql = q.toLowerCase(), r = [];
data.habits.forEach(h => { if (h.name.toLowerCase().includes(ql))
r.push({ type: “Habit”, emoji: h.icon, title: h.name, sub: `🔥 ${h.streak}d streak`, page: “habits” }); });
data.fitness.workouts.forEach(w => { if (w.name.toLowerCase().includes(ql))
r.push({ type: “Workout”, emoji: w.emoji, title: w.name, sub: `${w.date} · ${w.duration}min`, page: “fitness” }); });
data.nutrition.logs.forEach(l => { if (l.name.toLowerCase().includes(ql))
r.push({ type: “Food”, emoji: l.emoji, title: l.name, sub: `${l.cal} kcal`, page: “nutrition” }); });
data.budget.transactions.forEach(t => { if (t.name.toLowerCase().includes(ql))
r.push({ type: “Transaction”, emoji: t.emoji, title: t.name, sub: `${t.date} · ${t.amount > 0 ? "+" : "-"}$${Math.abs(t.amount).toFixed(2)}`, page: “budget” }); });
data.goals.forEach(g => { if (g.name.toLowerCase().includes(ql))
r.push({ type: “Goal”, emoji: g.emoji, title: g.name, sub: `${Math.min(100, Math.round((g.current / g.target) * 100))}%`, page: “goals” }); });
data.journal.entries.forEach(e => { var _a; if ((_a = e.text) === null || _a === void 0 ? void 0 : _a.toLowerCase().includes(ql))
r.push({ type: “Journal”, emoji: e.mood, title: e.date + “ entry”, sub: (e.text || “”).slice(0, 50) + “…”, page: “journal” }); });
return r.slice(0, 12);
}, [q, data]);
return (React.createElement(“div”, { className: “search-bar” },
React.createElement(Ic, { n: “search”, size: 18, color: “var(–text-muted)” }),
React.createElement(“input”, { ref: inputRef, style: { flex: 1, background: “transparent”, border: “none”, outline: “none”, color: “var(–text)”, fontFamily: “‘Sora’,sans-serif”, fontSize: 15 }, placeholder: “Search habits, workouts, food, transactions, goals\u2026”, value: q, onChange: e => setQ(e.target.value), onKeyDown: e => e.key === “Escape” && onClose() }),
React.createElement(“button”, { className: “btn btn-g btn-sm”, onClick: onClose }, “ESC”),
results.length > 0 && (React.createElement(“div”, { style: { position: “absolute”, top: “100%”, left: 0, right: 0, background: “var(–surface)”, border: “1px solid var(–border-bright)”, borderTop: “none”, borderRadius: “0 0 16px 16px”, boxShadow: “0 8px 30px rgba(0,0,0,0.4)”, overflow: “hidden”, zIndex: 9999 } }, results.map((r, i) => (React.createElement(“div”, { key: i, style: { display: “flex”, gap: 12, padding: “12px 20px”, cursor: “pointer”, borderBottom: “1px solid var(–border)” }, onClick: () => { onNavigate(r.page); onClose(); }, onMouseEnter: e => e.currentTarget.style.background = “var(–surface2)”, onMouseLeave: e => e.currentTarget.style.background = “” },
React.createElement(“span”, { style: { fontSize: 19, flexShrink: 0 } }, r.emoji),
React.createElement(“div”, { style: { flex: 1 } },
React.createElement(“div”, { style: { fontWeight: 600, fontSize: 13 } }, r.title),
React.createElement(“div”, { style: { fontSize: 11, color: “var(–text-muted)” } },
r.type,
“ \u00B7 “,
r.sub)))))))));
}
const NAV = [
{ id: “dashboard”, label: “Dashboard”, icon: “dashboard” }, { id: “habits”, label: “Habits”, icon: “habits” },
{ id: “nutrition”, label: “Nutrition”, icon: “nutrition” }, { id: “fitness”, label: “Fitness”, icon: “fitness” },
{ id: “skincare”, label: “Skincare”, icon: “skin” }, { id: “sleep”, label: “Sleep”, icon: “sleep” },
{ id: “body”, label: “Body”, icon: “body” }, { id: “cycle”, label: “Cycle”, icon: “cycle” },
{ id: “journal”, label: “Journal”, icon: “journal” }, { id: “budget”, label: “Finance”, icon: “budget” },
{ id: “goals”, label: “Goals”, icon: “goals” }, { id: “progress”, label: “Progress”, icon: “progress” },
{ id: “checkin”, label: “Check-In”, icon: “clipboard” }, { id: “ai”, label: “AI Coach”, icon: “ai” },
{ id: “settings”, label: “Settings”, icon: “settings” },
];
const MOBILE_NAV = [“dashboard”, “habits”, “nutrition”, “ai”, “progress”];
// ══ SUPABASE ═════════════════════════════════════════════════════════════════
const SB_URL = “https://zjaevznmthrpvhbpdjuj.supabase.co”;
const SB_KEY = “sb_publishable_5NwcvTweidtsFG4yhUj8Lw_exLp5Rbm”;
const SB_HDR = { “Content-Type”: “application/json”, “apikey”: SB_KEY, “Authorization”: `Bearer ${SB_KEY}` };
const SB_UID = “lifesync-user-1”;
async function sbLoad() {
var _a;
try {
const r = await fetch(`${SB_URL}/rest/v1/lifesync?user_id=eq.${SB_UID}&select=data`, { headers: SB_HDR });
if (!r.ok)
return null;
const rows = await r.json();
return ((_a = rows === null || rows === void 0 ? void 0 : rows[0]) === null || _a === void 0 ? void 0 : _a.data) || null;
}
catch (_b) {
return null;
}
}
async function sbSave(d) {
try {
await fetch(`${SB_URL}/rest/v1/lifesync`, {
method: “POST”,
headers: Object.assign(Object.assign({}, SB_HDR), { “Prefer”: “resolution=merge-duplicates” }),
body: JSON.stringify({ user_id: SB_UID, data: d, updated_at: new Date().toISOString() }),
});
}
catch (_a) { }
}
function App() {
const [data, setData] = useState(() => {
try {
const s = localStorage.getItem(“lifesync-v6”);
return s ? JSON.parse(s) : makeData();
}
catch (_a) {
return makeData();
}
});
const [dbReady, setDbReady] = useState(false);
const [saveStatus, setSaveStatus] = useState(“saved”); // “saved” | “saving” | “error”
const saveTimer = useRef(null);
// On first load — pull from Supabase, merge with localStorage
useEffect(() => {
sbLoad().then(remote => {
if (remote) {
setData(local => {
var _a, _b;
const remoteTs = new Date(((_a = remote === null || remote === void 0 ? void 0 : remote.user) === null || _a === void 0 ? void 0 : _a.lastSaved) || 0).getTime();
const localTs = new Date(((_b = local === null || local === void 0 ? void 0 : local.user) === null || _b === void 0 ? void 0 : _b.lastSaved) || 0).getTime();
return remoteTs > localTs ? remote : local;
});
}
setDbReady(true);
});
}, []);
// Save to localStorage instantly + Supabase debounced every 3s
useEffect(() => {
try {
localStorage.setItem(“lifesync-v6”, JSON.stringify(data));
}
catch (_a) { }
setSaveStatus(“saving”);
clearTimeout(saveTimer.current);
saveTimer.current = setTimeout(async () => {
try {
await sbSave(data);
setSaveStatus(“saved”);
}
catch (_a) {
setSaveStatus(“error”);
}
}, 3000);
}, [data]);
const [page, setPage] = useState(“dashboard”);
const [expanded, setExpanded] = useState(false);
const [searchOpen, setSearchOpen] = useState(false);
const { toasts, toast } = useToast();
// Background Zepp sync
useZeppSync(setData, toast);
// PWA: service worker, install prompt, notifications
const { installed, installPrompt, notifStatus, requestNotifs, install } = usePWA(data, toast);
useEffect(() => {
const h = e => {
var _a, _b;
if (e.key === “/” && ![“INPUT”, “TEXTAREA”].includes((_a = document.activeElement) === null || _a === void 0 ? void 0 : _a.tagName)) {
e.preventDefault();
setSearchOpen(true);
return;
}
if (e.key === “Escape”) {
setSearchOpen(false);
return;
}
if (e.ctrlKey || e.metaKey)
return;
const sc = { d: “dashboard”, h: “habits”, n: “nutrition”, f: “fitness”, b: “budget”, g: “goals”, a: “ai”, p: “progress”, s: “settings” };
if (sc[e.key] && ![“INPUT”, “TEXTAREA”].includes((_b = document.activeElement) === null || _b === void 0 ? void 0 : _b.tagName))
setPage(sc[e.key]);
};
window.addEventListener(“keydown”, h);
return () => window.removeEventListener(“keydown”, h);
}, []);
const setDataStamped = useCallback(updater => {
setData(prev => {
const next = typeof updater === “function” ? updater(prev) : updater;
return Object.assign(Object.assign({}, next), { user: Object.assign(Object.assign({}, next.user), { lastSaved: new Date().toISOString() }) });
});
}, []);
const props = { data, setData: setDataStamped, toast, setPage };
const pages = {
dashboard: React.createElement(DashPage, Object.assign({}, props)), habits: React.createElement(HabitsPage, Object.assign({}, props)), nutrition: React.createElement(NutritionPage, Object.assign({}, props)),
fitness: React.createElement(FitnessPage, Object.assign({}, props)), skincare: React.createElement(SkincarePage, Object.assign({}, props)), sleep: React.createElement(SleepPage, Object.assign({}, props)),
body: React.createElement(BodyPage, Object.assign({}, props)), cycle: React.createElement(CyclePage, Object.assign({}, props)), journal: React.createElement(JournalPage, Object.assign({}, props)),
budget: React.createElement(BudgetPage, Object.assign({}, props)), goals: React.createElement(GoalsPage, Object.assign({}, props)), progress: React.createElement(ProgressPage, { data: data }),
checkin: React.createElement(CheckInPage, Object.assign({}, props)), ai: React.createElement(AICoachPage, Object.assign({}, props)), settings: React.createElement(SettingsPage, Object.assign({}, props, { installed: installed, installPrompt: installPrompt, install: install, notifStatus: notifStatus, requestNotifs: requestNotifs })),
};
return (React.createElement(React.Fragment, null,
React.createElement(“style”, null, CSS),
React.createElement(“div”, { className: “orb orb1” }),
React.createElement(“div”, { className: “orb orb2” }),
React.createElement(“div”, { className: “orb orb3” }),
installPrompt && !installed && (React.createElement(“div”, { style: { position: “fixed”, top: 0, left: 0, right: 0, zIndex: 3000,
background: “linear-gradient(135deg,rgba(199,125,255,0.95),rgba(255,107,157,0.95))”,
backdropFilter: “blur(12px)”, padding: “11px 20px”,
display: “flex”, alignItems: “center”, gap: 12, flexWrap: “wrap” } },
React.createElement(“span”, { style: { fontSize: 18 } }, “\uD83C\uDF38”),
React.createElement(“span”, { style: { flex: 1, fontSize: 13, fontWeight: 600, color: “#fff” } }, “Add LifeSync to your home screen for the full app experience”),
React.createElement(“button”, { onClick: install, style: { background: “#fff”, color: “var(–violet)”, border: “none”, borderRadius: 9, padding: “7px 16px”, fontFamily: “‘Sora’,sans-serif”, fontWeight: 700, fontSize: 12.5, cursor: “pointer” } }, “Install”),
React.createElement(“button”, { onClick: () => setInstallPrompt(null), style: { background: “transparent”, border: “none”, color: “rgba(255,255,255,0.7)”, fontSize: 18, cursor: “pointer”, padding: “0 4px” } }, “\u00D7”))),
searchOpen && React.createElement(GlobalSearch, { data: data, onNavigate: setPage, onClose: () => setSearchOpen(false) }),
React.createElement(“div”, { className: “app” },
React.createElement(“aside”, { className: `sidebar ${expanded ? "ex" : ""}`, onMouseEnter: () => setExpanded(true), onMouseLeave: () => setExpanded(false) },
React.createElement(“div”, { style: { display: “flex”, alignItems: “center”, gap: 9, marginBottom: 10 } },
React.createElement(“div”, { className: “s-logo”, onClick: () => setPage(“dashboard”) }, “\uD83C\uDF38”),
expanded && React.createElement(“span”, { className: “s-logo-text” }, “LifeSync”),
expanded && React.createElement(“span”, { style: { marginLeft: “auto”, fontSize: 10, fontWeight: 700, color: saveStatus === “saved” ? “var(–mint)” : saveStatus === “saving” ? “var(–gold)” : “var(–rose)” }, title: saveStatus === “saved” ? “Saved to cloud” : saveStatus === “saving” ? “Saving…” : “Save error” }, saveStatus === “saved” ? “●” : “○”)),
React.createElement(“div”, { className: “ni”, onClick: () => setSearchOpen(true), title: “Search (/)” },
React.createElement(Ic, { n: “search”, size: 17 }),
React.createElement(“span”, { className: “nl” }, “Search”),
expanded && React.createElement(“kbd”, { style: { marginLeft: “auto”, fontSize: 10, color: “var(–text-dim)”, fontFamily: “monospace”, background: “var(–surface2)”, padding: “1px 5px”, borderRadius: 4 } }, “/”)),
React.createElement(“div”, { className: “sdiv” }),
NAV.slice(0, 3).map(item => React.createElement(“div”, { key: item.id, className: `ni ${page === item.id ? "active" : ""}`, onClick: () => setPage(item.id), title: item.label },
React.createElement(Ic, { n: item.icon, size: 17 }),
React.createElement(“span”, { className: “nl” }, item.label))),
React.createElement(“div”, { className: “sdiv” }),
NAV.slice(3, 9).filter(item => { var _a; return !(item.id === “cycle” && ((_a = data.settings) === null || _a === void 0 ? void 0 : _a.gender) === “male”); }).map(item => React.createElement(“div”, { key: item.id, className: `ni ${page === item.id ? "active" : ""}`, onClick: () => setPage(item.id), title: item.label },
React.createElement(Ic, { n: item.icon, size: 17 }),
React.createElement(“span”, { className: “nl” }, item.label))),
React.createElement(“div”, { className: “sdiv” }),
NAV.slice(9).map(item => (React.createElement(“div”, { key: item.id, className: `ni ${page === item.id ? "active" : ""}`, onClick: () => setPage(item.id), title: item.label },
React.createElement(Ic, { n: item.icon, size: 17 }),
React.createElement(“span”, { className: “nl” }, item.label),
item.id === “ai” && React.createElement(“span”, { className: “nbadge” }, “AI”)))),
React.createElement(“div”, { style: { marginTop: “auto” } },
React.createElement(“div”, { className: “sdiv” }),
React.createElement(“div”, { className: “ni”, style: { cursor: “default” } },
React.createElement(“div”, { style: { width: 24, height: 24, borderRadius: “50%”, background: “var(–grad-rose)”, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 12, flexShrink: 0 } }, data.user.avatar),
React.createElement(“span”, { className: “nl”, style: { fontSize: 12, color: “var(–text-muted)” } }, data.user.name)))),
React.createElement(“main”, { className: “main”, key: page }, pages[page] || pages.dashboard),
React.createElement(“nav”, { className: “mob-nav” },
MOBILE_NAV.map(id => {
const item = NAV.find(n => n.id === id);
return (React.createElement(“div”, { key: id, className: `mob-ni ${page === id ? "active" : ""}`, onClick: () => setPage(id) },
React.createElement(Ic, { n: item.icon, size: 22, color: page === id ? “var(–violet)” : “var(–text-muted)” }),
React.createElement(“span”, null, item.label)));
}),
React.createElement(“div”, { className: “mob-ni”, onClick: () => setSearchOpen(true) },
React.createElement(Ic, { n: “search”, size: 22, color: “var(–text-muted)” }),
React.createElement(“span”, null, “Search”)))),
React.createElement(Toasts, { toasts: toasts })));
}

```
var root = window.createRoot(document.getElementById('root'));
root.render(React.createElement(App));
var loader = document.getElementById('loading');
if (loader) {
  loader.classList.add('hide');
  setTimeout(function(){ loader.remove(); }, 500);
}
```

} catch(e) {
var el = document.getElementById(‘err’);
if (el) {
el.style.display = ‘block’;
el.textContent = ’⚠ Boot error: ’ + e.message + ‘\n\n’ + (e.stack || ‘’);
}
console.error(e);
}
}

if (window.React) {
bootApp();
} else {
window.addEventListener(‘react-ready’, bootApp);
setTimeout(function() {
if (!window.React) {
var el = document.getElementById(‘err’);
if (el) {
el.style.display = ‘block’;
el.textContent = ‘⚠ React did not load within 10s. Check network and reload.’;
}
}
}, 10000);
}