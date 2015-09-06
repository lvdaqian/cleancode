//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.thread.task
{
    import flash.events.EventDispatcher;
    import zebra.events.TaskActionEvent;

    [Event(name="complete", type="zebra.events.TaskActionEvent")]
    [Event(name="dispose", type="zebra.events.TaskActionEvent")]
    [Event(name="stop", type="zebra.events.TaskActionEvent")]
    public class TaskAction extends EventDispatcher implements ITaskAction 
    {

        static var _tid:int = 0;

        private var _actionid:String;
        private var _isStart:Boolean;
        private var _isFinish:Boolean;
        var _task:Task;

        public function TaskAction()
        {
            this._actionid = String(_tid++);
        }

        public function get IsStart():Boolean
        {
            return (this._isStart);
        }

        public function get IsFinish():Boolean
        {
            return (this._isFinish);
        }

        public function finish():void
        {
            this._isFinish = true;
            this.dispatchEvent(new TaskActionEvent(TaskActionEvent.COMPLETE));
        }

        function initializte():void
        {
        }

        public function set id(value:String):void
        {
            this._actionid = ((value + "-") + this._actionid);
        }

        public function get id():String
        {
            return (this._actionid);
        }

        public function get task():Task
        {
            return (this._task);
        }

        public function execute():void
        {
            this._isStart = true;
            this._isFinish = false;
        }

        public function dispose():void
        {
            this.dispatchEvent(new TaskActionEvent(TaskActionEvent.DISPOSE));
        }

        public function stop():void
        {
            this.dispatchEvent(new TaskActionEvent(TaskActionEvent.STOP));
        }


    }
}//package zebra.thread.task
