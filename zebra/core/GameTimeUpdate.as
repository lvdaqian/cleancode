//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.core
{
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import flash.events.Event;
    import zebra.Game;
    import zebra.thread.task.TaskAction;
    import __AS3__.vec.*;

    public class GameTimeUpdate 
    {

        private var _timeNodeList:Vector.<GameTimeNode>;

        public function GameTimeUpdate()
        {
            this._timeNodeList = new Vector.<GameTimeNode>();
        }

        private function _updateLogic(e:Event):void
        {
            var node:GameTimeNode;
            var i:int;
            while (i < this._timeNodeList.length)
            {
                node = this._timeNodeList[i];
                node.currentTime = getTimer();
                if ((node.currentTime - node.startTime) >= node.intervalTime)
                {
                    node.taskAction.execute();
                    node.startTime = node.currentTime;
                    if (node.autoremove)
                    {
                        this.removeTaskAction(node.taskAction);
                    };
                };
                i++;
            };
        }

        public function removeAllTask():void
        {
            this._timeNodeList = new Vector.<GameTimeNode>();
        }

        public function addTaskAction(taskAction:TaskAction, intervalTime:uint=0):void
        {
            if (intervalTime == 0)
            {
                intervalTime = (1000 / Game.graphicsDeviceManager.fps);
            };
            this._addTaskActionLogic(taskAction, intervalTime, false);
        }

        public function addOnceTaskAction(taskAction:TaskAction, intervalTime:uint=0):void
        {
            if (intervalTime == 0)
            {
                intervalTime = (1000 / Game.graphicsDeviceManager.fps);
            };
            this._addTaskActionLogic(taskAction, intervalTime, true);
        }

        private function _addTaskActionLogic(taskAction:TaskAction, intervalTime:uint, autoremove:Boolean):void
        {
            var node:GameTimeNode;
            if (!(this.hasTaskAction(taskAction)))
            {
                node = new GameTimeNode();
                node.startTime = getTimer();
                node.currentTime = node.startTime;
                node.intervalTime = intervalTime;
                node.taskAction = taskAction;
                node.autoremove = autoremove;
                this._timeNodeList.push(node);
                if (this._timeNodeList.length == 1)
                {
                    Game.graphicsDeviceManager.stage.addEventListener(Event.ENTER_FRAME, this._updateLogic);
                };
            };
        }

        public function hasTaskAction(taskAction:TaskAction):Boolean
        {
            var item:GameTimeNode;
            for each (item in this._timeNodeList)
            {
                if (item.taskAction == taskAction)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function removeTaskAction(taskAction:TaskAction):void
        {
            var i:int = (this._timeNodeList.length - 1);
            while (i >= 0)
            {
                if (this._timeNodeList[i].taskAction == taskAction)
                {
                    taskAction.dispose();
                    this._timeNodeList.splice(i, 1);
                    if (this._timeNodeList.length == 0)
                    {
                        Game.graphicsDeviceManager.stage.removeEventListener(Event.ENTER_FRAME, this._updateLogic);
                    };
                };
                i--;
            };
        }


    }
}//package zebra.core

import zebra.thread.task.TaskAction;

class GameTimeNode 
{

    /*private*/ var startTime:uint;
    /*private*/ var currentTime:uint;
    /*private*/ var intervalTime:uint;
    /*private*/ var taskAction:TaskAction;
    /*private*/ var autoremove:Boolean;


}
