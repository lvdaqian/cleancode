//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import zebra.directEvent.DirectEventParameter;
    import flash.net.URLRequest;

    public class AssetBaseLoader extends DirectEventParameter implements IAssetLoader 
    {

        private var _param:Object;
        private var _state:int;
        private var _request:URLRequest;
        private var _loaderEntity:ILoader;

        public function AssetBaseLoader(loaderEntity:ILoader)
        {
            this._loaderEntity = loaderEntity;
        }

        public function get request():URLRequest
        {
            return (this._request);
        }

        public function get loader():ILoader
        {
            return (this._loaderEntity);
        }

        public function get type():String
        {
            return ("");
        }

        public function load(request:URLRequest):void
        {
            this._request = request;
        }

        public function dispose():void
        {
        }

        public function get content()
        {
            return (null);
        }

        public function get param():Object
        {
            return (this._param);
        }

        public function set param(value:Object):void
        {
            this._param = value;
        }

        public function get state():int
        {
            return (this._state);
        }

        public function set state(value:int):void
        {
            this._state = value;
        }

        public function get key():String
        {
            return (this._request.url);
        }


    }
}//package zebra.loaders
