//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.thread.task
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import zebra.events.TaskActionEvent;
    import flash.utils.setTimeout;
    import flash.utils.clearTimeout;
    import zebra.events.TaskEvent;
    import __AS3__.vec.*;

    [Event(name="complete", type="zebra.events.TaskEvent")]
    [Event(name="stop", type="zebra.events.TaskEvent")]
    [Event(name="error", type="zebra.events.TaskEvent")]
    public class Task extends EventDispatcher 
    {

        private var _taskActionList:Vector.<TaskAction>;
        private var _isFinish:Boolean;
        private var _isStart:Boolean;
        private var _IsStop:Boolean;
        private var _insideTaskLine:Boolean;
        private var _intervalTaskAction:int = 0;
        private var _concurrent:int;
        private var _executeIndex:int;
        private var _currentFinsihCount:int;
        public var errorMessageInfo:String;

        public function Task()
        {
            this._taskActionList = new Vector.<TaskAction>();
            this._insideTaskLine = false;
            this._concurrent = 1;
            this._IsStop = false;
        }

        public function get count():int
        {
            return (this._taskActionList.length);
        }

        public function start(intervalTaskAction:int=0):void
        {
            var startTaskCount:int;
            var i:int;
            this._intervalTaskAction = intervalTaskAction;
            if (!(this._isStart))
            {
                this._isStart = true;
                if (this._taskActionList.length == 0)
                {
                    this._taskCompleteLogic();
                }
                else
                {
                    startTaskCount = (((this._concurrent > this._taskActionList.length)) ? this._taskActionList.length : this._concurrent);
                    this._executeIndex = (startTaskCount - 1);
                    i = 0;
                    while (i < startTaskCount)
                    {
                        this._taskActionList[i].execute();
                        i++;
                    };
                };
            };
        }

        public function get currentTaskAction():TaskAction
        {
            if (this._taskActionList.length > 0)
            {
                return (this._taskActionList[0]);
            };
            return (null);
        }

        public function get IsFinish():Boolean
        {
            return (this._isFinish);
        }

        public function get concurrent():int
        {
            return (this._concurrent);
        }

        public function set concurrent(value:int):void
        {
            this._concurrent = value;
        }

        public function get currentFinsihCount():int
        {
            return (this._currentFinsihCount);
        }

        public function get IsStop():Boolean
        {
            return (this._IsStop);
        }

        public function addAction(action:TaskAction):void
        {
            action.addEventListener(TaskActionEvent.COMPLETE, this._removeTaskActin);
            action._task = this;
            this._taskActionList.push(action);
        }

        private function _removeTaskActin(e:TaskActionEvent):void
        {
            var nextTaskActionIndex:int;
            var id:uint;
            TaskAction(e.target).removeEventListener(TaskActionEvent.COMPLETE, this._removeTaskActin);
            this._currentFinsihCount++;
            if (this._currentFinsihCount == this._taskActionList.length)
            {
                this._taskCompleteLogic();
            }
            else
            {
                nextTaskActionIndex = ++this._executeIndex;
                if (nextTaskActionIndex <= (this._taskActionList.length - 1))
                {
                    if (this._intervalTaskAction == 0)
                    {
                        this._taskActionList[nextTaskActionIndex].execute();
                    }
                    else
                    {
                        id = setTimeout(function ():void
                        {
                            if (_IsStop)
                            {
                                return;
                            };
                            _taskActionList[nextTaskActionIndex].execute();
                            clearTimeout(id);
                        }, this._intervalTaskAction);
                    };
                };
            };
        }

        private function _taskCompleteLogic():void
        {
            this._isFinish = true;
            this._isStart = false;
            this._currentFinsihCount = 0;
            this._taskActionList = new Vector.<TaskAction>();
            dispatchEvent(new TaskEvent(TaskEvent.COMPLETE));
        }

        public function stop():void
        {
            this.stoplogicHandler(true);
        }

        private function stoplogicHandler($dispatch:Boolean):void
        {
            var action:TaskAction;
            this._IsStop = true;
            for each (action in this._taskActionList)
            {
                TaskAction(action).stop();
                action.removeEventListener(TaskActionEvent.COMPLETE, this._removeTaskActin);
            };
            this._taskActionList = new Vector.<TaskAction>();
            this._isFinish = false;
            this._isStart = false;
            this._currentFinsihCount = 0;
            if ($dispatch)
            {
                dispatchEvent(new TaskEvent(TaskEvent.STOP));
            };
        }

        public function removeAction(action:TaskAction):void
        {
            throw (new Error("taskAction  auto remove"));
        }

        public function clear():void
        {
            var i:int;
            while (i < this._taskActionList.length)
            {
                this._taskActionList[i].removeEventListener(TaskActionEvent.COMPLETE, this._removeTaskActin);
                i++;
            };
            this._isFinish = false;
            this._currentFinsihCount = 0;
            this._taskActionList.length = 0;
        }

        public function errorMessage(message:String):void
        {
            this.stoplogicHandler(false);
            this.errorMessageInfo = message;
            var error:TaskEvent = new TaskEvent(TaskEvent.ERROR);
            error.errorMessage = message;
            dispatchEvent(error);
        }

        public function finish():void
        {
            this._taskCompleteLogic();
        }


    }
}//package zebra.thread.task
