//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import flash.events.IEventDispatcher;
    import flash.events.Event;

    [Event(name="progress", type="zebra.events.AssetLoaderEvent")]
    [Event(name="error", type="zebra.events.AssetLoaderEvent")]
    [Event(name="complete", type="zebra.events.AssetLoaderEvent")]
    public interface ILoader extends IEventDispatcher 
    {

        function completeHandler(_arg_1:Event):void;
        function load(_arg_1:*, _arg_2:Object=null):void;
        function dispose():void;

    }
}//package zebra.loaders
