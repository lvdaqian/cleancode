//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.input
{
    import flash.events.EventDispatcher;
    import zebra.Game;
    import flash.events.KeyboardEvent;
    import flash.utils.getTimer;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    [Event(name="activeKeyGroup", type="zebra.events.KeyInputEvent")]
    [Event(name="releaseKeyGroup", type="zebra.events.KeyInputEvent")]
    public class KeyInput extends EventDispatcher 
    {

        public var DestroyIntervalTime:int = 380;
        private var _keyInputTaskAction:KeyInputTaskAction;

        public function KeyInput()
        {
            this._keyInputTaskAction = new KeyInputTaskAction();
            Game.TimeUpdate.addTaskAction(this._keyInputTaskAction);
            Game.graphicsDeviceManager.stage.addEventListener(KeyboardEvent.KEY_DOWN, this._keydownLogic);
        }

        private function _keydownLogic(e:KeyboardEvent):void
        {
            this._keyInputTaskAction.activeKeyGroupTime = getTimer();
            this._keyInputTaskAction.keysIntValue.push(e.keyCode);
        }

        private function _toKeyGroupData(data:*):Vector.<KeyInputData>
        {
            var arrayCode:Array;
            var i:int;
            var currentkeydata:Array;
            var keyinputdata:KeyInputData;
            var keygroupData:Vector.<KeyInputData> = new Vector.<KeyInputData>();
            if ((data is String))
            {
                arrayCode = String(data).split(",");
                i = 0;
                while (i < arrayCode.length)
                {
                    currentkeydata = String(arrayCode[i]).split("_");
                    if (currentkeydata.length == 1)
                    {
                        currentkeydata.push(1);
                    };
                    keyinputdata = new KeyInputData();
                    keyinputdata.keyCode = currentkeydata[0];
                    keyinputdata.keepDownCount = currentkeydata[1];
                    keygroupData.push(keyinputdata);
                    i++;
                };
            };
            return (keygroupData);
        }

        public function matchKeyGroupData(listenKeyGroupData:Vector.<KeyInputData>, matchData:*):Boolean
        {
            var data:Vector.<KeyInputData>;
            if ((matchData is String))
            {
                data = this._toKeyGroupData(matchData);
            }
            else
            {
                data = matchData;
            };
            if (listenKeyGroupData.length != data.length)
            {
                return (false);
            };
            var i:int;
            while (i < listenKeyGroupData.length)
            {
                if (((!((listenKeyGroupData[i].keyCode == data[i].keyCode))) || ((listenKeyGroupData[i].keepDownCount < data[i].keepDownCount))))
                {
                    return (false);
                };
                i++;
            };
            return (true);
        }


    }
}//package zebra.input
