//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.PriceInfoWindow;
    import flash.net.URLLoader;
    import model.XxteaEncodeAndDecode;
    import model.LogApplication;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import zebra.Game;
    import model.BidStageUserModel;
    import model.WebParamModel;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import control.PriceParseControl;
    import zebra.system.collections.ByteArrayCollection;
    import zebra.system.net.GameSocketThread;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import zebra.system.collections.FlashBytesReader;
    import zebra.system.net.SocketThreadParam;
    import flash.display.Loader;
    import flash.display.Bitmap;
    import zebra.content.GameAsset;
    import zebra.loaders.IAssetLoader;

    public class PriceInfoWindowPart extends PriceInfoWindow 
    {

        private var _price:int = 0;
        private var _img:String;
        public var otTimer:uint;
        private var loader1:URLLoader;
        public var xxtea:XxteaEncodeAndDecode;
        public var logappliction:LogApplication;
        private var imageurl:String;

        public function PriceInfoWindowPart(price:int)
        {
            this.loader1 = new URLLoader();
            this.xxtea = new XxteaEncodeAndDecode();
            this.logappliction = new LogApplication();
            super();
            yzcode.restrict = "0-9";
            this._price = price;
            this.mypricetxt.text = (("您的出价为: " + price) + "元");
            cancelBut.addEventListener(MouseEvent.CLICK, this.closeHandler);
            okBut.addEventListener(MouseEvent.CLICK, this.submitHandler);
            addEventListener(Event.ADDED_TO_STAGE, this.addTostageHandler);
            BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.receive("2-2", this.getPriceInfoHandler);
        }

        private function getPriceInfoHandler(e:*):void
        {
            this.clearTimer();
        }

        private function submitHandler(e:MouseEvent):void
        {
            var userModel:BidStageUserModel;
            if (e.target.name == "okBut")
            {
                PriceWaitPart.IsOverPrice = false;
                if (yzcode.text.length == 0)
                {
                    BidInitView.setWin(new WarnInfoPart(4));
                }
                else
                {
                    if (yzcode.text == " ")
                    {
                        BidInitView.setWin(new WarnInfoPart(4));
                    }
                    else
                    {
                        BidInitView.setWin(new WarnInfoPart(6, false));
                        userModel = BidStageUserModel(Game.Content.getModel(BidStageUserModel));
                        BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.send("2-2", userModel.bytes2_2(String(this._price), yzcode.text));
                    };
                };
            };
            this.closeHandler(e);
        }

        private function readLastDataPage():void
        {
            var requestid:String = BidStageUserModel(Game.Content.getView(BidStageUserModel)).requestid2to2;
            var webParamModel:WebParamModel = WebParamModel(Game.Content.getModel(WebParamModel));
            var httpUrl:String = ((((("http://" + webParamModel.httpIP) + "/bid/query.ashx?bidnumber=") + webParamModel.uid) + "&requestid=") + requestid);
            trace(httpUrl);
            var request:URLRequest = new URLRequest(httpUrl);
            request.method = URLRequestMethod.GET;
            request.contentType = "application/json";
            this.loader1.load(request);
            this.logappliction.WriteLogWithURL("投标板块", "2-2发出15秒后请求出价情况", httpUrl);
            this.loader1.addEventListener(Event.COMPLETE, this.getHttpContentHandler);
        }

        private function getHttpContentHandler(event:*):void
        {
            var jsonstr:String = String(this.loader1.data);
            PriceParseControl.parse(jsonstr, 3);
        }

        public function clearTimer():void
        {
        }

        private function addTostageHandler(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.addTostageHandler);
            var data:ByteArrayCollection = new ByteArrayCollection();
            var userModel:BidStageUserModel = BidStageUserModel(Game.Content.getModel(BidStageUserModel));
            var _socket:GameSocketThread = BidStageView(Game.Content.getView(BidStageView)).socketControl.socket;
            _socket.receive("2-1", this.getCheckCodeHandler);
            _socket.send("2-1", userModel.bytes2_1(String(this._price)));
            stage.focus = yzcode;
        }

        private function getCheckCodeHandler(data:SocketThreadParam):void
        {
            var prompt:String;
            var requestid:String;
            var tf:TextField;
            var c:DisplayObject;
            var msg:String;
            var warn:WarnInfoPart;
            trace("2-1校验码获取");
            var bytesReader:FlashBytesReader = data.bytesReader.clone();
            var receiveData2to1:String = bytesReader.readString();
            trace(("receiveData2to1 is :" + receiveData2to1));
            var sourceStr2to1:String = this.xxtea.XxteaDecode(receiveData2to1);
            var json:Object = JSON.parse(sourceStr2to1);
            var code:String = json.response.responsecode;
            var servertime:String = json.servertime;
            if (code == "0")
            {
                this.imageurl = json.response.data.imageurl;
                prompt = json.response.data.prompt;
                this.yzmsg.text = prompt;
                trace(this.imageurl);
                requestid = json.requestid;
                this.logappliction.WriteLogWithWarn("投标板块", "接收校验码2-1", ((("requestid:" + requestid) + ",server time:") + servertime));
                this.logappliction.WriteLogWithURL("投标板块", "接收校验码2-1", this.imageurl);
                this.imageurl = ((" <img src='" + this.imageurl) + "' id='image'>");
                tf = new TextField();
                tf.htmlText = this.imageurl;
                addChild(tf);
                c = tf.getImageReference("image");
                c.x = 309;
                c.y = 218;
                addChild(c);
                trace("load img1 1");
            }
            else
            {
                msg = json.response.responsemsg;
                warn = new WarnInfoPart(msg);
                BidInitView.setWin(warn);
                this.logappliction.WriteLogWithWarn("投标板块", "系统提示2-1", msg);
            };
            var _socket:GameSocketThread = BidStageView(Game.Content.getView(BidStageView)).socketControl.socket;
            _socket.destroy("2-1", this.getCheckCodeHandler);
        }

        private function completeHandler(e:*):void
        {
            var loader:Loader = Loader(e.target.loader);
            var bitmap:Bitmap = Bitmap(loader.content);
            bitmap.x = 309;
            bitmap.y = 218;
            addChild(bitmap);
            this.logappliction.WriteLog2("投标板块", "出价校验码", "校验码加载完成");
        }

        private function loadCheckImageHandler(e:IAssetLoader):void
        {
            e.content.x = 309;
            e.content.y = 218;
            trace("load img1 2");
            addChild(e.content);
            trace("load img1 3");
            trace("\t2-1校验码加载完成");
            this.logappliction.WriteLog2("投标板块", "出价校验码", "校验码加载完成");
            GameAsset.destroy(e.key, this.loadCheckImageHandler);
        }

        private function closeHandler(e:MouseEvent):void
        {
            try
            {
                this.parent.removeChild(this);
            }
            catch(e)
            {
            };
        }


    }
}//package view
