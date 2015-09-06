//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.events
{
    import flash.events.Event;
    import zebra.loaders.IAssetLoader;

    public class AssetLoaderEvent extends Event 
    {

        public static const PROGRESS:String = "progress";
        public static const COMPLETE:String = "complete";
        public static const Errors:String = "error";
        public static const CHILDCOMPLETE:String = "childcomplete";

        public var assetloader:IAssetLoader;

        public function AssetLoaderEvent(_arg_1:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(_arg_1, bubbles, cancelable);
        }

        override public function clone():Event
        {
            return (new AssetLoaderEvent(type, bubbles, cancelable));
        }

        override public function toString():String
        {
            return (formatToString("AssetLoaderEvent", "type", "bubbles", "cancelable", "eventPhase"));
        }


    }
}//package zebra.events
