if (fl.runScript("file:///jsfl/import.jsfl","ShouldStop")!="0") {
fl.runScript("file:///jsfl/rebuildpart1.jsfl");
fl.runScript("file:///jsfl/rebuildpart2.jsfl");
fl.runScript("file:///jsfl/rebuildpart3.jsfl");
fl.runScript("file:///jsfl/rebuildpart4.jsfl");
fl.saveDocument(fl.getDocumentDOM(), "file:///ws-2015-client[1](2)_rebuild_done.fla");
}
