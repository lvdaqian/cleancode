//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import flash.display.Sprite;
    import control.SocketControl;
    import model.LogApplication;
    import model.XxteaEncodeAndDecode;
    import zebra.Game;
    import model.BidInfoUserModel;
    import model.BidInfoServerModel;
    import zebra.system.net.GameSocketThread;
    import task.BidInfoWebDataAction;
    import zebra.system.collections.FlashBytesReader;
    import util.BidInfoParse;
    import task.BidInfoHeartAction;
    import zebra.system.net.SocketThreadParam;
    import flash.utils.getTimer;
    import model.UserQueue;

    public class BidInfoView extends Sprite 
    {

        public var bidinfo:BidInfoPart;
        public var socketControl:SocketControl;
        public var logappliction:LogApplication;
        public var xxtea:XxteaEncodeAndDecode;

        public function BidInfoView()
        {
            this.bidinfo = new BidInfoPart();
            this.logappliction = new LogApplication();
            this.xxtea = new XxteaEncodeAndDecode();
            super();
            Game.Content.addUpdateView(this);
            var bidInfoUserModel:BidInfoUserModel = BidInfoUserModel(Game.Content.getModel(BidInfoUserModel));
            var infoModel:BidInfoServerModel = BidInfoServerModel(Game.Content.getModel(BidInfoServerModel));
            var bidInitView:BidInitView = BidInitView(Game.Content.getView(BidInitView));
            var _socket:GameSocketThread = BidStageView(Game.Content.getView(BidStageView)).socketControl.socket;
            _socket.receive("3-1", this.Reader3to1Handler);
            this.bidinfo.setLightState(1);
            addChild(this.bidinfo);
            Game.TimeUpdate.addTaskAction(new BidInfoWebDataAction(), 1000);
        }

        private function Reader1to1Handler(data:SocketThreadParam):void
        {
            trace("========左边=======1-1==================");
            var bytesReader:FlashBytesReader = data.bytesReader.clone();
            var receiveData1to1:String = bytesReader.readString();
            var sourceStr1to1:String = this.xxtea.XxteaDecode(receiveData1to1);
            var serverJSON:String = sourceStr1to1;
            this.bidinfo.info.htmlText = BidInfoParse.info(serverJSON);
            var heart:BidInfoHeartAction = new BidInfoHeartAction();
            heart.execute();
            Game.Hack.keepframe();
        }

        private function Reader3to1Handler(data:SocketThreadParam):void
        {
            trace("接收到3-1");
            BidInfoWebDataAction.Reader3to1Timer = getTimer();
            this.bidinfo.setLightState(2);
            var bytesReader:FlashBytesReader = data.bytesReader.clone();
            var receiveData3to1:String = bytesReader.readString();
            var serverJSON:String = receiveData3to1;
            this.bidinfo.info.htmlText = BidInfoParse.info(serverJSON);
            var userQueue:UserQueue = UserQueue(Game.Content.getModel(UserQueue));
            if (userQueue != null)
            {
                if (PriceWaitPart(Game.Content.getView(PriceWaitPart)))
                {
                    PriceWaitPart(Game.Content.getView(PriceWaitPart)).setLoaderPos(userQueue.getPos());
                };
            };
        }


    }
}//package view
