﻿var doc=fl.getDocumentDOM();
var tl=doc.getTimeline();
var lib=doc.library;
var newSel=new Array();
var si,li,ci,pi,tx,r0,nr,cx,cy;

doc.docClass="Main"
//linkage
li=lib.items[lib.findItemIndex("Symbol_3")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="wicresoft.errorInfo";
li=lib.items[lib.findItemIndex("Symbol_13")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.Kictout";
li=lib.items[lib.findItemIndex("Symbol_17")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="fl.core.ComponentShim";
li=lib.items[lib.findItemIndex("Symbol_19")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="TextArea_disabledSkin";
li=lib.items[lib.findItemIndex("Symbol_21")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="TextArea_upSkin";
li=lib.items[lib.findItemIndex("Symbol_23")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="focusRectSkin";
li=lib.items[lib.findItemIndex("Symbol_25")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollTrack_skin";
li=lib.items[lib.findItemIndex("Symbol_29")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowUp_downSkin";
li=lib.items[lib.findItemIndex("Symbol_31")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowDown_downSkin";
li=lib.items[lib.findItemIndex("Symbol_33")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollThumb_downSkin";
li=lib.items[lib.findItemIndex("Symbol_35")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowDown_overSkin";
li=lib.items[lib.findItemIndex("Symbol_37")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollThumb_overSkin";
li=lib.items[lib.findItemIndex("Symbol_39")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowUp_overSkin";
li=lib.items[lib.findItemIndex("Symbol_41")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowUp_upSkin";
li=lib.items[lib.findItemIndex("Symbol_43")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollThumb_upSkin";
li=lib.items[lib.findItemIndex("Symbol_44")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowDown_upSkin";
li=lib.items[lib.findItemIndex("Symbol_46")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowDown_disabledSkin";
li=lib.items[lib.findItemIndex("Symbol_47")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollArrowUp_disabledSkin";
li=lib.items[lib.findItemIndex("Symbol_49")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ScrollBar_thumbIcon";
li=lib.items[lib.findItemIndex("Symbol_50")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="fl.controls.UIScrollBar";
li=lib.items[lib.findItemIndex("Symbol_51")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="fl.controls.TextArea";
li=lib.items[lib.findItemIndex("Symbol_53")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_disabledSkin";
li=lib.items[lib.findItemIndex("Symbol_55")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_downSkin";
li=lib.items[lib.findItemIndex("Symbol_57")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_emphasizedSkin";
li=lib.items[lib.findItemIndex("Symbol_59")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_overSkin";
li=lib.items[lib.findItemIndex("Symbol_61")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_selectedDisabledSkin";
li=lib.items[lib.findItemIndex("Symbol_63")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_selectedDownSkin";
li=lib.items[lib.findItemIndex("Symbol_65")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_selectedOverSkin";
li=lib.items[lib.findItemIndex("Symbol_67")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_selectedUpSkin";
li=lib.items[lib.findItemIndex("Symbol_69")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="Button_upSkin";
li=lib.items[lib.findItemIndex("Symbol_70")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="fl.controls.Button";
li=lib.items[lib.findItemIndex("Symbol_74")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.LogWin";
li=lib.items[lib.findItemIndex("Symbol_81")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.WarnInfo";
li=lib.items[lib.findItemIndex("Symbol_86")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.Loader";
li=lib.items[lib.findItemIndex("Symbol_89")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.PriceResult2";
li=lib.items[lib.findItemIndex("Symbol_103")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.Bidinfo";
li=lib.items[lib.findItemIndex("Symbol_115")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.PriceInfoWindow";
li=lib.items[lib.findItemIndex("Symbol_120")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="wicresoft.background";
li=lib.items[lib.findItemIndex("Symbol_123")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.peoplePriceInfoButton";
li=lib.items[lib.findItemIndex("Symbol_130")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="wicresot.Subtract300";
li=lib.items[lib.findItemIndex("Symbol_147")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.Price";
li=lib.items[lib.findItemIndex("Symbol_152")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.Price2";
li=lib.items[lib.findItemIndex("Symbol_154")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.BidStage";
li=lib.items[lib.findItemIndex("Symbol_157")];
li.linkageExportForRS=true;
li.linkageExportInFirstFrame=true;
li.linkageIdentifier="ws.SelfTopPriceWindow";

