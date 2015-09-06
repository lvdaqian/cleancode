//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.net
{
    import zebra.directEvent.DirectEventParameter;
    import zebra.system.collections.FlashBytesReader;

    public class SocketThreadParam extends DirectEventParameter 
    {

        public var bytesReader:FlashBytesReader;
        private var _socketThread:GameSocketThread;

        public function SocketThreadParam(reader:FlashBytesReader, socketThread:GameSocketThread)
        {
            this.bytesReader = reader;
            this._socketThread = socketThread;
        }

        public function get channel():String
        {
            return (this._socketThread.channel);
        }

        public function get socketThread():GameSocketThread
        {
            return (this._socketThread);
        }


    }
}//package zebra.system.net
