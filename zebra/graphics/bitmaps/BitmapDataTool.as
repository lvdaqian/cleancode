//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics.bitmaps
{
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.Bitmap;
    import flash.display.DisplayObject;
    import __AS3__.vec.*;

    public class BitmapDataTool 
    {


        public static function MovieClipToBitmapData(bitmapDataDraw:BitmapDataDraw):Vector.<BitmapData>
        {
            var data:Vector.<BitmapData> = new Vector.<BitmapData>();
            var target:MovieClip = MovieClip(bitmapDataDraw.target);
            var i:int = 1;
            while (i <= target.totalFrames)
            {
                target.gotoAndStop(i);
                data.push(bitmapDataDraw.renderTarget(target));
                i++;
            };
            return (data);
        }

        public static function replaceColor(bitmapData:BitmapData, color:uint, repColor:uint, mask:uint=0xFFFFFF):void
        {
            if ((((bitmapData == null)) || ((bitmapData.width < 1))))
            {
                return;
            };
            bitmapData.threshold(bitmapData, bitmapData.rect, new Point(), "==", color, repColor, mask, true);
        }

        public static function getRealImageRect(bitmapData:BitmapData):Rectangle
        {
            if ((((bitmapData == null)) || ((bitmapData.width < 1))))
            {
                return (new Rectangle());
            };
            return (bitmapData.getColorBoundsRect(0xFF000000, 0, false));
        }

        public static function getRealBitmapData(source:BitmapData):BitmapData
        {
            var rect:Rectangle = getRealImageRect(source);
            var bmd:BitmapData = new BitmapData(rect.width, rect.height, true, 0xFFFFFF);
            bmd.copyPixels(source, rect, new Point(0, 0));
            return (bmd);
        }

        public static function isEmptyImage(bitmapData:BitmapData):Boolean
        {
            if ((((bitmapData == null)) || ((bitmapData.width < 1))))
            {
                return (false);
            };
            return (getRealImageRect(bitmapData).equals(new Rectangle()));
        }

        public static function IsTransparentByMousePoint(bm:Bitmap):Boolean
        {
            if (bm.stage == null)
            {
                return (true);
            };
            var bd:BitmapData = bm.bitmapData;
            var displayPoint:Point = toStagePoint(bm);
            var stagepoint:Point = new Point(bm.stage.mouseX, bm.stage.mouseY);
            return (!((((bd.getPixel32((bm.stage.mouseX - displayPoint.x), (bm.stage.mouseY - displayPoint.y)) >> 24) & 0xFF) == 0)));
        }

        private static function toStagePoint(target:DisplayObject):Point
        {
            return (target.parent.localToGlobal(new Point(target.x, target.y)));
        }


    }
}//package zebra.graphics.bitmaps
