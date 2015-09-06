//fl.enableImmediateUpdates();
fl.outputPanel.clear();
fl.openDocument("file:///ws-2015-client[1](2)_rebuild.fla");
var doc=fl.getDocumentDOM();
var tl=doc.getTimeline();
var lib=doc.library;
var newSel=new Array();
var si,li,ci,pi,tx,r0,nr,cx,cy;

//movie properties
doc.width=900;
doc.height=450;
doc.frameRate=30;
doc.backgroundColor="#FFFFFF";

