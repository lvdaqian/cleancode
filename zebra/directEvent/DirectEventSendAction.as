//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    import zebra.thread.task.TaskAction;
    import zebra.directEvent.DirectEventParameter;
    import zebra.directEvent.DirectEventAction;
    import zebra.Game;
    import zebra.directEvent.*;

    class DirectEventSendAction extends TaskAction 
    {

        private var _listenerData:DirectEventListenerPool;
        private var _eventName:String;
        private var _eventData:DirectEventParameter;
        private var _scope:String;

        public function DirectEventSendAction(listenerData:DirectEventListenerPool, eventName:String, eventData:DirectEventParameter, scope:String)
        {
            this._listenerData = listenerData;
            this._eventName = eventName;
            this._scope = scope;
            eventData.eventName = eventName;
            eventData.scope = scope;
            this._eventData = eventData;
            super();
        }

        override public function execute():void
        {
            var _local_2:String;
            super.execute();
            var len:int = this._listenerData.getCount(this._scope);
            var i:int;
            while (i < len)
            {
                try
                {
                    if (this._listenerData.getRegisterEventName(this._scope)[i] == this._eventName)
                    {
                        if ((this._listenerData.getRegisterEventAction(this._scope)[i] is Function))
                        {
                            _local_2 = "Function";
                            var _local_4 = this._listenerData.getRegisterEventAction(this._scope);
                            (_local_4[i](this._eventData));
                        };
                        if ((this._listenerData.getRegisterEventAction(this._scope)[i] is DirectEventAction))
                        {
                            _local_2 = "DirectEventAction";
                            DirectEventAction(this._listenerData.getRegisterEventAction(this._scope)[i]).eventParameter = this._eventData;
                            DirectEventAction(this._listenerData.getRegisterEventAction(this._scope)[i]).execute();
                        };
                        if (Game.IsDebugMode)
                        {
                            trace((((("[DirectEvent recevie: " + _local_2) + " ") + this._eventName) + "]"));
                        };
                    };
                }
                catch(e)
                {
                };
                i++;
            };
            this.finish();
        }

        public function get eventName():String
        {
            return (this._eventName);
        }

        public function get eventData():DirectEventParameter
        {
            return (this._eventData);
        }

        public function get scope():String
        {
            return (this._scope);
        }

        public function set scope(value:String):void
        {
            this._scope = value;
        }


    }
}//package zebra.directEvent
