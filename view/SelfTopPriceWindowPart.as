//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.SelfTopPriceWindow;
    import model.LogApplication;
    import model.XxteaEncodeAndDecode;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import model.WebParamModel;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import zebra.Game;
    import flash.net.URLRequestMethod;
    import model.BidStageUserModel;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import zebra.content.GameAsset;
    import zebra.loaders.IAssetLoader;
    import control.PriceParseControl;

    public class SelfTopPriceWindowPart extends SelfTopPriceWindow 
    {

        private var imageurl:String;
        private var _uniqueid:String;
        public var logappliction:LogApplication;
        private var xxteaHttp:XxteaEncodeAndDecode;

        public function SelfTopPriceWindowPart()
        {
            this.logappliction = new LogApplication();
            this.xxteaHttp = new XxteaEncodeAndDecode();
            super();
            yzcode.restrict = "0-9";
            cancelBut.addEventListener(MouseEvent.CLICK, this.closeWinHandler);
            okBut.addEventListener(MouseEvent.CLICK, this.submitHandler);
            addEventListener(Event.ADDED_TO_STAGE, this.addTostageHandler);
        }

        private function addTostageHandler(e:Event):void
        {
            var webParamModel:WebParamModel;
            var httpUrl:String;
            var loader:URLLoader;
            var request:URLRequest;
            stage.focus = yzcode;
            this.logappliction.WriteLog2("投标板块", "http查询最新出价情况", "");
            var bidcode:Number = BidStagePart(Game.Content.getView(BidStagePart)).bidcode;
            if ((((bidcode == 3)) || ((bidcode == 4))))
            {
                BidInitView.setWin(new WarnInfoPart(7));
            }
            else
            {
                webParamModel = WebParamModel(Game.Content.getModel(WebParamModel));
                httpUrl = ((("http://" + webParamModel.httpIP) + "/webwcf/BidCmd.svc/WebCmd?p=") + Math.random());
                trace(httpUrl);
                loader = new URLLoader();
                request = new URLRequest(httpUrl);
                request.method = URLRequestMethod.POST;
                request.data = BidStageUserModel(Game.Content.getModel(BidStageUserModel)).selfPriceInfowithoutUniqueid();
                request.contentType = "application/json";
                loader.addEventListener(Event.COMPLETE, function getHttpContentHandler (event:Event):void
                {
                    var startIndex:int;
                    var endindex:int;
                    var jsonstr:String = String(loader.data);
                    trace(("获取校验码：" + jsonstr));
                    if (jsonstr.indexOf("</string") == -1)
                    {
                        jsonstr = jsonstr.split('\\"').join('"');
                        jsonstr = jsonstr.substr(1, (jsonstr.length - 2));
                    }
                    else
                    {
                        startIndex = jsonstr.indexOf('/">');
                        endindex = jsonstr.indexOf("</string>");
                        jsonstr = jsonstr.substring((startIndex + 3), endindex);
                    };
                    var jsonstr3:String = jsonstr.split("\\/").join("/");
                    var jsonstr2:String = jsonstr3;
                    trace(("***********************" + jsonstr2));
                    var json:Object = JSON.parse(jsonstr2);
                    var imageData:String = json.response.data;
                    trace(imageData);
                    var imageHttpArr:Array = new Array();
                    imageHttpArr = imageData.split(",", imageData.length);
                    var imageurl:String = imageHttpArr[1];
                    _uniqueid = imageHttpArr[0];
                    trace(("imageurl is:" + imageurl));
                    loadimage(imageurl);
                    logappliction.WriteLogWithURL("投标板块", "请求最新出价情况校验码", imageurl);
                });
                loader.load(request);
            };
        }

        private function loadimage(url:String):void
        {
            var tf:TextField;
            var c:DisplayObject;
            if (url != null)
            {
                url = ((" <img src='" + url) + "' id='image2'>");
                tf = new TextField();
                tf.htmlText = url;
                addChild(tf);
                c = tf.getImageReference("image2");
                c.x = 310;
                c.y = 200;
                addChild(c);
            }
            else
            {
                this.closeWinHandler(null);
            };
        }

        private function submitHandler(e:MouseEvent):void
        {
            var warn:WarnInfoPart;
            if (yzcode.text.length == 0)
            {
                warn = new WarnInfoPart(4);
                BidInitView.setWin(warn);
            }
            else
            {
                this.sendAndGetPriceInfo();
            };
            this.closeWinHandler(e);
        }

        private function closeWinHandler(e:MouseEvent):void
        {
            try
            {
                this.parent.removeChild(this);
            }
            catch(e)
            {
            };
        }

        private function showSelfTopPriceWindow(e:IAssetLoader):void
        {
            e.content.x = 310;
            e.content.y = 200;
            addChild(e.content);
            GameAsset.destroy(e.key, this.showSelfTopPriceWindow);
        }

        private function sendAndGetPriceInfo():void
        {
            var loader:URLLoader;
            var webParamModel:WebParamModel = WebParamModel(Game.Content.getModel(WebParamModel));
            var httpUrl:String = ((("http://" + webParamModel.httpIP) + "/webwcf/BidCmd.svc/WebCmd?p=") + Math.random());
            this.logappliction.WriteLogWithURL("投标板块", "请求最新出价情况", httpUrl);
            loader = new URLLoader();
            var request:URLRequest = new URLRequest(httpUrl);
            request.method = URLRequestMethod.POST;
            request.data = BidStageUserModel(Game.Content.getModel(BidStageUserModel)).sendPriceInfo(yzcode.text, this._uniqueid);
            request.contentType = "application/json";
            loader.load(request);
            loader.addEventListener(Event.COMPLETE, function getHttpContentHandler (event:Event):void
            {
                var startIndex:int;
                var endindex:int;
                var jsonstrSelfInfo:String = String(loader.data);
                if (jsonstrSelfInfo.indexOf("</string") == -1)
                {
                    jsonstrSelfInfo = jsonstrSelfInfo.split('\\"').join('"');
                    jsonstrSelfInfo = jsonstrSelfInfo.substr(1, (jsonstrSelfInfo.length - 2));
                }
                else
                {
                    startIndex = jsonstrSelfInfo.indexOf('/">');
                    endindex = jsonstrSelfInfo.indexOf("</string>");
                    jsonstrSelfInfo = jsonstrSelfInfo.substring((startIndex + 3), endindex);
                };
                var selfInfo1:String = jsonstrSelfInfo.split("\\/").join("/");
                var selfInfo:String = selfInfo1;
                logappliction.WriteLogWithWarn("投标板块", "接收最新出价情况", selfInfo);
                PriceParseControl.parse(selfInfo, 1);
            });
        }


    }
}//package view
