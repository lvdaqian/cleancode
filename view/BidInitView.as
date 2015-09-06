//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import zebra.core.GameView;
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import zebra.Game;
    import flash.utils.setTimeout;

    public class BidInitView extends GameView 
    {

        public static var win:Sprite;

        public var left_container:Sprite;
        public var right_container:Sprite;
        public var top_container:Sprite;
        private var log_container:Sprite;

        public function BidInitView()
        {
            this.x = 23;
            this.left_container = new Sprite();
            addChild(this.left_container);
            this.right_container = new Sprite();
            addChild(this.right_container);
            this.top_container = new Sprite();
            this.top_container.x = 403;
            addChild(this.top_container);
            win = new Sprite();
            win.x = 403;
            addChild(win);
            this.log_container = new Sprite();
            this.log_container.addChild(new LogWinPart());
            addChild(this.log_container);
            this.create();
        }

        public static function clearwin():void
        {
            win.removeChildren();
        }

        public static function setWin(element:DisplayObject):void
        {
            win.removeChildren();
            win.addChild(element);
        }


        public function create():void
        {
            Game.TimeUpdate.removeAllTask();
            this.right_container.addChild(new BidStageView());
            this.left_container.addChild(new BidInfoView());
        }

        public function setMessage(msg:String):void
        {
            this.top_container.removeChildren();
            this.top_container.addChild(new WarnInfoPart(msg));
        }

        public function reSetView(value:int, time:int=0):void
        {
            setTimeout(function ()
            {
                if (value == 0)
                {
                    left_container.removeChildren();
                    left_container.addChild(new BidInfoView());
                }
                else
                {
                    right_container.removeChildren();
                    right_container.addChild(new BidStageView());
                };
            }, time);
        }


    }
}//package view
