//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import zebra.system.collections.GUID;
    import flash.net.SharedObject;
    import flash.events.Event;
    import wicresoft.errorInfo;
    import zebra.Game;

    public class BrowserPart extends Sprite 
    {

        private var _uuid:String;
        private var _a:TextField;

        public function BrowserPart()
        {
            this._uuid = GUID.create();
            this._a = new TextField();
            super();
            var browserSO:SharedObject = SharedObject.getLocal("browserSO");
            browserSO.data["uuid"] = this._uuid;
            browserSO.flush();
            addChild(new BidInitView());
            addEventListener(Event.ENTER_FRAME, this.frameLogic);
        }

        private function frameLogic(e:Event):void
        {
            var error:errorInfo;
            var browserSO:SharedObject = SharedObject.getLocal("browserSO");
            this._a.text = ((((browserSO.data["uuid"] + "<<>>") + this._uuid) + ">>") + Math.random());
            if (browserSO.data["uuid"] != this._uuid)
            {
                removeEventListener(Event.ENTER_FRAME, this.frameLogic);
                Main.isKickOut = true;
                removeChildren();
                BidStageView(Game.Content.getView(BidStageView)).socketControl.close();
                error = new errorInfo();
                error.x = 25;
                Game.graphicsDeviceManager.stage.addChild(error);
            };
        }


    }
}//package view
