//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;
    import zebra.system.collections.FlashBytesReader;

    public class GameSocketEvent extends Event 
    {

        public static const CONNECTSUCCESS:String = "connectSuccess";
        public static const CLOSE:String = "close";
        public static const IOERROR:String = "ioerror";
        public static const SECURITYERROR:String = "securityerror";
        public static const COMMANDREADER:String = "commandreader";

        public var bytesReader:FlashBytesReader;

        public function GameSocketEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
        }

        override public function clone():Event
        {
            return (new GameSocketEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("GameSocketEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }


    }
}//package zebra.events
