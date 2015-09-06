//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import flash.system.LoaderContext;
    import zebra.Game;
    import zebra.loaders.AssetLoader;
    import zebra.loaders.IAssetLoader;
    import zebra.loaders.AssetType;

    public class GameAsset 
    {

        public static const channel:String = "GameAssetChannel";
        private static var _defaultContext:LoaderContext;


        public static function get defaultContext():LoaderContext
        {
            if (_defaultContext == null)
            {
                _defaultContext = new LoaderContext(false, Game.currentApplicationDomain);
            };
            return (_defaultContext);
        }

        public static function receive(url:String, action:*):void
        {
            Game.DirectEvent.receive(url, action, channel);
        }

        public static function destroy(url:String, action:*):void
        {
            Game.DirectEvent.destroy(url, action, channel);
        }

        public static function load(url:String, assetType:String="auto", cache:Boolean=false, param:Object=null):void
        {
            var asset:AssetLoader;
            var assetloader:IAssetLoader;
            if (assetType == "auto")
            {
                assetType = matchAssetType(url);
            };
            trace("load img 2");
            if (!(cache))
            {
                asset = new AssetLoader(assetType, cache);
                asset.load(url, param);
                trace("load img 3");
            }
            else
            {
                assetloader = Game.Content.getAssetLoader(url);
                if (assetloader != null)
                {
                    new GameAssetLoadLogic(assetloader);
                }
                else
                {
                    trace("load skin 0");
                    asset = new AssetLoader(assetType, cache);
                    asset.load(url, param);
                    trace("load img 4");
                };
            };
        }

        private static function matchAssetType(url:String):String
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


    }
}//package zebra.content
