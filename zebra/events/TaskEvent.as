//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;

    public class TaskEvent extends Event 
    {

        public static const COMPLETE:String = "complete";
        public static const STOP:String = "stop";
        public static const ERROR:String = "error";

        public var errorMessage:String;

        public function TaskEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
        }

    }
}//package zebra.events
