//Created by Action Script Viewer - http://www.buraks.com/asv
package control
{
    import zebra.system.net.GameSocketThread;
    import model.LogApplication;
    import zebra.Game;
    import view.LogWinPart;
    import flash.utils.setTimeout;
    import model.ServerModel;

    public class SocketControl 
    {

        private var _model;
        private var _tagName:String;
        public var socket:GameSocketThread;
        public var logappliction:LogApplication;
        public var successHandler:Function;
        public var closeHandler:Function;
        public var ioErrorHandler:Function;
        public var securityErrorHandler:Function;

        public function SocketControl(tagName:String, model:*)
        {
            this.logappliction = new LogApplication();
            super();
            this._tagName = tagName;
            this._model = model;
            Game.Content.removeObject("socketControl");
            Game.Content.addObject("socketControl", this);
            this.createSocket();
        }

        private function createSocket():void
        {
            var ip2:String;
            var port2:String;
            var now:Date;
            var timestamp:String;
            var ip1:String;
            var port1:String;
            this.socket = new GameSocketThread();
            if (this._model.ip == null)
            {
                this.socket.connect(this._model.bootIP, this._model.port);
                ip2 = this._model.bootIP;
                port2 = this._model.port;
                now = new Date();
                timestamp = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
                LogWinPart(Game.Content.getView(LogWinPart)).info((((((((((timestamp + ",") + "建立socket连接") + ",") + "socket") + ",") + "IP:") + ip2) + "port:") + port2));
            }
            else
            {
                this.socket.connect(this._model.ip, this._model.port);
                ip1 = this._model.ip;
                port1 = this._model.port;
                trace("socket连接，step2建立连接");
                now = new Date();
                timestamp = ((((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds())) + ".") + String(now.getMilliseconds()));
                LogWinPart(Game.Content.getView(LogWinPart)).info((((((((((timestamp + ",") + "建立socket连接") + ",") + "socket") + ",") + "IP:") + ip1) + "port:") + port1));
            };
            this.socket.connectHandler = this._connectHandler;
            this.socket.closeHandler = this._closeHandler;
            this.socket.ioErrorHandler = this._ioErrorHandler;
            this.socket.securityErrorHandler = this._securityErrorHandler;
        }

        public function reconnect(_model:ServerModel, timer:int=1000):void
        {
            trace("reconnect step 3");
            setTimeout(function ()
            {
                _model.changeIP();
                trace(_tagName, _model.ip, _model.port);
                socket.connect(_model.ip, _model.port);
                var ip:String = _model.ip;
                var port:String = String(_model.port);
                logappliction.WriteLogWithIpAndPort("投标板块", "断线重连", ip, port);
            }, timer);
        }

        private function _securityErrorHandler(socket:GameSocketThread):void
        {
            if (this.securityErrorHandler != null)
            {
                this.securityErrorHandler();
            };
        }

        private function _ioErrorHandler(socket:GameSocketThread):void
        {
            if (this.ioErrorHandler != null)
            {
                this.ioErrorHandler();
            };
        }

        private function _closeHandler(socket:GameSocketThread):void
        {
            trace((this._tagName + "->断开联机"));
            if (this.closeHandler != null)
            {
                this.closeHandler();
            };
        }

        private function _connectHandler(socket:GameSocketThread):void
        {
            trace((this._tagName + "->联机成功"));
            if (this.successHandler != null)
            {
                this.successHandler();
            };
        }

        public function close():void
        {
            this.socket.close();
        }


    }
}//package control
