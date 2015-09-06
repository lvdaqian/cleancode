fl.openDocument("file:///ws-2015-client[1](2)_rebuild.fla");
var doc=fl.getDocumentDOM();
var lib=doc.library;
var si,ms;
ms="";

function ShouldStop() {if (ms=="") return("1"); else {
fl.trace(""); fl.trace("Message from ASV: Flash was not able to import following file(s):"); fl.trace(""); fl.trace(ms); fl.trace("Rebuild cannot continue until this is fixed.");
return("0");} }

fl.getDocumentDOM().importFile("file:///symbol_2.swf",true);
si=lib.findItemIndex("symbol_2.swf");
if (si=='') {si=lib.findItemIndex("symbol_2");}
if (si=='') {ms=ms+"symbol_2.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_5.swf",true);
si=lib.findItemIndex("symbol_5.swf");
if (si=='') {si=lib.findItemIndex("symbol_5");}
if (si=='') {ms=ms+"symbol_5.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_9.swf",true);
si=lib.findItemIndex("symbol_9.swf");
if (si=='') {si=lib.findItemIndex("symbol_9");}
if (si=='') {ms=ms+"symbol_9.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_14.swf",true);
si=lib.findItemIndex("symbol_14.swf");
if (si=='') {si=lib.findItemIndex("symbol_14");}
if (si=='') {ms=ms+"symbol_14.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_15.swf",true);
si=lib.findItemIndex("symbol_15.swf");
if (si=='') {si=lib.findItemIndex("symbol_15");}
if (si=='') {ms=ms+"symbol_15.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_18.swf",true);
si=lib.findItemIndex("symbol_18.swf");
if (si=='') {si=lib.findItemIndex("symbol_18");}
if (si=='') {ms=ms+"symbol_18.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_20.swf",true);
si=lib.findItemIndex("symbol_20.swf");
if (si=='') {si=lib.findItemIndex("symbol_20");}
if (si=='') {ms=ms+"symbol_20.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_22.swf",true);
si=lib.findItemIndex("symbol_22.swf");
if (si=='') {si=lib.findItemIndex("symbol_22");}
if (si=='') {ms=ms+"symbol_22.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_24.swf",true);
si=lib.findItemIndex("symbol_24.swf");
if (si=='') {si=lib.findItemIndex("symbol_24");}
if (si=='') {ms=ms+"symbol_24.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_26.swf",true);
si=lib.findItemIndex("symbol_26.swf");
if (si=='') {si=lib.findItemIndex("symbol_26");}
if (si=='') {ms=ms+"symbol_26.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_27.swf",true);
si=lib.findItemIndex("symbol_27.swf");
if (si=='') {si=lib.findItemIndex("symbol_27");}
if (si=='') {ms=ms+"symbol_27.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_30.swf",true);
si=lib.findItemIndex("symbol_30.swf");
if (si=='') {si=lib.findItemIndex("symbol_30");}
if (si=='') {ms=ms+"symbol_30.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_32.swf",true);
si=lib.findItemIndex("symbol_32.swf");
if (si=='') {si=lib.findItemIndex("symbol_32");}
if (si=='') {ms=ms+"symbol_32.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_34.swf",true);
si=lib.findItemIndex("symbol_34.swf");
if (si=='') {si=lib.findItemIndex("symbol_34");}
if (si=='') {ms=ms+"symbol_34.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_36.swf",true);
si=lib.findItemIndex("symbol_36.swf");
if (si=='') {si=lib.findItemIndex("symbol_36");}
if (si=='') {ms=ms+"symbol_36.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_38.swf",true);
si=lib.findItemIndex("symbol_38.swf");
if (si=='') {si=lib.findItemIndex("symbol_38");}
if (si=='') {ms=ms+"symbol_38.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_40.swf",true);
si=lib.findItemIndex("symbol_40.swf");
if (si=='') {si=lib.findItemIndex("symbol_40");}
if (si=='') {ms=ms+"symbol_40.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_42.swf",true);
si=lib.findItemIndex("symbol_42.swf");
if (si=='') {si=lib.findItemIndex("symbol_42");}
if (si=='') {ms=ms+"symbol_42.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_45.swf",true);
si=lib.findItemIndex("symbol_45.swf");
if (si=='') {si=lib.findItemIndex("symbol_45");}
if (si=='') {ms=ms+"symbol_45.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_48.swf",true);
si=lib.findItemIndex("symbol_48.swf");
if (si=='') {si=lib.findItemIndex("symbol_48");}
if (si=='') {ms=ms+"symbol_48.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_52.swf",true);
si=lib.findItemIndex("symbol_52.swf");
if (si=='') {si=lib.findItemIndex("symbol_52");}
if (si=='') {ms=ms+"symbol_52.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_54.swf",true);
si=lib.findItemIndex("symbol_54.swf");
if (si=='') {si=lib.findItemIndex("symbol_54");}
if (si=='') {ms=ms+"symbol_54.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_56.swf",true);
si=lib.findItemIndex("symbol_56.swf");
if (si=='') {si=lib.findItemIndex("symbol_56");}
if (si=='') {ms=ms+"symbol_56.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_58.swf",true);
si=lib.findItemIndex("symbol_58.swf");
if (si=='') {si=lib.findItemIndex("symbol_58");}
if (si=='') {ms=ms+"symbol_58.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_60.swf",true);
si=lib.findItemIndex("symbol_60.swf");
if (si=='') {si=lib.findItemIndex("symbol_60");}
if (si=='') {ms=ms+"symbol_60.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_62.swf",true);
si=lib.findItemIndex("symbol_62.swf");
if (si=='') {si=lib.findItemIndex("symbol_62");}
if (si=='') {ms=ms+"symbol_62.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_64.swf",true);
si=lib.findItemIndex("symbol_64.swf");
if (si=='') {si=lib.findItemIndex("symbol_64");}
if (si=='') {ms=ms+"symbol_64.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_66.swf",true);
si=lib.findItemIndex("symbol_66.swf");
if (si=='') {si=lib.findItemIndex("symbol_66");}
if (si=='') {ms=ms+"symbol_66.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_68.swf",true);
si=lib.findItemIndex("symbol_68.swf");
if (si=='') {si=lib.findItemIndex("symbol_68");}
if (si=='') {ms=ms+"symbol_68.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_72.swf",true);
si=lib.findItemIndex("symbol_72.swf");
if (si=='') {si=lib.findItemIndex("symbol_72");}
if (si=='') {ms=ms+"symbol_72.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_75.swf",true);
si=lib.findItemIndex("symbol_75.swf");
if (si=='') {si=lib.findItemIndex("symbol_75");}
if (si=='') {ms=ms+"symbol_75.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_78.swf",true);
si=lib.findItemIndex("symbol_78.swf");
if (si=='') {si=lib.findItemIndex("symbol_78");}
if (si=='') {ms=ms+"symbol_78.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_82.swf",true);
si=lib.findItemIndex("symbol_82.swf");
if (si=='') {si=lib.findItemIndex("symbol_82");}
if (si=='') {ms=ms+"symbol_82.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_84.swf",true);
si=lib.findItemIndex("symbol_84.swf");
if (si=='') {si=lib.findItemIndex("symbol_84");}
if (si=='') {ms=ms+"symbol_84.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_85.swf",true);
si=lib.findItemIndex("symbol_85.swf");
if (si=='') {si=lib.findItemIndex("symbol_85");}
if (si=='') {ms=ms+"symbol_85.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_90.swf",true);
si=lib.findItemIndex("symbol_90.swf");
if (si=='') {si=lib.findItemIndex("symbol_90");}
if (si=='') {ms=ms+"symbol_90.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_91.swf",true);
si=lib.findItemIndex("symbol_91.swf");
if (si=='') {si=lib.findItemIndex("symbol_91");}
if (si=='') {ms=ms+"symbol_91.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_93.swf",true);
si=lib.findItemIndex("symbol_93.swf");
if (si=='') {si=lib.findItemIndex("symbol_93");}
if (si=='') {ms=ms+"symbol_93.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_95.swf",true);
si=lib.findItemIndex("symbol_95.swf");
if (si=='') {si=lib.findItemIndex("symbol_95");}
if (si=='') {ms=ms+"symbol_95.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_97.swf",true);
si=lib.findItemIndex("symbol_97.swf");
if (si=='') {si=lib.findItemIndex("symbol_97");}
if (si=='') {ms=ms+"symbol_97.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_104.swf",true);
si=lib.findItemIndex("symbol_104.swf");
if (si=='') {si=lib.findItemIndex("symbol_104");}
if (si=='') {ms=ms+"symbol_104.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_106.swf",true);
si=lib.findItemIndex("symbol_106.swf");
if (si=='') {si=lib.findItemIndex("symbol_106");}
if (si=='') {ms=ms+"symbol_106.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_111.swf",true);
si=lib.findItemIndex("symbol_111.swf");
if (si=='') {si=lib.findItemIndex("symbol_111");}
if (si=='') {ms=ms+"symbol_111.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_116.swf",true);
si=lib.findItemIndex("symbol_116.swf");
if (si=='') {si=lib.findItemIndex("symbol_116");}
if (si=='') {ms=ms+"symbol_116.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_117.swf",true);
si=lib.findItemIndex("symbol_117.swf");
if (si=='') {si=lib.findItemIndex("symbol_117");}
if (si=='') {ms=ms+"symbol_117.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_118.swf",true);
si=lib.findItemIndex("symbol_118.swf");
if (si=='') {si=lib.findItemIndex("symbol_118");}
if (si=='') {ms=ms+"symbol_118.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_122.swf",true);
si=lib.findItemIndex("symbol_122.swf");
if (si=='') {si=lib.findItemIndex("symbol_122");}
if (si=='') {ms=ms+"symbol_122.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_126.swf",true);
si=lib.findItemIndex("symbol_126.swf");
if (si=='') {si=lib.findItemIndex("symbol_126");}
if (si=='') {ms=ms+"symbol_126.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_127.swf",true);
si=lib.findItemIndex("symbol_127.swf");
if (si=='') {si=lib.findItemIndex("symbol_127");}
if (si=='') {ms=ms+"symbol_127.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_135.swf",true);
si=lib.findItemIndex("symbol_135.swf");
if (si=='') {si=lib.findItemIndex("symbol_135");}
if (si=='') {ms=ms+"symbol_135.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_143.swf",true);
si=lib.findItemIndex("symbol_143.swf");
if (si=='') {si=lib.findItemIndex("symbol_143");}
if (si=='') {ms=ms+"symbol_143.swf\n";}
fl.getDocumentDOM().importFile("file:///symbol_155.swf",true);
si=lib.findItemIndex("symbol_155.swf");
if (si=='') {si=lib.findItemIndex("symbol_155");}
if (si=='') {ms=ms+"symbol_155.swf\n";}
