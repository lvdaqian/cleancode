//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.net
{
    import zebra.thread.task.TaskAction;
    import __AS3__.vec.Vector;
    import zebra.system.collections.FlashBytesReader;
    import zebra.system.net.GameSocketThread;
    import zebra.Game;
    import zebra.system.net.SocketThreadParam;

    class SocketBufferAction extends TaskAction 
    {

        private var _bufferList:Vector.<FlashBytesReader>;
        private var _socketThread:GameSocketThread;
        private var _concurrent:int = 2;

        public function SocketBufferAction(bufferList:Vector.<FlashBytesReader>, socketThread:GameSocketThread)
        {
            this._bufferList = bufferList;
            this._socketThread = socketThread;
        }

        override public function execute():void
        {
            var bytes:FlashBytesReader;
            var count:int;
            if (this._bufferList.length >= this._concurrent)
            {
                count = this._concurrent;
            }
            else
            {
                count = this._bufferList.length;
            };
            var i:int;
            while (i < count)
            {
                bytes = this._bufferList.shift();
                Game.DirectEvent.send(((bytes.mainId + "-") + bytes.childId), new SocketThreadParam(bytes, this._socketThread), this._socketThread.channel);
                i++;
            };
        }


    }
}//package zebra.system.net
