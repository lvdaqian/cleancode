//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.Event;
    import flash.net.URLRequest;
    import zebra.Game;
    import zebra.events.AssetLoaderEvent;
    import zebra.directEvent.DirectEventManager;
    import zebra.content.GameAsset;
    import zebra.debug.Debug;

    [Event(name="progress", type="zebra.events.AssetLoaderEvent")]
    [Event(name="error", type="zebra.events.AssetLoaderEvent")]
    [Event(name="complete", type="zebra.events.AssetLoaderEvent")]
    public class AssetLoader extends EventDispatcher implements ILoader 
    {

        public var progress:Number;
        private var _loader:AssetBaseLoader;
        private var _type:String;
        private var _cache:Boolean;
        private var _url:String;
        private var _content;

        public function AssetLoader(_arg_1:String, cache:Boolean)
        {
            this.progress = 0;
            this._type = _arg_1;
            this._cache = cache;
            switch (this._type)
            {
                case AssetType.DISPLAYOBJECT:
                    this._loader = new AssetDisplayLoader(this);
                    AssetDisplayLoader(this._loader).contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                    AssetDisplayLoader(this._loader).contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
                    AssetDisplayLoader(this._loader).contentLoaderInfo.addEventListener(Event.COMPLETE, this.completeHandler);
                    break;
                case AssetType.TEXT:
                    this._loader = new AssetTextLoader(this);
                    AssetTextLoader(this._loader).contentLoader.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                    AssetTextLoader(this._loader).contentLoader.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
                    AssetTextLoader(this._loader).contentLoader.addEventListener(Event.COMPLETE, this.completeHandler);
                    break;
            };
            this._loader.state = AssetLoaderState.READY;
        }

        private function matchAssetType(url:String):String
        {
            var _local_2:String = "";
            if (url.indexOf(".xml") != -1)
            {
                _local_2 = AssetType.TEXT;
            };
            if (url.indexOf(".swf") != -1)
            {
                _local_2 = AssetType.DISPLAYOBJECT;
            };
            if (url.indexOf(".jpg") != -1)
            {
                _local_2 = AssetType.DISPLAYOBJECT;
            };
            if (url.indexOf(".png") != -1)
            {
                _local_2 = AssetType.DISPLAYOBJECT;
            };
            if (url.indexOf(".gif") != -1)
            {
                _local_2 = AssetType.DISPLAYOBJECT;
            };
            if (_local_2 == "")
            {
                _local_2 = AssetType.TEXT;
            };
            return (_local_2);
        }

        public function load(urlOrRequest:*, param:Object=null):void
        {
            var _request:URLRequest;
            if ((urlOrRequest is URLRequest))
            {
                _request = urlOrRequest;
            }
            else
            {
                _request = new URLRequest(urlOrRequest);
            };
            this._url = _request.url;
            this._loader.param = param;
            this._loader.load(_request);
            if (this._cache)
            {
                Game.Content.addAssetLoader(_request.url, this._loader);
            };
        }

        private function progressHandler(e:ProgressEvent):void
        {
            this._loader.state = AssetLoaderState.LOADING;
            this.progress = (e.bytesLoaded / e.bytesTotal);
            dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.PROGRESS));
        }

        public function completeHandler(e:Event):void
        {
            var i:int;
            this.progress = 1;
            this._loader.state = AssetLoaderState.COMPLETED;
            var receiveArray:Array = DirectEventManager(Game.DirectEvent).getReceiveData(GameAsset.channel);
            if (receiveArray != null)
            {
                i = 0;
                while (i < receiveArray[0].length)
                {
                    if (receiveArray[0][i] == this._loader.request.url)
                    {
                        if ((receiveArray[1][i] is AssetLoaderAction))
                        {
                            AssetLoaderAction(receiveArray[1][i]).assetloader = this._loader;
                        };
                    };
                    i++;
                };
            };
            Game.DirectEvent.send(this._loader.request.url, this._loader, GameAsset.channel);
            var event:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.COMPLETE);
            event.assetloader = this._loader;
            dispatchEvent(event);
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            var event:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.Errors);
            dispatchEvent(event);
            Debug.output(("[加载错误]:" + this._loader.request.url), 1, "0xFFFF00", "0x9F0050");
            this.unload();
        }

        public function get type():String
        {
            return (this._type);
        }

        private function unload():void
        {
            if (this._loader)
            {
                switch (this._type)
                {
                    case AssetType.DISPLAYOBJECT:
                        AssetDisplayLoader(this._loader).contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                        AssetDisplayLoader(this._loader).contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.progressHandler);
                        AssetDisplayLoader(this._loader).contentLoaderInfo.removeEventListener(Event.COMPLETE, this.completeHandler);
                        break;
                    case AssetType.TEXT:
                        AssetTextLoader(this._loader).contentLoader.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                        AssetTextLoader(this._loader).contentLoader.removeEventListener(ProgressEvent.PROGRESS, this.progressHandler);
                        AssetTextLoader(this._loader).contentLoader.removeEventListener(Event.COMPLETE, this.completeHandler);
                        break;
                };
            };
        }

        public function dispose():void
        {
            this._loader.state = AssetLoaderState.DISPOSED;
            this.unload();
        }


    }
}//package zebra.loaders
