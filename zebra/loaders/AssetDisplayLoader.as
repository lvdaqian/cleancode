//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import flash.display.Loader;
    import zebra.content.GameAsset;
    import flash.net.URLRequest;
    import flash.display.LoaderInfo;

    public class AssetDisplayLoader extends AssetBaseLoader 
    {

        private var _contentLoader:Loader;

        public function AssetDisplayLoader(loaderEntity:ILoader)
        {
            super(loaderEntity);
            this._contentLoader = new Loader();
        }

        override public function load(request:URLRequest):void
        {
            super.load(request);
            this._contentLoader.load(request, GameAsset.defaultContext);
        }

        override public function get content()
        {
            return (this._contentLoader.content);
        }

        public function get contentLoaderInfo():LoaderInfo
        {
            return (this._contentLoader.contentLoaderInfo);
        }

        override public function dispose():void
        {
            super.dispose();
            this._contentLoader.unloadAndStop();
        }

        override public function get type():String
        {
            return (AssetType.DISPLAYOBJECT);
        }


    }
}//package zebra.loaders
