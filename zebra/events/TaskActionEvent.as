//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;

    public class TaskActionEvent extends Event 
    {

        public static const COMPLETE:String = "complete";
        public static const STOP:String = "stop";
        public static const DISPOSE:String = "dispose";

        public function TaskActionEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
        }

    }
}//package zebra.events
