//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import zebra.input.KeyInputData;
    import __AS3__.vec.*;

    public class KeyInputEvent extends Event 
    {

        public static const RELEASEKEYGROUP:String = "releaseKeyGroup";
        public static const ACTIVEKEYGROUP:String = "activeKeyGroup";

        public var keyGroupData:Vector.<KeyInputData>;
        public var keysIntValue:Vector.<int>;

        public function KeyInputEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
            this.keyGroupData = new Vector.<KeyInputData>();
        }

        override public function clone():Event
        {
            return (new KeyInputEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("KeyInputEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }


    }
}//package zebra.events
