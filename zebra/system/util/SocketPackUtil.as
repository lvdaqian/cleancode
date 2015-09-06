//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.util
{
    import flash.utils.ByteArray;
    import zebra.system.collections.ByteArrayCollection;

    public class SocketPackUtil 
    {


        public static function breakdownPack(data:ByteArray):ByteArray
        {
            data.position = 0;
            var mainPack:ByteArray = new ByteArray();
            mainPack.writeBytes(data, 3);
            return (mainPack);
        }

        public static function setPackHeader(header:String, data:ByteArray):ByteArray
        {
            data.position = 0;
            var headerArr:Array = header.split("-");
            var appendHeaderPack:ByteArrayCollection = new ByteArrayCollection();
            appendHeaderPack.toUInt32((((data.length + 4) + 1) + 1));
            appendHeaderPack.toUInt8(headerArr[0]);
            appendHeaderPack.toUInt8(headerArr[1]);
            appendHeaderPack.writeBytes(data);
            return (appendHeaderPack);
        }


    }
}//package zebra.system.util
