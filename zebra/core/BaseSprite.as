//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.core
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;

    class BaseSprite extends Sprite 
    {

        private var _disposed:Boolean;
        private var _IsRender:Boolean;
        public var addStageHandler:Function;
        public var removeStageHandler:Function;

        public function BaseSprite()
        {
            this.initialize();
            this.eventListener();
            this.addEventListener(Event.ADDED_TO_STAGE, this._addToStageLogic);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this._removeStageLogic);
        }

        protected function initialize():void
        {
        }

        protected function eventListener():void
        {
        }

        protected function addToStageControl():void
        {
        }

        protected function removeStageControl():void
        {
        }

        private function _addToStageLogic(e:Event):void
        {
            this.addToStageControl();
            if (this.addStageHandler != null)
            {
                this.addStageHandler(this);
            };
            this._IsRender = true;
        }

        private function _removeStageLogic(e:Event):void
        {
            this.addToStageControl();
            this._IsRender = false;
            if (this.removeStageHandler != null)
            {
                this.removeStageHandler(this);
            };
        }

        public function get IsRender():Boolean
        {
            return (this._IsRender);
        }

        public function get Disposed():Boolean
        {
            return (this._disposed);
        }

        protected function disposeControl(removeStageUse:Boolean=false):void
        {
            if (this.Disposed)
            {
                return;
            };
            if (!(this._disposed))
            {
                this._disposed = true;
                this.addStageHandler = null;
                this.removeStageHandler = null;
                this.dispose();
                if (((!(removeStageUse)) && (this.parent)))
                {
                    this.parent.removeChild(this);
                };
            };
        }

        public function dispose():void
        {
        }

        public function hitMouse():Boolean
        {
            if (((((!(visible)) || (!(this.mouseEnabled)))) || ((this.stage == null))))
            {
                return (false);
            };
            var Gpoint:Point = this.toGlobalPoint();
            var rect:Rectangle = new Rectangle(Gpoint.x, Gpoint.y, this.width, this.height);
            return (rect.containsPoint(new Point(this.stage.mouseX, this.stage.mouseY)));
        }

        public function toGlobalPoint():Point
        {
            return (this.toStagePoint(this));
        }

        public function toGlobalBound():Rectangle
        {
            var point:Point = this.toGlobalPoint();
            return (new Rectangle(point.x, point.y, width, height));
        }

        protected function toStagePoint(target:DisplayObject):Point
        {
            var result:Point = new Point();
            while (target != null)
            {
                result.x = (result.x + target.x);
                result.y = (result.y + target.y);
                target = target.parent;
            };
            return (result);
        }


    }
}//package zebra.core
