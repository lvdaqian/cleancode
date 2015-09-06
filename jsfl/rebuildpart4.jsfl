var doc=fl.getDocumentDOM();
var tl=doc.getTimeline();
var lib=doc.library;
var newSel=new Array();
var si,li,ci,pi,tx,r0,nr,cx,cy;

doc.docClass="Main"
//create main timeline
tl=doc.getTimeline();
tl.setSelectedFrames([0,0,0],true);
tl.addNewLayer();
tl.layers[0].name="labels";
tl.setSelectedFrames([0,0,0],true);
tl.layers[0].frames[0].name="Main";
tl.layers[0].frames[0].labelType="name";
doc.selectNone();
