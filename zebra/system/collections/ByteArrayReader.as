//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.collections
{
    import flash.utils.ByteArray;

    public class ByteArrayReader 
    {

        protected var _bytes:ByteArray;
        protected var _encoding:String = "utf-8";
        protected var _length:uint;
        protected var _iscopy:Boolean;
        protected var _position:uint;

        public function ByteArrayReader(bytes:ByteArray, position:uint=0, iscopy:Boolean=false)
        {
            this._iscopy = iscopy;
            if (iscopy)
            {
                this._bytes = new ByteArray();
                bytes.readBytes(this._bytes);
            }
            else
            {
                this._bytes = bytes;
            };
            this._bytes.position = position;
        }

        public function readInt8():int
        {
            return (this._bytes.readByte());
        }

        public function readUInt8():int
        {
            return (this._bytes.readUnsignedByte());
        }

        public function readInt16():int
        {
            return (this._bytes.readShort());
        }

        public function readUInt16():int
        {
            return (this._bytes.readUnsignedShort());
        }

        public function readUInt32():uint
        {
            return (this._bytes.readUnsignedInt());
        }

        public function readInt32():int
        {
            return (this._bytes.readInt());
        }

        public function readInt64():Number
        {
            return (this.readUInt64());
        }

        public function readUInt64():Number
        {
            return (this._bytes.readDouble());
        }

        public function readString():String
        {
            var stringLenth:int = this._bytes.readUnsignedInt();
            var result:String = this._bytes.readMultiByte(stringLenth, this._encoding);
            return (result);
        }

        public function readBoolean():Boolean
        {
            return (this._bytes.readBoolean());
        }

        public function readFloat():Number
        {
            return (this._bytes.readFloat());
        }

        public function get position():uint
        {
            return (this._bytes.position);
        }

        public function set position(value:uint):void
        {
            this._bytes.position = value;
        }

        public function get encoding():String
        {
            return (this._encoding);
        }

        public function set encoding(value:String):void
        {
            this._encoding = value;
        }

        public function get endian():String
        {
            return (this._bytes.endian);
        }

        public function set endian(value:String):void
        {
            this._bytes.endian = value;
        }

        public function get length():uint
        {
            return (this._bytes.length);
        }

        public function get bytes():ByteArray
        {
            return (this._bytes);
        }

        public function clear():void
        {
            this._bytes.clear();
        }

        public function clone()
        {
            this._bytes.position = 0;
            var bytes:ByteArray = new ByteArray();
            bytes.writeBytes(this._bytes);
            return (new ByteArrayReader(bytes, 0, this._iscopy));
        }


    }
}//package zebra.system.collections
