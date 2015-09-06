//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.loaders
{
    import flash.net.URLRequest;

    public interface IAssetLoader 
    {

        function get param():Object;
        function set param(_arg_1:Object):void;
        function get request():URLRequest;
        function get loader():ILoader;
        function get type():String;
        function get state():int;
        function set state(_arg_1:int):void;
        function get content();
        function get key():String;
        function load(_arg_1:URLRequest):void;
        function dispose():void;

    }
}//package zebra.loaders
