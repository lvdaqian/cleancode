//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    import flash.utils.Dictionary;

    public class DirectEventScope 
    {

        private var _scopepool:Dictionary;

        public function DirectEventScope()
        {
            this._scopepool = new Dictionary();
        }

        public function add(scope:String):void
        {
            if (this._scopepool[scope] == null)
            {
                this._scopepool[scope] = new DirectEventScopePool();
            };
        }

        public function hasScope(scope:String):Boolean
        {
            return (!((this._scopepool[scope] == null)));
        }

        public function getScope(scope:String):DirectEventScopePool
        {
            return (DirectEventScopePool(this._scopepool[scope]));
        }

        public function remove(scope:String):void
        {
            delete this._scopepool[scope];
        }


    }
}//package zebra.directEvent

import __AS3__.vec.Vector;
import __AS3__.vec.*;

class DirectEventScopePool 
{

    /*private*/ var _listenerPool:DirectEventScopeModel;
    /*private*/ var _destroyPool:DirectEventScopeModel;

    public function DirectEventScopePool()
    {
        this._listenerPool = new DirectEventScopeModel();
        this._destroyPool = new DirectEventScopeModel();
    }

    public function get listenerPool():DirectEventScopeModel
    {
        return (this._listenerPool);
    }

    public function get destroyPool():DirectEventScopeModel
    {
        return (this._destroyPool);
    }


}
class DirectEventScopeModel 
{

    /*private*/ var _eventName:Vector.<String>;
    /*private*/ var _eventAction:Array;

    public function DirectEventScopeModel()
    {
        this._eventName = new Vector.<String>();
        this._eventAction = new Array();
    }

    public function get EventName():Vector.<String>
    {
        return (this._eventName);
    }

    public function get EventAction():Array
    {
        return (this._eventAction);
    }


}
