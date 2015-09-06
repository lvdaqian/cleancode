//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics.animation
{
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;

    public interface IAnimation 
    {

        function play(_arg_1:String=""):void;
        function pause():void;
        function stop():void;
        function set fps(_arg_1:int):void;
        function get fps():int;
        function get align():String;
        function set align(_arg_1:String):void;
        function get BitmapDataSource():Vector.<BitmapData>;
        function set BitmapDataSource(_arg_1:Vector.<BitmapData>):void;
        function get totalframes():int;
        function get currentFrame():int;
        function set currentFrame(_arg_1:int):void;
        function dispose():void;
        function get IsHitMouse():Boolean;

    }
}//package zebra.graphics.animation
