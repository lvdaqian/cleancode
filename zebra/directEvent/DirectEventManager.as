//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    import __AS3__.vec.Vector;
    import zebra.Game;
    import zebra.events.TaskActionEvent;

    public class DirectEventManager implements IDirectEventManager 
    {

        private var _listenerData:DirectEventListenerPool;
        private var _destroyData:DirectEventDestroyPool;
        private var _directScope:DirectEventScope;

        public function DirectEventManager()
        {
            this._directScope = new DirectEventScope();
            this._listenerData = new DirectEventListenerPool(this._directScope);
            this._destroyData = new DirectEventDestroyPool(this._directScope, this._listenerData);
        }

        public function receive(eventName:String, action:*, scope:String="Global"):void
        {
            this._directScope.add(scope);
            this._listenerData.add(eventName, action, scope);
        }

        public function getReceiveData(scope:String="Global"):Array
        {
            var eventKey:Vector.<String> = this._listenerData.getRegisterEventName(scope);
            if (eventKey == null)
            {
                return (null);
            };
            var eventAction:Array = this._listenerData.getRegisterEventAction(scope);
            return ([eventKey, eventAction]);
        }

        public function send(eventName:String, eventData:DirectEventParameter=null, scope:String="Global"):void
        {
            var _sendAction:DirectEventSendAction;
            if (eventData == null)
            {
                eventData = new DirectEventParameter();
            };
            if (this._directScope.getScope(scope) == null)
            {
                return;
            };
            if (this._listenerData.hasEventName(eventName, scope))
            {
                if (Game.IsDebugMode)
                {
                    trace((("[DirectEvent SEND: " + eventName) + " Succeed]"));
                };
                _sendAction = new DirectEventSendAction(this._listenerData, eventName, eventData, scope);
                _sendAction.addEventListener(TaskActionEvent.COMPLETE, this._destroyEventLogic);
                _sendAction.execute();
            }
            else
            {
                if (Game.IsDebugMode)
                {
                    trace((("[DirectEvent SEND: " + eventName) + " Not Register]"));
                };
            };
        }

        public function destroy(eventName:String, action:*, scope:String="Global"):void
        {
            if (this._directScope.getScope(scope) == null)
            {
                return;
            };
            if (this._listenerData.hasEvent(eventName, action, scope))
            {
                this._destroyData.add(eventName, action, scope);
            };
        }

        private function _destroyEventLogic(e:TaskActionEvent):void
        {
            var senderAction:DirectEventSendAction = DirectEventSendAction(e.target);
            this._destroyData.remove(senderAction.scope);
            senderAction.removeEventListener(TaskActionEvent.COMPLETE, this._destroyEventLogic);
        }


    }
}//package zebra.directEvent
