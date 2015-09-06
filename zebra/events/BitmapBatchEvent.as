//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;

    public class BitmapBatchEvent extends Event 
    {

        public static const DISPOSE:String = "dispose";
        public static const BITMAPCLICK:String = "bitmapClick";
        public static const BITMAPDOWN:String = "bitmapDown";
        public static const BITMAPHOVER:String = "bitmapHover";
        public static const BITMAPOUT:String = "bitmapOut";

        public function BitmapBatchEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
        }

        override public function clone():Event
        {
            return (new BitmapBatchEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("BitmapBatchEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }


    }
}//package zebra.events
