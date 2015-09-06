//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics.animation
{
    import flash.display.Bitmap;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.events.Event;
    import zebra.Game;
    import zebra.graphics.bitmaps.BitmapDataTool;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import zebra.events.BitmapBatchEvent;
    import __AS3__.vec.*;

    [Event(name="dispose", type="zebra.events.BitmapBatchEvent")]
    [Event(name="bitmapClick", type="zebra.events.BitmapBatchEvent")]
    [Event(name="bitmapDown", type="zebra.events.BitmapBatchEvent")]
    [Event(name="bitmapHover", type="zebra.events.BitmapBatchEvent")]
    [Event(name="bitmapOut", type="zebra.events.BitmapBatchEvent")]
    public class BitmapBatch extends Bitmap implements IAnimation 
    {

        protected var _ClickBeforeHandler:Function;
        protected var _ClickHandler:Function;
        protected var _HoverHandler:Function;
        protected var _DownHandler:Function;
        protected var _OutHandler:Function;
        private var _lock:Boolean;
        private var _disposed:Boolean;
        private var _pause:Boolean;
        private var _isStrat:Boolean;
        private var _bitmapBatchTaskAction:BitmapBatchTaskAction;
        private var _currentFrame:int = 0;
        private var _bitmapdataSource:Vector.<BitmapData>;
        private var _fps:int;
        private var _loop:Boolean;
        private var _align:String;
        private var _offX:Number;
        private var _offY:Number;

        public function BitmapBatch(data:Vector.<BitmapData>=null, align:String="none")
        {
            var bmd:BitmapData;
            super();
            if (data == null)
            {
                data = new Vector.<BitmapData>();
                bmd = new BitmapData(1, 1, true);
                data.push(bmd);
            };
            this._bitmapdataSource = data;
            this._loop = true;
            this._disposed = false;
            this._align = align;
            this._offX = 0;
            this._offY = 0;
            this._fps = 24;
            (this.bitmapData == this._bitmapdataSource[0]);
            addEventListener(Event.ADDED_TO_STAGE, this.addToStageLogic);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removeStageLogic);
        }

        private function removeStageLogic(e:Event):void
        {
            Game.graphicsDeviceManager.bitmapBatchManger.remove(this);
        }

        private function addToStageLogic(e:Event):void
        {
            Game.graphicsDeviceManager.bitmapBatchManger.add(this);
        }

        public function get IsHitMouse():Boolean
        {
            if (this._lock)
            {
                return (false);
            };
            return (BitmapDataTool.IsTransparentByMousePoint(this));
        }

        public function toStagePoint(target:DisplayObject):Point
        {
            return (this.parent.localToGlobal(new Point(this.x, this.y)));
        }

        override public function set bitmapData(value:BitmapData):void
        {
            super.bitmapData = value;
            this.setBitmapAlign();
        }

        public function get totalframes():int
        {
            return (this._bitmapdataSource.length);
        }

        public function get currentFrame():int
        {
            return (this._currentFrame);
        }

        public function set currentFrame(value:int):void
        {
            if (value < 0)
            {
                this._currentFrame = 0;
            };
            if (value >= this.totalframes)
            {
                this._currentFrame = (this.totalframes - 1);
            };
            this.bitmapData = this._bitmapdataSource[this._currentFrame];
        }

        public function get IsStart():Boolean
        {
            return (this._isStrat);
        }

        public function get loop():Boolean
        {
            return (this._loop);
        }

        public function set loop(value:Boolean):void
        {
            this._loop = value;
        }

        public function frameRenderLogic():void
        {
            if (((!(this._pause)) && (!(this._disposed))))
            {
                if (this._loop)
                {
                    this.bitmapData = this._bitmapdataSource[this._currentFrame];
                    this._currentFrame++;
                    this._currentFrame = (((this._currentFrame == this.totalframes)) ? 0 : this._currentFrame);
                }
                else
                {
                    if (this._currentFrame != (this.totalframes - 1))
                    {
                        this.bitmapData = this._bitmapdataSource[this._currentFrame];
                        this._currentFrame++;
                    };
                };
            };
        }

        public function play(name:String=""):void
        {
            this.bitmapData = this._bitmapdataSource[this._currentFrame];
            this._isStrat = true;
            this._disposed = false;
            this._pause = false;
            this.fps = this._fps;
        }

        public function pause():void
        {
            this._pause = !(this._pause);
        }

        public function stop():void
        {
            this._pause = true;
        }

        public function get Disposed():Boolean
        {
            return (this._disposed);
        }

        public function get fps():int
        {
            return (this._fps);
        }

        public function set fps(value:int):void
        {
            this._fps = value;
            if (this.totalframes > 1)
            {
                if (this._bitmapBatchTaskAction != null)
                {
                    Game.TimeUpdate.removeTaskAction(this._bitmapBatchTaskAction);
                };
                this._bitmapBatchTaskAction = new BitmapBatchTaskAction(this);
                Game.TimeUpdate.addTaskAction(this._bitmapBatchTaskAction, (1000 / this._fps));
            };
        }

        public function get BitmapDataSource():Vector.<BitmapData>
        {
            return (this._bitmapdataSource);
        }

        public function set BitmapDataSource(value:Vector.<BitmapData>):void
        {
            this._bitmapdataSource = value;
            this.currentFrame = 0;
        }

        public function get align():String
        {
            return (this._align);
        }

        public function set align(value:String):void
        {
            this._align = value;
            this.setBitmapAlign();
        }

        public function get offX():Number
        {
            return (this._offX);
        }

        public function set offX(value:Number):void
        {
            this._offX = value;
        }

        public function get offY():Number
        {
            return (this._offY);
        }

        public function set offY(value:Number):void
        {
            this._offY = value;
        }

        public function get ClickHandler():Function
        {
            return (this._ClickHandler);
        }

        public function set ClickHandler(value:Function):void
        {
            this._ClickHandler = value;
        }

        public function get HoverHandler():Function
        {
            return (this._HoverHandler);
        }

        public function set HoverHandler(value:Function):void
        {
            this._HoverHandler = value;
        }

        public function get OutHandler():Function
        {
            return (this._OutHandler);
        }

        public function set OutHandler(value:Function):void
        {
            this._OutHandler = value;
        }

        public function get lock():Boolean
        {
            return (this._lock);
        }

        public function set lock(value:Boolean):void
        {
            this._lock = value;
        }

        public function get DownHandler():Function
        {
            return (this._DownHandler);
        }

        public function set DownHandler(value:Function):void
        {
            this._DownHandler = value;
        }

        public function get ClickBeforeHandler():Function
        {
            return (this._ClickBeforeHandler);
        }

        public function set ClickBeforeHandler(value:Function):void
        {
            this._ClickBeforeHandler = value;
        }

        private function setBitmapAlign():void
        {
            if (this.bitmapData == null)
            {
                return;
            };
            switch (this._align.toLocaleUpperCase())
            {
                case "NONE":
                    break;
                case "LT":
                    this.x = 0;
                    this.y = 0;
                    break;
                case "CT":
                    this.x = ((this.bitmapData.width / 2) * -1);
                    this.y = 0;
                    break;
                case "RT":
                    this.x = (this.bitmapData.width * -1);
                    this.y = 0;
                    break;
                case "TL":
                    this.x = 0;
                    this.y = 0;
                    break;
                case "TC":
                    this.x = ((this.bitmapData.width / 2) * -1);
                    this.y = 0;
                    break;
                case "TR":
                    this.x = (this.bitmapData.width * -1);
                    this.y = 0;
                    break;
                case "CL":
                    this.x = 0;
                    this.y = ((this.bitmapData.height / 2) * -1);
                    break;
                case "LC":
                    this.x = 0;
                    this.y = ((this.bitmapData.height / 2) * -1);
                    break;
                case "CC":
                    this.x = ((this.bitmapData.width / 2) * -1);
                    this.y = ((this.bitmapData.height / 2) * -1);
                    break;
                case "CR":
                    this.x = (this.bitmapData.width * -1);
                    this.y = ((this.bitmapData.height / 2) * -1);
                    break;
                case "RC":
                    this.x = (this.bitmapData.width * -1);
                    this.y = ((this.bitmapData.height / 2) * -1);
                    break;
                case "BL":
                    this.x = 0;
                    this.y = (this.bitmapData.height * -1);
                    break;
                case "LB":
                    this.x = 0;
                    this.y = (this.bitmapData.height * -1);
                    break;
                case "BC":
                    this.x = ((this.bitmapData.width / 2) * -1);
                    this.y = (this.bitmapData.height * -1);
                    break;
                case "CB":
                    this.x = ((this.bitmapData.width / 2) * -1);
                    this.y = (this.bitmapData.height * -1);
                    break;
                case "BR":
                    this.x = (this.bitmapData.width * -1);
                    this.y = (this.bitmapData.height * -1);
                    break;
                case "RB":
                    this.x = (this.bitmapData.width * -1);
                    this.y = (this.bitmapData.height * -1);
                    break;
            };
            this.x = (this.x + this._offX);
            this.y = (this.y + this._offY);
        }

        public function clone():BitmapBatch
        {
            return (new BitmapBatch(this._bitmapdataSource, this._align));
        }

        public function dispose():void
        {
            var event:BitmapBatchEvent;
            if (!(this._disposed))
            {
                this._disposed = true;
                event = new BitmapBatchEvent(BitmapBatchEvent.DISPOSE);
                dispatchEvent(event);
                this.bitmapData = null;
                if (this._bitmapBatchTaskAction != null)
                {
                    Game.TimeUpdate.removeTaskAction(this._bitmapBatchTaskAction);
                };
            };
        }


    }
}//package zebra.graphics.animation

import zebra.thread.task.TaskAction;
import zebra.graphics.animation.BitmapBatch;

class BitmapBatchTaskAction extends TaskAction 
{

    /*private*/ var _bitmapBatch:BitmapBatch;

    public function BitmapBatchTaskAction(bitmapBatch:BitmapBatch)
    {
        this._bitmapBatch = bitmapBatch;
    }

    override public function execute():void
    {
        super.execute();
        if (((!((this._bitmapBatch == null))) && (this._bitmapBatch.IsStart)))
        {
            this._bitmapBatch.frameRenderLogic();
        };
    }


}
