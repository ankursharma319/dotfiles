const {
    Clipboard,
    Front,
    Hints,
    Normal,
    RUNTIME,
    Visual,
    aceVimMap,
    addSearchAlias,
    cmap,
    getBrowserName,
    getClickableElements,
    getFormData,
    imap,
    imapkey,
    iunmap,
    map,
    mapkey,
    readText,
    removeSearchAlias,
    tabOpenLink,
    unmap,
    unmapAllExcept,
    vmap,
    vmapkey,
    vunmap,
} = api;

// -----------------------------------------------------------------------------------------------------------------------
// -- [ SETTINGS ]
// -----------------------------------------------------------------------------------------------------------------------

settings.showModeStatus = true;
// settings.showProxyInStatusBar = false;

// Timeout(ms) to show rich hints for keystroke, 0 will disable rich hints
// settings.richHintsForKeystroke = 500;

// settings.useLocalMarkdownAPI = true;

// Whether to focus text input after quitting from vim editor
// settings.focusOnSaved = true;
// settings.omnibarMaxResults = 10;
// settings.omnibarHistoryCacheSize = 100;
// settings.omnibarPosition = "middle";

// show suggestion urls
// settings.omnibarSuggestion = false;
// settings.omnibarSuggestionTimeout = 200;

// Whether to focus first candidate of matched result in Omnibar
// settings.focusFirstCandidate = false;

// When total of opened tabs exceeds the number, Omnibar will be used for choosing tabs.
// settings.tabsThreshold = 9;

// extra css to pick elements for hints mode
// settings.clickableSelector = "";
// settings.smoothScroll = true;
// settings.scrollStepSize = 70;
// settings.scrollFriction = 0;

// Alignment of hints on their target elements. ["left", "center", "right"]
// settings.hintAlign = "center";
settings.hintAlign = "left";

// whether to wait for explicit input when there is a single hint
settings.hintExplicit = true;

// open in new tab if entered capital letter of hint
settings.hintShiftNonActive = true;

// settings.defaultSearchEngine = 'g';

// Which mode to fall back after yanking text in visual mode.
// Value could be one of ["", "Caret", "Normal"],
// default is "", which means no action after yank.
settings.modeAfterYank = "Normal";

// A regex to match the sites that will have Surfingkeys disabled.
// settings.blocklistPattern = undefined;
// settings.blocklistPattern = /mail.google.com/;

// Which tab will be focused after the current tab is closed.
// ["left", "right", "last"]
// settings.focusAfterClosed = "right";

// max of actions to be repeated
// settings.repeatThreshold = 99;

// Whether to list opened tabs, history in order of most
// recently used beneath Omnibar.
settings.tabsMRUOrder = false;
settings.historyMUOrder = false;

// Where to new tab. ["left", "right", "first", "last", "default"]
// settings.newTabPosition = "default";

// settings.enableEmojiInsertion = false;

// Whether to prevent focus on input on page loaded,
// set to true by default so that we could use Surfingkeys
// directly after page loaded, otherwise we
// need press Esc to quit input.
// settings.stealFocusOnLoad = true;

// Whether to enable auto focus after mouse click on some widget.
// This is different with stealFocusOnLoad, which is only for the
// time of page loaded. For example, there is a hidden input box
// on a page, it is turned to visible after user clicks on some
// other link. If you don't like the input to be focused when
// it's turned to visible, you could set this to false.
// settings.enableAutoFocus = true;

// Whether finding in page/Omnibar is case sensitive.
// settings.caseSensitive = false;
// settings.smartCase = true;

// Whether to put cursor at end of input when entering
// an input box, by false to put the cursor where it
// was when focus was removed from the input.
settings.cursorAtEndOfInput = true;

// Whether digits are reserved for repeats, by false to
// enable mapping of numeric keys.
// settings.digitForRepeat = true;

// similar to enableAutoFocus
// settings.editableBodyCare = true;

// skip when navigating by w (words) for e.g.
// settings.ignoredFrameHosts = ["https://tpc.googlesyndication.com"];

// settings.aceKeybindings	= "vim";
// settings.autoSpeakOnInlineQuery = false;
// settings.useNeovim = false;

// enable url reading in safari sk extension:
// document.getElementById("localPathForSettings").style.display = ""

// --- Hints ---
// Hints.setCharacters('asdfgyuiopqwertnmzxcvb');

// Hints.characters = "qwertasdfgzxcvb";
// Hints.characters = "asdfgyuiopqwertnmzxcvb";

// Link Hints
// Hints.style(`
//     font-family: 'JetBrains Mono';
//     font-size: 12px;
//     font-weight: normal;
//     text-transform: lowercase;
//     color: #E5E9F0 !important;
//     background: #3B4252 !important;
//     border: solid 1px #4C566A !important;
//   `);
//
// // Text Hints
// Hints.style(
//   `
//     font-family: 'JetBrains Mono';
//     font-size: 12px;
//     text-transform: lowercase;
//     color: #E5E9F0 !important;
//     background: #6272a4 !important;
//     border: solid 2px #4C566A !important;
//   `,
//   "text"
// );

// -----------------------------------------------------------------------------------------------------------------------
// -- [ KEY BINDINGS ]
// -----------------------------------------------------------------------------------------------------------------------

// ---- Unmap -----

// Proxy Stuff
unmap('spa');
unmap('spb');
unmap('spc');
unmap('spd');
unmap('sps');
unmap('cp');
unmap(';cp');
unmap(';ap');
unmap(';pa');
unmap(';pb');
unmap(';pc');
unmap(';pd');
unmap(';ps');

// click on an image or a button (similar to f)
unmap('q')

// open omnibar for word translation
unmap('Q')

// move current tab to another window
unmap('W');

// switch frames (maybe useful for iframes)
// unmap('w');

// scroll halfway up
unmap('e');

// move one tab to left
unmap('E');

// move one tab to right
unmap('R');

// reload current page
unmap('r');

// choose a tab
// unmap('T');

// open a url (omnibar)
unmap('t');

// capture current full page
unmap('yG');
// capture scrolling element
unmap('yS');
// copy all query history of omniquery
unmap('yQ');
// duplicate current tab (in background)
unmap('yT');
// copy all tabs urls
unmap('yY');

// copy a url link on the page
// unmap('ya');
// copy a column of table
unmap('yc');
// copy current downloading url
unmap('yd');
// copy form data (in json) on current page
unmap('yf');
// capture current page
unmap('yg');
// copy current page host
unmap('yh');
// copy text of an input
unmap('yi');
// copy current settings
unmap('yj');
// copy current page title
unmap('yl');
// copy form data for post on current page
unmap('yp');
// copy pre text
unmap('yq');
// copy current page source
unmap('ys');
// duplicate current tab
unmap('yt');
// copy text of an element
// unmap('yv');
// copy current page's url
// unmap('yy');

// copy mutiple of link urls, columns & elements
unmap('yma');
unmap('ymc');
unmap('ymv');

// scroll full page up
unmap('U')

// scroll half page up
unmap('u')

// go to edit box with vim editor
// unmap('I')

// go to edit box
// unmap('i')

// Open detected links from text
unmap('O');

// open search with aliases b, d, e, g, s, w, y
unmap('ob');
unmap('od');
unmap('oe');
unmap('og');
unmap('os');
unmap('ow');
unmap('oy');

// open url from history
unmap('oh');
// open incognito window
unmap('oi');
// open url from vim marks
unmap('om');
// open new tab
unmap('on');
// open recently closed url
unmap('ox');

// scroll full page down
unmap('P')

// enter ephemeral PassThrough mode to temporarily suppress SurfingKeys
unmap('p')

// click on the previous link on current page - didnt work for me
unmap('[[');
// click on the next link on current page - didnt work for me
unmap(']]');

// bookmark current page to selected folder (opens omnibar)
unmap('ab');
// open a link from current page in new active tab
unmap('af');

// go back in history
unmap('S')

// search selected (in new tab) with
// baidu, duckduckgo, wikipedia, google,
// github, stackoverflow, bing, youtube
unmap('sb');
unmap('sd');
unmap('se');
unmap('sg');
unmap('sh');
unmap('ss');
unmap('sw');
unmap('sy');

// go forward in history
unmap('D');

// scroll half page down
unmap('d');

// go forward in tab history (just switch tabs)
unmap('F');

// open a link
// unmap('f');

// scroll to bottom of page
// unmap('G');
// scroll to top of page
// unmap('gg');

// reload current page without hash fragment
unmap('g#');
// reload without question mark part
unmap('g?');
// go to first or last tab
unmap('g0');
unmap('g$');
// go to first activated tab
unmap('gT');
// go to root of current url hierarchy
unmap('gU');

// open chrome about, bookmarks, cache, downloads, extensions
unmap('ga');
unmap('gb');
unmap('gc');
unmap('gd');
unmap('ge');

// open chrome history, cookies, net-internals, page-source
unmap('gh');
unmap('gk');
unmap('gn');
unmap('gs');

// open a link in non active tab (i.e. in background)
unmap('gf');
// go to first edit box (insert mode)
unmap('gi');
// open a url in current tab (opens omnibar)
unmap('go');
// go to playing tab
unmap('gp');
// read selected text or text from clipboard (TTS)
unmap('gr');
// go to last activated tab
unmap('gt');
// go up one path in the url
unmap('gu');

// close all tabs on the left, right
unmap('gx0');
unmap('gx$');
// close tab on left
unmap('gxt');
// close tab on right
unmap('gxT');
// close playing tab
unmap('gxp');
// close all tabs except current one
unmap('gxx');

// Open opened URL in current tab in omnibar
unmap('H');

// scroll left, down, up, right
// unmap('h');
// unmap('j');
// unmap('k');
// unmap('l');

// edit current url with vim editor and reload
unmap(';U');

// remove bookmark for current page
unmap(';db');

// delete history older than 30 days
unmap(';dh');

// download image
unmap(';di');

// edit settings
unmap(';e');

// choose which scrollarea to focus on for scrolling
// unmap(';fs');

// gather filtered tabs into current window
unmap(';gt');

// gather all tabs into current window
unmap(';gw');

// open chrome inspect
unmap(';i');

// close downloads shelf
unmap(';j');

// mouse out last element
unmap(';m');

// fill form data from yf
unmap(';pf');

// put histories from clipboard
unmap(';ph');

// restore settings from clipboard
unmap(';pj');

// preview markdown
unmap(';pm');

// paste html on current page
unmap(';pp');

// show last action
unmap(';ql');

// toggle pdf viewer for active file (pdf.js to browser default)
unmap(';s');

// translate selected text with google
unmap(';t');

// edit current url with vim editor and open in new tab
unmap(';u');

// open neovim
unmap(';v');

// focus top window
unmap(';w');

// yank histories
unmap(';yh');

// move current tab to left or right
unmap('<<');
unmap('>>');

// save session and quit
unmap('ZZ');
// restore last session
unmap('ZR');

// zoom in, out, reset
unmap('zi');
unmap('zo');
unmap('zr');

// enter visual mode and select whole element
// unmap('zv');

// restore last closed tab
unmap('X');

// close current tab
unmap('x');

// Open a link in non-active new tab
unmap('C');

// reset scroll targtet
// unmap('cS');

// open selected text (or from clipboard) as url in new tab
unmap('cc');

// open multiple links in new tab
unmap('cf');

// query word (definition) with hints
unmap('cq');

// change scroll target (toggle through scroll targets)
// unmap('cs');

// open a bookmark
unmap('b');

// go back in tab history (just switch tabs)
unmap('B');

// restore visual mode
unmap('V');

// toggle visual mode
// unmap('v');

// add current url to vim like marks
unmap('m');

// previous found text
// unmap('N');

// next found text
// unmap('n');

// go to last used tab
unmap('<Ctrl-6>');

// find in current page
// unmap('/');

// scroll all the way to the left or right
// unmap('0');
// unmap('$');

// scroll to percentage of current page
unmap('%');

// repeat last action
// unmap('.');

// show help
// unmap('?');

// show commands
// unmap(':');

// jump to vim like mark
unmap("'");
unmap("<Ctrl-'>");

// Find selected text in current page
// unmap('*');

// toggle surfingkeys on current site
// unmap('<Alt-s>');

// enter PassThrough mode to temporarily suppress SurfingKeys
unmap('<Alt-i>');

//Mouse over elements.
unmap('<Ctrl-h>');
//Mouse out elements
unmap('<Ctrl-j>');


// go to edit box with vim editor
unmap('<Ctrl-i>');
// go to edit box with neovim editor
unmap('<Ctrl-Alt-i>');

// pin/unpin current tab
unmap('<Alt-p>');
// mute/unmute current tab
unmap('<Alt-m>');

// --- Omnibar specific --
// -- Unmapping these has no effect currently
// <Ctrl-d>Delete focused item from bookmark or history
// unmap('<Ctrl-d>');
// <Ctrl-i>Edit selected URL with vim editor, then open
// unmap('<Ctrl-i>');
// <Ctrl-j>Toggle Omnibar's position
// unmap('<Ctrl-j>');
// <Ctrl-.>Show results of next page
// unmap('<Ctrl-.>');
// <Ctrl-,>Show results of previous page
// unmap('<Ctrl-,>');
// <Ctrl-c>Copy selected item url or all listed item urls
// unmap('<Ctrl-c>');
// <Ctrl-D>Delete all listed items from bookmark or history
// unmap('<Ctrl-D>');
// <Ctrl-r>Re-sort history by visitCount or lastVisitTime
// unmap('<Ctrl-r>');
// close omnibar
// unmap('<Esc>');
// <Ctrl-m>Create vim-like mark for selected item
// unmap('<Ctrl-m>');
// <Tab>Forward cycle through the candidates.
// unmap('<Tab>');
// <Shift-Tab>Backward cycle through the candidates.
// unmap('<Shift-Tab>');
// <Ctrl-'>Toggle quotes in an input element
// unmap("<Ctrl-'>");
// <ArrowDown>Forward cycle through the candidates.
// unmap('<ArrowDown>');
// <ArrowUp>Backward cycle through the candidates.
// unmap('<ArrowUp>');
// <Ctrl-n>Forward cycle through the candidates.
// unmap('<Ctrl-n>');
// <Ctrl-p>Backward cycle through the candidates.
// unmap('<Ctrl-p>');

// --- Insert mode --

// Emoji
iunmap(":");

// <Ctrl-e>Move the cursor to the end of the line
iunmap('<Ctrl-e>');
// <Ctrl-f>Move the cursor to the beginning of the line
iunmap('<Ctrl-f>');
// <Ctrl-u>Delete all entered characters before the cursor
iunmap('<Ctrl-u>');
// <Alt-b>Move the cursor Backward 1 word
iunmap('<Alt-b>');
// <Alt-f>Move the cursor Forward 1 word
iunmap('<Alt-f>');
// <Alt-w>Delete a word backwards
iunmap('<Alt-w>');
// <Alt-d>Delete a word forwards
iunmap('<Alt-d>');
// <Esc>Exit insert mode
// iunmap('<Esc>');
// <Ctrl-'>Toggle quotes in an input element
iunmap("<Ctrl-'>");
// <Ctrl-i>Open vim editor for current input
iunmap('<Ctrl-i>');
// <Ctrl-Alt-i>Open neovim for current input
iunmap('<Ctrl-Alt-i>');

// --- Visual mode --

// Find selected text in current page
// vunmap('*');
// Toggle visual mode
// vunmap('v');
// Find in current page
// vunmap('/');

// Select a word(w) or line(l) or sentence(s) or paragraph(p)
// vunmap('V');

// previous found text
// vunmap('N');
// next found text
// vunmap('n');

// 0backward lineboundary
// vunmap('0');

// lforward character
// vunmap('l');
// hbackward character
// vunmap('h');
// jforward line
// vunmap('j');
// kbackward line
// vunmap('k');
// wforward word
// vunmap('w');
// eforward word
vunmap('e');
// bbackward word
// vunmap('b');
// (backward sentence
// vunmap('(');
// )forward sentence
// vunmap(')');
// {backward paragraphboundary
// vunmap('{');
// }forward paragraphboundary
// vunmap('}');
// $forward lineboundary
// vunmap('$');
// Gforward documentboundary
// vunmap('G');
// ggbackward documentboundary
// vunmap('gg');
// grRead selected text
vunmap('gr');
// oGo to Other end of highlighted text
// vunmap('o');
// *Search word under the cursor
// vunmap('*');
// <Enter>Click on node under cursor.
// vunmap('<Enter>');
// <Shift-Enter>Click on node under cursor.
vunmap('<Shift-Enter>');
// ztmake cursor at start of window.
// vunmap('zt');
// zzmake cursor at center of window.
// vunmap('zz');
// zbmake cursor at bottom of window.
// vunmap('zb');
// fForward to next char.
// vunmap('f');
// FBackward to next char.
// vunmap('F');
// ;Repeat latest f, F
vunmap(';');
// ,Repeat latest f, F in opposite direction
vunmap(',');
// pExpand selection to parent element
vunmap('p');
// <Ctrl-u>Backward 20 lines
// vunmap('<Ctrl-u>');
// <Ctrl-d>Forward 20 lines
// vunmap('<Ctrl-d>');
// tTranslate selected text with google
vunmap('t');
// qTranslate word under cursor
vunmap('q');

// ---- Search Engines -----
removeSearchAlias('b', 's');
removeSearchAlias('d', 's');
// removeSearchAlias('g', 's');
removeSearchAlias('h', 's');
removeSearchAlias('w', 's');
// removeSearchAlias('y', 's');
removeSearchAlias('s', 's');


// ---- Map -----
mapkey("<Ctrl-u>", "#2Scroll half page up", Normal.scroll.bind(Normal, "pageUp"), { repeatIgnore: true, });
mapkey("<Ctrl-d>", "#2Scroll half page down", Normal.scroll.bind(Normal, "pageDown"), { repeatIgnore: true, });
mapkey("<Space>r", '#4Reload the page', function() {
    RUNTIME("reloadTab", { nocache: false });
}, { repeatIgnore: true, });
mapkey("<Space>tp", '#3Go one tab left', function() {
    RUNTIME("previousTab");
}, { repeatIgnore: true, });
mapkey("<Space>tn", '#3Go one tab right', function() {
    RUNTIME("nextTab");
}, { repeatIgnore: true, });

// TODO make work and use instead of alias
// mapkey("<Space>tc", '#3Choose a tab', function() {
//    Front.chooseTab();
// });
map('<Space>tt', 'T');
map('<Space>cs', ';fs')

if (!getBrowserName().startsWith("Safari")) {
    mapkey('<Space>ff', '#8Open a URL', function() {
        Front.openOmnibar({type: "URLs"});
    });
    mapkey('<Space><Space>', '#8Open a URL in current tab', function() {
        Front.openOmnibar({type: "URLs", tabbed: false});
    });
    mapkey('<Space>fr', '#8Open recently closed URL', function() {
        Front.openOmnibar({type: "RecentlyClosed"});
    });
}
mapkey('<Space>cd', '#3Duplicate current tab in background', function() {
    RUNTIME("duplicateTab", {active: false});
});

mapkey("<Space>fg", '#8Open Search with alias g', () => {
    Front.openOmnibar({type: "SearchEngine", extra: 'g'});
});
mapkey("<Space>fy", '#8Open Search with alias y', () => {
    Front.openOmnibar({type: "SearchEngine", extra: 'y'});
});

// open a link from current page in new active tab
mapkey('F', '#1Open a link in non-active new tab', function() {
    Hints.create("", Hints.dispatchMouseClick, {tabbed: true, active: false});
});

mapkey('p', '#4Go back in history', function() {
    history.go(-1);
}, {repeatIgnore: true});
mapkey('n', '#4Go forward in history', function() {
    history.go(1);
}, {repeatIgnore: true});

mapkey('<Space>xx', '#3Close current tab', function() {
    RUNTIME("closeTab");
});
mapkey('<Space>xp', '#3Close tab on left', function() {
    RUNTIME("closeTabLeft");
});
mapkey('<Space>xn', '#3Close tab on right', function() {
    RUNTIME("closeTabRight");
});

map("<Space>e", "$");
map("<Space>s", "/");
map("<Space>n", "*");
vmap("<Space>e", "$");
vmap("<Space>s", "/");
vmap("<Space>n", "*");
map("<Space>jj", "<Esc>");
vmap("<Space>jj", "<Esc>");
imap("jj", "<Esc>");

