//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.net
{
    import zebra.Game;
    import flash.utils.ByteArray;
    import zebra.directEvent.DirectEventParameter;
    import flash.utils.setTimeout;

    public class GameSocketThread 
    {

        public static var _uuid:int = 0;
        public static var serverType:uint;

        public var ConnectSuccess:String = "GameSocketThreadConnect_Success";
        public var Close:String = "GameSocketThread_Close";
        public var IOerror:String = "GameSocketThread_ioerror";
        public var Securityerror:String = "GameSocketThread_securityerror";
        private var _socketManager:GameSocketManager;
        public var firstConnectHandler:Function;
        private var _autoConnectionTime:uint = 3000;
        private var _isAutoConnection:Boolean;
        private var _channel:String = "GameSocketThread_channel";
        public var connectHandler:Function;
        public var ioErrorHandler:Function;
        public var securityErrorHandler:Function;
        public var closeHandler:Function;

        public function GameSocketThread()
        {
            _uuid++;
            this._channel = ("GameSocketThread_channel" + _uuid);
            this.ConnectSuccess = ("GameSocketThreadConnect_Success" + _uuid);
            this.Close = ("GameSocketThread_Close" + _uuid);
            this.IOerror = ("GameSocketThread_ioerror" + _uuid);
            this.Securityerror = ("GameSocketThread_securityerror" + _uuid);
            this._socketManager = new GameSocketManager(this);
            this._socketManager.connectHandler = this._connectHandler;
            this._socketManager.ioErrorHandler = this._ioErrorHandler;
            this._socketManager.securityErrorHandler = this._securityErrorHandler;
            this._socketManager.closeHandler = this._closeHandler;
        }

        public function setSendBytesByConnect(sendBytesByConnect:Function):void
        {
            this._socketManager.sendBytesByConnect = sendBytesByConnect;
        }

        public function receive(command:String, action:*):void
        {
            Game.DirectEvent.receive(command, action, this._channel);
        }

        public function destroy(command:String, action:*):void
        {
            Game.DirectEvent.destroy(command, action, this._channel);
        }

        public function send(command:String, data:ByteArray):void
        {
            this._socketManager.sendCommand(command, data);
        }

        private function _closeHandler():void
        {
            if (this.closeHandler != null)
            {
                this.closeHandler(this);
            };
            Game.DirectEvent.send(this.Close, new DirectEventParameter(), this._channel);
            if (this._isAutoConnection)
            {
                setTimeout(function ():void
                {
                    Game.SocketThread.connect(_socketManager.ip, _socketManager.port, serverType);
                }, this._autoConnectionTime);
            };
        }

        private function _ioErrorHandler():void
        {
            if (this.ioErrorHandler != null)
            {
                this.ioErrorHandler(this);
            };
            Game.DirectEvent.send(this.IOerror, new DirectEventParameter(), this._channel);
            if (this._isAutoConnection)
            {
                setTimeout(function ():void
                {
                    Game.SocketThread.connect(_socketManager.ip, _socketManager.port, serverType);
                }, this._autoConnectionTime);
            };
        }

        private function _securityErrorHandler():void
        {
            if (this.securityErrorHandler != null)
            {
                this.securityErrorHandler(this);
            };
            Game.DirectEvent.send(this.Securityerror, new DirectEventParameter(), this._channel);
        }

        private function _connectHandler():void
        {
            if (this.connectHandler != null)
            {
                this.connectHandler(this);
            };
            Game.DirectEvent.send(this.ConnectSuccess, new DirectEventParameter(), this._channel);
        }

        public function connect(ip:String, port:int, serverType:uint=0):void
        {
            this._socketManager.connect(ip, port);
        }

        public function setAutoConnect(value:uint=3000):void
        {
            this._autoConnectionTime = value;
            this._isAutoConnection = true;
        }

        public function unsetAutoConnect():void
        {
            this._isAutoConnection = false;
        }

        public function close():void
        {
            this._socketManager.close();
        }

        public function get channel():String
        {
            return (this._channel);
        }

        public function get isConnected():Boolean
        {
            return (this._socketManager.isConnected);
        }


    }
}//package zebra.system.net
