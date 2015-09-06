//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.directEvent
{
    public interface IDirectEventManager 
    {

        function receive(_arg_1:String, _arg_2:*, _arg_3:String="Global"):void;
        function send(_arg_1:String, _arg_2:DirectEventParameter=null, _arg_3:String="Global"):void;
        function destroy(_arg_1:String, _arg_2:*, _arg_3:String="Global"):void;

    }
}//package zebra.directEvent
