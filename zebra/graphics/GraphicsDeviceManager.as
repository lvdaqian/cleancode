//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics
{
    import flash.events.EventDispatcher;
    import flash.display.Stage;
    import zebra.graphics.animation.BitmapBatchManager;
    import flash.display.StageDisplayState;
    import flash.geom.Point;
    import flash.display.DisplayObject;

    public class GraphicsDeviceManager extends EventDispatcher 
    {

        private var _gameStage:Stage;
        private var _bitmapBatchManger:BitmapBatchManager;

        public function GraphicsDeviceManager(stage:Stage)
        {
            this._gameStage = stage;
            this._bitmapBatchManger = new BitmapBatchManager();
        }

        public function get fps():int
        {
            return (this._gameStage.frameRate);
        }

        public function get stage():Stage
        {
            return (this._gameStage);
        }

        public function get supportGPU():Boolean
        {
            return (false);
        }

        public function get IsFullScreen():Boolean
        {
            return ((this._gameStage.displayState == StageDisplayState.FULL_SCREEN));
        }

        public function get bitmapBatchManger():BitmapBatchManager
        {
            return (this._bitmapBatchManger);
        }

        public function toDevicePoint(target:DisplayObject):Point
        {
            return (target.parent.localToGlobal(new Point(target.x, target.y)));
        }

        public function toLocalOffsetPoint(target:DisplayObject):Point
        {
            var stagePoint:Point;
            var selfPoint:Point;
            if (target.stage)
            {
                stagePoint = new Point(target.stage.mouseX, target.stage.mouseY);
                selfPoint = this.toDevicePoint(target);
                return (new Point((selfPoint.x - stagePoint.x), (selfPoint.y - stagePoint.y)));
            };
            return (null);
        }


    }
}//package zebra.graphics
