//Created by Action Script Viewer - http://www.buraks.com/asv
package task
{
    import zebra.thread.task.TaskAction;
    import model.LogApplication;
    import view.BidInfoPart;
    import view.BidStagePart;
    import view.BidStageView;
    import flash.utils.getTimer;
    import zebra.Game;
    import util.BidInfoParse;
    import zebra.content.GameAsset;
    import zebra.loaders.IAssetLoader;

    public class BidInfoWebDataAction extends TaskAction 
    {

        public static var Reader3to1Timer:int;
        public static var isGetWebData:Boolean = false;

        public var logappliction:LogApplication;

        public function BidInfoWebDataAction()
        {
            this.logappliction = new LogApplication();
            super();
        }

        override public function execute():void
        {
            var bidinfo:BidInfoPart;
            var bidstage:BidStagePart;
            var bidstageview:BidStageView;
            super.execute();
            isGetWebData = false;
            if ((getTimer() - Reader3to1Timer) > (10 * 1000))
            {
                bidinfo = BidInfoPart(Game.Content.getView(BidInfoPart));
                bidstage = BidStageView(Game.Content.getView(BidStageView)).bidstagePart;
                bidstageview = BidStageView(Game.Content.getView(BidStageView));
                Reader3to1Timer = getTimer();
                trace("公开信息超过10秒钟未更新");
                bidinfo.setLightState(1);
                if (!(Main.isKickOut))
                {
                };
                this.logappliction.WriteLog2("行情板块", "http获取行情", "亮红灯");
            };
        }

        private function readPageDataHandler(e:IAssetLoader)
        {
            isGetWebData = true;
            var bidinfo:BidInfoPart = BidInfoPart(Game.Content.getView(BidInfoPart));
            bidinfo.info.htmlText = BidInfoParse.info(e.content, true);
            GameAsset.destroy(e.key, this.readPageDataHandler);
        }


    }
}//package task
