//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics.animation
{
    import __AS3__.vec.Vector;
    import flash.display.Stage;
    import flash.events.MouseEvent;
    import zebra.events.BitmapBatchEvent;
    import flash.geom.Point;
    import __AS3__.vec.*;

    public class BitmapBatchManager 
    {

        private var batchs:Vector.<BitmapBatch>;
        private var stages:Vector.<Stage>;
        private var prevBitmapBatch:BitmapBatch;

        public function BitmapBatchManager()
        {
            this.batchs = new Vector.<BitmapBatch>();
            this.stages = new Vector.<Stage>();
        }

        public function add(target:BitmapBatch):void
        {
            this.batchs.push(target);
            if (this.stages.indexOf(target.stage) == -1)
            {
                this.stages.push(target.stage);
                target.stage.addEventListener(MouseEvent.CLICK, this.stageClickBitmapBatch);
                target.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.stageDownBitmapBatch);
                target.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.moveBitmapBatch);
            };
        }

        private function moveBitmapBatch(e:MouseEvent):void
        {
            var event:BitmapBatchEvent;
            var batch:BitmapBatch;
            var stage:Stage = e.target.stage;
            var point:Point = new Point(stage.mouseX, stage.mouseY);
            var array:Array = stage.getObjectsUnderPoint(point);
            array.reverse();
            if ((((array.length == 0)) && (!((this.prevBitmapBatch == null)))))
            {
                event = new BitmapBatchEvent(BitmapBatchEvent.BITMAPOUT);
                this.prevBitmapBatch.dispatchEvent(event);
                if (this.prevBitmapBatch.OutHandler != null)
                {
                    this.prevBitmapBatch.OutHandler(this.prevBitmapBatch);
                };
                this.prevBitmapBatch = null;
            };
            var i:int;
            while (i < array.length)
            {
                if ((array[i] is BitmapBatch))
                {
                    batch = BitmapBatch(array[i]);
                    if ((((this.prevBitmapBatch == batch)) && (!(batch.IsHitMouse))))
                    {
                        event = new BitmapBatchEvent(BitmapBatchEvent.BITMAPOUT);
                        this.prevBitmapBatch.dispatchEvent(event);
                        if (this.prevBitmapBatch.OutHandler != null)
                        {
                            this.prevBitmapBatch.OutHandler(this.prevBitmapBatch);
                        };
                        this.prevBitmapBatch = null;
                        return;
                    };
                    if (batch.IsHitMouse)
                    {
                        if (this.prevBitmapBatch != batch)
                        {
                            this.prevBitmapBatch = batch;
                            event = new BitmapBatchEvent(BitmapBatchEvent.BITMAPHOVER);
                            batch.dispatchEvent(event);
                            if (batch.HoverHandler != null)
                            {
                                batch.HoverHandler(batch);
                            };
                        };
                        return;
                    };
                };
                i++;
            };
        }

        private function stageClickBitmapBatch(e:MouseEvent):void
        {
            var event:BitmapBatchEvent;
            var batch:BitmapBatch;
            var stage:Stage = e.target.stage;
            if (!(stage))
            {
                return;
            };
            var point:Point = new Point(stage.mouseX, stage.mouseY);
            var array:Array = stage.getObjectsUnderPoint(point);
            array.reverse();
            var i:int;
            while (i < array.length)
            {
                if ((((array[i] is BitmapBatch)) && (array[i].IsHitMouse)))
                {
                    event = new BitmapBatchEvent(BitmapBatchEvent.BITMAPCLICK);
                    batch = BitmapBatch(array[i]);
                    batch.dispatchEvent(event);
                    if (batch.ClickBeforeHandler != null)
                    {
                        batch.ClickBeforeHandler(batch);
                    };
                    if (batch.ClickHandler != null)
                    {
                        batch.ClickHandler(batch);
                    };
                    break;
                };
                i++;
            };
        }

        private function stageDownBitmapBatch(e:MouseEvent):void
        {
            var batch:BitmapBatch;
            var event:BitmapBatchEvent;
            var stage:Stage = e.target.stage;
            var point:Point = new Point(stage.mouseX, stage.mouseY);
            var array:Array = stage.getObjectsUnderPoint(point);
            array.reverse();
            var i:int;
            while (i < array.length)
            {
                if ((((array[i] is BitmapBatch)) && (array[i].IsHitMouse)))
                {
                    batch = BitmapBatch(array[i]);
                    event = new BitmapBatchEvent(BitmapBatchEvent.BITMAPDOWN);
                    batch.dispatchEvent(event);
                    if (batch.DownHandler != null)
                    {
                        batch.DownHandler(batch);
                    };
                    return;
                };
                i++;
            };
        }

        public function remove(target:BitmapBatch):void
        {
            var index:int = this.batchs.indexOf(target);
            if (index != -1)
            {
                this.batchs.splice(index, 1);
            };
        }


    }
}//package zebra.graphics.animation
