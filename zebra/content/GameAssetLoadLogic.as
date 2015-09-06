//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import zebra.loaders.IAssetLoader;
    import zebra.loaders.AssetLoaderState;
    import zebra.events.AssetLoaderEvent;

    class GameAssetLoadLogic 
    {

        private var _assetloader:IAssetLoader;

        public function GameAssetLoadLogic(assetloader:IAssetLoader)
        {
            this._assetloader = assetloader;
            if (this._assetloader.state == AssetLoaderState.COMPLETED)
            {
                this._assetloader.loader.completeHandler(null);
            };
            if ((((this._assetloader.state == AssetLoaderState.READY)) || ((this._assetloader.state == AssetLoaderState.LOADING))))
            {
                this._assetloader.loader.addEventListener(AssetLoaderEvent.COMPLETE, this.completeHandler);
            };
        }

        private function completeHandler(e:AssetLoaderEvent):void
        {
            this._assetloader.loader.removeEventListener(AssetLoaderEvent.COMPLETE, this.completeHandler);
            this._assetloader.loader.completeHandler(null);
        }


    }
}//package zebra.content
