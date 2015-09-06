//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    import zebra.directEvent.DirectEventScope;
    import __AS3__.vec.Vector;
    import zebra.directEvent.*;
    import __AS3__.vec.*;

    class DirectEventListenerPool 
    {

        private var _directScope:DirectEventScope;

        public function DirectEventListenerPool(directScope:DirectEventScope)
        {
            this._directScope = directScope;
        }

        public function getRegisterEventName(scope:String):Vector.<String>
        {
            if (this._directScope.getScope(scope) == null)
            {
                return (null);
            };
            return (this._directScope.getScope(scope).listenerPool.EventName);
        }

        public function getRegisterEventAction(scope:String):Array
        {
            if (this._directScope.getScope(scope) == null)
            {
                return (null);
            };
            return (this._directScope.getScope(scope).listenerPool.EventAction);
        }

        public function getCount(scope:String):int
        {
            return (this._directScope.getScope(scope).listenerPool.EventName.length);
        }

        public function add(eventName:String, action:*, scope:String):void
        {
            if (!(this.hasEvent(eventName, action, scope)))
            {
                this.getRegisterEventName(scope).push(eventName);
                this.getRegisterEventAction(scope).push(action);
            };
        }

        public function hasEventName(eventName:String, scope:String):Boolean
        {
            return (!((this.getRegisterEventName(scope).indexOf(eventName) == -1)));
        }

        public function hasEvent(eventName:String, action:*, scope:String):Boolean
        {
            var registerEventAction:Array = this.getRegisterEventAction(scope);
            var registerEventName:Vector.<String> = this.getRegisterEventName(scope);
            var index:int = registerEventAction.indexOf(action);
            if (index == -1)
            {
                return (false);
            };
            if (((!((index == -1))) && (!((registerEventName[index] == eventName)))))
            {
                return (false);
            };
            return (true);
        }

        public function remove(eventName:String, action:*, scope:String):void
        {
            var targetIndex:int;
            var registerEventAction:Array = this.getRegisterEventAction(scope);
            var registerEventName:Vector.<String> = this.getRegisterEventName(scope);
            var index:Vector.<int> = new Vector.<int>();
            var i:int;
            while (i < registerEventName.length)
            {
                if ((((registerEventName[i] == eventName)) && ((registerEventAction[i] == action))))
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
                registerEventName.splice(targetIndex, 1);
                registerEventAction.splice(targetIndex, 1);
                j--;
            };
        }


    }
}//package zebra.directEvent
