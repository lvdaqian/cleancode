//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.PriceResult2;
    import flash.net.URLLoader;
    import model.LogApplication;
    import zebra.Game;
    import flash.events.MouseEvent;
    import model.UserQueue;
    import model.WebParamModel;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import control.PriceParseControl;

    public class PriceWaitPart extends PriceResult2 
    {

        public static var IsOverPrice:Boolean = false;

        private var loader2:URLLoader;
        public var Timer2to3:uint;
        public var logappliction:LogApplication;
        private var _val:int = 0;

        public function PriceWaitPart()
        {
            this.loader2 = new URLLoader();
            this.logappliction = new LogApplication();
            super();
            Game.Content.addUpdateView(this);
            this.loader.gotoAndStop(1);
            retryBut.visible = false;
            BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.receive("2-3", this.get2t3InfoHandler);
            this.visible = !(PriceWaitPart.IsOverPrice);
        }

        private function closeHandler(e:MouseEvent):void
        {
            this.parent.removeChild(this);
        }

        private function get2t3InfoHandler(e:*):void
        {
        }

        public function clearTimer():void
        {
        }

        public function setLoaderPos(val:int):void
        {
            var userQueue:UserQueue;
            trace(("进度条" + val));
            if (val > this._val)
            {
                this._val = val;
                userQueue = UserQueue(Game.Content.getModel(UserQueue));
                this.loader.gotoAndStop(val);
                trace((val + "%"));
                if (val == 100)
                {
                    val = 99;
                };
                this.myPriceResult.text = (val + "%");
                trace((val + "%"));
            };
        }

        private function httpGet2to3():void
        {
            var requestid:String = BidStageView(Game.Content.getView(BidStageView)).requestid;
            var webParamModel:WebParamModel = WebParamModel(Game.Content.getModel(WebParamModel));
            var httpUrl:String = ((((("http://" + webParamModel.httpIP) + "/bid/query.ashx?bidnumber=") + webParamModel.uid) + "&requestid=") + requestid);
            trace(httpUrl);
            this.logappliction.WriteLogWithURL("投标板块", "100%后7秒后请求出价情况", httpUrl);
            var request:URLRequest = new URLRequest(httpUrl);
            request.method = URLRequestMethod.GET;
            request.contentType = "application/json";
            this.loader2.load(request);
            this.loader2.addEventListener(Event.COMPLETE, this.getHttpContentHandler);
        }

        private function getHttpContentHandler(event:*):void
        {
            var jsonstr:String = String(this.loader2.data);
            PriceParseControl.parse(jsonstr, 3);
            IsOverPrice = true;
        }


    }
}//package view
