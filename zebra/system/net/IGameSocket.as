//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.net
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import zebra.system.collections.FlashBytesReader;
    import flash.utils.ByteArray;

    [Event(name="connectSuccess", type="zebra.events.GameSocketEvent")]
    [Event(name="close", type="zebra.events.GameSocketEvent")]
    [Event(name="ioerror", type="zebra.events.GameSocketEvent")]
    [Event(name="securityerror", type="zebra.events.GameSocketEvent")]
    public interface IGameSocket extends IEventDispatcher 
    {

        function connect(_arg_1:String, _arg_2:int):void;
        function get bufferList():Vector.<FlashBytesReader>;
        function send(_arg_1:ByteArray):void;

    }
}//package zebra.system.net
