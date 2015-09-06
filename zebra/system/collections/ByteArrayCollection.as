//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.collections
{
    import flash.utils.ByteArray;
    import zebra.system.net.GameSocketThread;
    import zebra.system.util.SocketServerType;

    public class ByteArrayCollection extends ByteArray 
    {


        public static function get Empty():ByteArrayCollection
        {
            return (new (ByteArrayCollection)());
        }


        public function toInt8(value:int):void
        {
            if (value < -128)
            {
                value = -128;
            };
            if (value > 127)
            {
                value = 127;
            };
            this.writeByte(value);
        }

        public function toUInt8(value:int):void
        {
            if (value > 0xFF)
            {
                value = 0xFF;
            };
            this.writeByte(value);
        }

        public function toInt16(value:int):void
        {
            if (value < -32768)
            {
                value = -32768;
            };
            if (value > 32767)
            {
                value = 32767;
            };
            this.writeShort(value);
        }

        public function toUInt32(value:uint):void
        {
            if (value > 0xFFFFFFFF)
            {
                value = 0xFFFFFFFF;
            };
            this.writeUnsignedInt(value);
        }

        public function toInt32(value:int):void
        {
            if (value < -2147483648)
            {
                value = -2147483648;
            };
            if (value > 0x80000000)
            {
                value = 0x80000000;
            };
            this.writeInt(value);
        }

        public function toInt64(value:*):void
        {
            switch (GameSocketThread.serverType)
            {
                case SocketServerType.NodeJS:
                    this.toNodeJSInt64(value);
                    break;
            };
        }

        private function toNodeJSInt64(value:Number):void
        {
            if (value < -9223372036854774784)
            {
                value = -9223372036854774784;
            };
            if (value > 9223372036854774784)
            {
                value = 9223372036854774784;
            };
            this.writeDouble(value);
        }

        private function toNodeJSUInt64(value:Number):void
        {
            if (value < 0)
            {
                value = 0;
            };
            if (value > 9223372036854774784)
            {
                value = 9223372036854774784;
            };
            this.writeDouble(value);
        }

        public function toUInt64(value:Number):void
        {
            switch (GameSocketThread.serverType)
            {
                case SocketServerType.NodeJS:
                    this.toNodeJSUInt64(value);
                    break;
            };
        }

        public function toStr(value:String, byteType:String="utf-8"):void
        {
            var bytes:ByteArray = new ByteArray();
            bytes.writeMultiByte(value, byteType);
            this.toUInt32(bytes.length);
            this.writeMultiByte(value, byteType);
        }

        public function toBoolean(value:Boolean):void
        {
            this.writeBoolean(value);
        }

        public function toFloat(value:Number):void
        {
            this.writeFloat(value);
        }


    }
}//package zebra.system.collections
