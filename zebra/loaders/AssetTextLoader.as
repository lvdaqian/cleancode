//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class AssetTextLoader extends AssetBaseLoader 
    {

        private var _contentLoader:URLLoader;

        public function AssetTextLoader(loaderEntity:ILoader)
        {
            super(loaderEntity);
            this._contentLoader = new URLLoader();
        }

        override public function load(request:URLRequest):void
        {
            super.load(request);
            this._contentLoader.load(request);
        }

        override public function get type():String
        {
            return (AssetType.TEXT);
        }

        override public function dispose():void
        {
            super.dispose();
            try
            {
                this._contentLoader.close();
            }
            catch(error)
            {
            };
        }

        public function get contentLoader():URLLoader
        {
            return (this._contentLoader);
        }

        override public function get content()
        {
            return (this._contentLoader.data);
        }


    }
}//package zebra.loaders
