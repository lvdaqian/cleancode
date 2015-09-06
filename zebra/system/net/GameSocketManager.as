//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.net
{
    import flash.events.EventDispatcher;
    import zebra.system.net.IGameSocket;
    import flash.net.Socket;
    import flash.utils.ByteArray;
    import __AS3__.vec.Vector;
    import zebra.system.collections.FlashBytesReader;
    import zebra.system.net.GameSocketThread;
    import zebra.Game;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import zebra.events.GameSocketEvent;
    import zebra.system.util.SocketPackUtil;
    import zebra.system.net.*;
    import flash.events.*;
    import __AS3__.vec.*;

    [Event(name="connectSuccess", type="zebra.events.GameSocketEvent")]
    [Event(name="close", type="zebra.events.GameSocketEvent")]
    [Event(name="ioerror", type="zebra.events.GameSocketEvent")]
    [Event(name="securityerror", type="zebra.events.GameSocketEvent")]
    [Event(name="commandreader", type="zebra.events.GameSocketEvent")]
    class GameSocketManager extends EventDispatcher implements IGameSocket 
    {

        private var _socket:Socket;
        private var _buffer:ByteArray;
        private var _ip:String;
        private var _port:int;
        private var _settingPackLength:uint = 4;
        private var _socketBufferAction:SocketBufferAction;
        private var _bufferList:Vector.<FlashBytesReader>;
        public var ioErrorHandler:Function;
        public var securityErrorHandler:Function;
        public var connectHandler:Function;
        public var closeHandler:Function;
        public var sendBytesByConnect:Function;
        private var _channel:String;
        private var _socketThread:GameSocketThread;

        public function GameSocketManager(socketThread:GameSocketThread)
        {
            this._socketThread = socketThread;
            this._bufferList = new Vector.<FlashBytesReader>();
            this._socket = new Socket();
            this._buffer = new ByteArray();
            this._socketBufferAction = new SocketBufferAction(this._bufferList, this._socketThread);
            Game.TimeUpdate.addTaskAction(this._socketBufferAction);
        }

        public function connect(ip:String, port:int):void
        {
            this._ip = ip;
            this._port = port;
            this._socket.addEventListener(Event.CONNECT, this.onConnect);
            this._socket.addEventListener(ProgressEvent.SOCKET_DATA, this.getSocketData);
            this._socket.addEventListener(Event.CLOSE, this.onClose);
            this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this._socket.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this._socket.connect(ip, port);
            this._socket.timeout = 5000;
        }

        public function close():void
        {
            try
            {
                this._socket.close();
            }
            catch(e)
            {
            };
        }

        private function onIOError(e:IOErrorEvent):void
        {
            if (this.ioErrorHandler != null)
            {
                this.ioErrorHandler();
            };
            dispatchEvent(new GameSocketEvent(GameSocketEvent.IOERROR));
        }

        private function onSecurityError(e:SecurityErrorEvent):void
        {
            if (this.securityErrorHandler != null)
            {
                this.securityErrorHandler();
            };
            dispatchEvent(new GameSocketEvent(GameSocketEvent.SECURITYERROR));
        }

        private function onConnect(e:Event):void
        {
            if (this.sendBytesByConnect != null)
            {
                this.sendBytesByConnect();
            };
            if (this.connectHandler != null)
            {
                this.connectHandler();
            };
            dispatchEvent(new GameSocketEvent(GameSocketEvent.CONNECTSUCCESS));
        }

        private function sendFlashPlayerHeader():void
        {
        }

        private function onClose(e:Event):void
        {
            if (this.closeHandler != null)
            {
                this.closeHandler();
            };
            dispatchEvent(new GameSocketEvent(GameSocketEvent.CLOSE));
        }

        protected function parseNetStream():void
        {
            var packLen:uint;
            var bytesReader:ByteArray;
            var reader:FlashBytesReader;
            var surplusBytes:ByteArray;
            if (this._buffer.length >= 4)
            {
                this._buffer.position = 0;
                packLen = this._buffer.readUnsignedInt();
                if (this._buffer.length >= packLen)
                {
                    bytesReader = new ByteArray();
                    bytesReader.writeBytes(this._buffer, 0, packLen);
                    reader = new FlashBytesReader(bytesReader);
                    this._bufferList.push(reader);
                    surplusBytes = new ByteArray();
                    surplusBytes.writeBytes(this._buffer, packLen);
                    this._buffer.clear();
                    this._buffer = surplusBytes;
                    this.parseNetStream();
                };
            };
        }

        protected function getSocketData(e:ProgressEvent):void
        {
            var currentData:ByteArray;
            if (this._socket.bytesAvailable > 0)
            {
                this._buffer.position = this._buffer.length;
                currentData = new ByteArray();
                this._socket.readBytes(currentData);
                this._buffer.writeBytes(currentData);
                this.parseNetStream();
            };
        }

        public function send(byteArray:ByteArray):void
        {
            if (this._socket.connected)
            {
                this._socket.writeBytes(byteArray);
                this._socket.flush();
            };
        }

        public function sendCommand(commandName:String, bytes:ByteArray):void
        {
            this.send(SocketPackUtil.setPackHeader(commandName, bytes));
        }

        public function get bufferList():Vector.<FlashBytesReader>
        {
            return (this._bufferList);
        }

        public function get ip():String
        {
            return (this._ip);
        }

        public function get port():int
        {
            return (this._port);
        }

        public function get isConnected():Boolean
        {
            return (this._socket.connected);
        }


    }
}//package zebra.system.net
