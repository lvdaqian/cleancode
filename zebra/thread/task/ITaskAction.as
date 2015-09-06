//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.thread.task
{
    public interface ITaskAction 
    {

        function get IsStart():Boolean;
        function get IsFinish():Boolean;
        function set id(_arg_1:String):void;
        function get id():String;
        function execute():void;
        function finish():void;
        function dispose():void;
        function stop():void;

    }
}//package zebra.thread.task
