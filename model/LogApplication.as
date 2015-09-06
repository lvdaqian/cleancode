//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import view.LogWinPart;
    import zebra.Game;

    public class LogApplication 
    {


        public function WriteLog1(logstr:String, _arg_2:String, requestid:String):void
        {
            var now:Date = new Date();
            var timestamp:String = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info(((((((timestamp + ",") + logstr) + ",") + _arg_2) + ",requestid=") + requestid));
        }

        public function WriteLog2(logstr:String, _arg_2:String, explain:String):void
        {
            var now:Date = new Date();
            var timestamp:String = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info(((((((timestamp + ",") + logstr) + ",") + _arg_2) + ",") + explain));
        }

        public function WriteLogWithWarn(logstr:String, _arg_2:String, warn:String):void
        {
            var now:Date = new Date();
            var timestamp:String = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info(((((((timestamp + ",") + logstr) + ",") + _arg_2) + ",") + warn));
        }

        public function WriteLogWithIpAndPort(logstr:String, _arg_2:String, ip:String, port:String):void
        {
            var now:Date = new Date();
            var timestamp:String = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info(((((((((timestamp + ",") + logstr) + ",") + _arg_2) + ",ip=") + ip) + ":") + port));
        }

        public function WriteLogWithURL(logstr:String, _arg_2:String, url:String):void
        {
            var now:Date = new Date();
            var timestamp:String = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info((((((((timestamp + ",") + logstr) + ",") + _arg_2) + ",") + "url:") + url));
        }


    }
}//package model
