//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import flash.utils.ByteArray;
    import util.Base64;
    import util.XXTEA;

    public class XxteaEncodeAndDecode 
    {

        private var keyStr:String = "shcarbid";
        private var key:ByteArray;

        public function XxteaEncodeAndDecode()
        {
            this.key = new ByteArray();
            super();
            this.key.writeMultiByte(this.keyStr, "utf-8");
        }

        public function XxteaEncode(dataString:String):String
        {
            var data:ByteArray = new ByteArray();
            data.writeMultiByte(Base64.encode(dataString), "utf-8");
            var encryptData:ByteArray = XXTEA.encrypt(data, this.key);
            var content:String = Base64.encodeByteArray(encryptData);
            return (content);
        }

        public function XxteaDecode(receiveData:String):String
        {
            var encryptData:ByteArray = Base64.decodeToByteArray(receiveData);
            var sourceBtyes:ByteArray = XXTEA.decrypt(encryptData, this.key);
            var sourceStr:String = sourceBtyes.toString();
            var source:String = Base64.decode(sourceStr);
            return (source);
        }


    }
}//package model
