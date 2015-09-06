//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.input
{
    import zebra.thread.task.TaskAction;
    import __AS3__.vec.Vector;
    import zebra.events.KeyInputEvent;
    import zebra.Game;
    import flash.utils.getTimer;
    import zebra.input.KeyInputData;
    import zebra.input.*;
    import __AS3__.vec.*;

    class KeyInputTaskAction extends TaskAction 
    {

        public var keysIntValue:Vector.<int>;
        private var _activeKeyGroupTime:int;

        public function KeyInputTaskAction()
        {
            this.keysIntValue = new Vector.<int>();
        }

        public function get activeKeyGroupTime():int
        {
            return (this._activeKeyGroupTime);
        }

        public function set activeKeyGroupTime(value:int):void
        {
            var createEvent:KeyInputEvent;
            if (this._activeKeyGroupTime == 0)
            {
                createEvent = new KeyInputEvent(KeyInputEvent.ACTIVEKEYGROUP);
                Game.keyInput.dispatchEvent(createEvent);
            };
            this._activeKeyGroupTime = value;
        }

        override public function execute():void
        {
            var releaseEvent:KeyInputEvent;
            super.execute();
            if (this._activeKeyGroupTime > 0)
            {
                if ((getTimer() - this._activeKeyGroupTime) > Game.keyInput.DestroyIntervalTime)
                {
                    releaseEvent = new KeyInputEvent(KeyInputEvent.RELEASEKEYGROUP);
                    releaseEvent.keyGroupData = this._createKeyInpuDataList(this.keysIntValue);
                    releaseEvent.keysIntValue = this.keysIntValue;
                    Game.keyInput.dispatchEvent(releaseEvent);
                    this._activeKeyGroupTime = 0;
                    this.keysIntValue = new Vector.<int>();
                };
            };
        }

        private function _createKeyInpuDataList(keys:Vector.<int>):Vector.<KeyInputData>
        {
            var preveKeyCode:int;
            var currentKeyCode:int;
            var keycode:int;
            var node:KeyInputData;
            var keydata:Vector.<KeyInputData> = new Vector.<KeyInputData>();
            for each (keycode in keys)
            {
                node = new KeyInputData();
                if (currentKeyCode == 0)
                {
                    currentKeyCode = keycode;
                    node.keyCode = currentKeyCode;
                    node.keepDownCount = 1;
                    keydata.push(node);
                };
                if (currentKeyCode != 0)
                {
                    preveKeyCode = currentKeyCode;
                    currentKeyCode = keycode;
                    if (preveKeyCode == currentKeyCode)
                    {
                        keydata[(keydata.length - 1)].keepDownCount++;
                    }
                    else
                    {
                        node.keyCode = currentKeyCode;
                        node.keepDownCount = 1;
                        keydata.push(node);
                    };
                };
            };
            return (keydata);
        }


    }
}//package zebra.input
