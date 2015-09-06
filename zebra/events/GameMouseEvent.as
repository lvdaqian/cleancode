//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;
    import flash.geom.Point;

    public class GameMouseEvent extends Event 
    {

        public static const BitmapClick:String = "bitmapClick";
        public static const BitmapMove:String = "bitmapMove";
        public static const BitmapHover:String = "bitmapHover";
        public static const BitmapOut:String = "bitmapOut";
        public static const BitmapDown:String = "bitmapDown";
        public static const BitmapUp:String = "bitmapUp";
        public static const UpdateMousePosition:String = "updateMousePosition";

        public var prevPoint:Point;
        public var currentPoint:Point;

        public function GameMouseEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            this.prevPoint = new Point(0, 0);
            this.currentPoint = new Point(0, 0);
            super(_arg_1, bubbles, cancelable);
        }

        public function get changePoint():Point
        {
            return (new Point((this.currentPoint.x - this.prevPoint.x), (this.currentPoint.y - this.prevPoint.y)));
        }

        override public function clone():Event
        {
            return (new GameMouseEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("GameMouseEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }


    }
}//package zebra.events
