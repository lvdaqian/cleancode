//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    import zebra.directEvent.DirectEventScope;
    import __AS3__.vec.Vector;
    import zebra.directEvent.*;
    import __AS3__.vec.*;

    class DirectEventDestroyPool 
    {

        private var _listenerEventPool:DirectEventListenerPool;
        private var _directScope:DirectEventScope;

        public function DirectEventDestroyPool(directScope:DirectEventScope, listenerEventPool:DirectEventListenerPool)
        {
            this._directScope = directScope;
            this._listenerEventPool = listenerEventPool;
        }

        public function getDestroyEventAction(scope:String):Array
        {
            return (this._directScope.getScope(scope).destroyPool.EventAction);
        }

        public function getDestroyEventName(scope:String):Vector.<String>
        {
            return (this._directScope.getScope(scope).destroyPool.EventName);
        }

        public function add(eventName:String, action:*, scope:String):void
        {
            if (!(this.hasEvent(eventName, action, scope)))
            {
                this.getDestroyEventName(scope).push(eventName);
                this.getDestroyEventAction(scope).push(action);
            };
        }

        public function hasEvent(eventName:String, action:*, scope:String):Boolean
        {
            var destroyEventAction:Array = this.getDestroyEventAction(scope);
            var destroyEventName:Vector.<String> = this.getDestroyEventName(scope);
            var index:int = destroyEventAction.indexOf(action);
            if (index == -1)
            {
                return (false);
            };
            if (((!((index == -1))) && (!((destroyEventName[index] == eventName)))))
            {
                return (false);
            };
            return (true);
        }

        public function remove(scope:String):void
        {
            var currentEventName:String;
            var currentEventAction:*;
            var registerEventName:Vector.<String>;
            var registerEventAction:Array;
            var i:int;
            var destroyEventAction:Array = this.getDestroyEventAction(scope);
            var destroyEventName:Vector.<String> = this.getDestroyEventName(scope);
            var destroyLen:int = (destroyEventName.length - 1);
            var j:int = destroyLen;
            while (j >= 0)
            {
                currentEventName = destroyEventName[j];
                currentEventAction = destroyEventAction[j];
                i = (this._listenerEventPool.getCount(scope) - 1);
                while (i >= 0)
                {
                    if ((((currentEventName == this._listenerEventPool.getRegisterEventName(scope)[i])) && ((currentEventAction == this._listenerEventPool.getRegisterEventAction(scope)[i]))))
                    {
                        this._listenerEventPool.remove(currentEventName, currentEventAction, scope);
                        this._destroypoolRemoveLgoic(currentEventName, currentEventAction, scope);
                    };
                    i--;
                };
                j--;
            };
        }

        private function _destroypoolRemoveLgoic(eventName:String, action:*, scope:String):void
        {
            var targetIndex:int;
            var destroyEventAction:Array = this.getDestroyEventAction(scope);
            var destroyEventName:Vector.<String> = this.getDestroyEventName(scope);
            var index:Vector.<int> = new Vector.<int>();
            var i:int;
            while (i < destroyEventName.length)
            {
                if ((((destroyEventName[i] == eventName)) && ((destroyEventAction[i] == action))))
                {
                    index.push(i);
                };
                i++;
            };
            index.reverse();
            var len:int = (index.length - 1);
            var j:int = len;
            while (j >= 0)
            {
                targetIndex = index[j];
                destroyEventName.splice(targetIndex, 1);
                destroyEventAction.splice(targetIndex, 1);
                j--;
            };
        }


    }
}//package zebra.directEvent
