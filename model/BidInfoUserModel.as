//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import zebra.core.GameModel;
    import flash.utils.ByteArray;
    import util.MD5;
    import zebra.system.collections.ByteArrayCollection;
    import zebra.system.collections.GUID;

    public class BidInfoUserModel extends GameModel 
    {

        public var xxtea:XxteaEncodeAndDecode;
        public var timespan = "0";
        public var sendTimespan;
        public var getTimespan;
        public var bidnumber:String = "70000004";
        public var clientId:String = "4d3d8712-6d54-4624-8c44-ff0f33cc75b3";
        public var checkcode:String = "";
        public var version:String = "1.0";
        public var keyStr1:String = "shcarbid";
        public var key1:ByteArray;
        public var timestamp:String = "";

        public function BidInfoUserModel()
        {
            this.xxtea = new XxteaEncodeAndDecode();
            this.key1 = new ByteArray();
            super();
        }

        public function get uid():String
        {
            return (this.bidnumber);
        }

        public function get requestid():String
        {
            return (((this.bidnumber + ".") + this.timestamp));
        }

        public function createTimestamp():void
        {
            var now:Date = new Date();
            this.timestamp = (((String(now.getHours()) + String(now.getMinutes())) + String(now.getSeconds())) + String(now.getMilliseconds()));
        }

        public function data():String
        {
            return ((((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '"}'));
        }

        public function get bytes1_1():ByteArrayCollection
        {
            this.createTimestamp();
            this.checkcode = MD5.startMd(((((this.bidnumber + this.clientId) + this.requestid) + this.timestamp) + this.version)).toLowerCase();
            var _byteArray3:ByteArrayCollection = new ByteArrayCollection();
            var dataString1_1:String = (((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '"}');
            var content1_1:String = this.xxtea.XxteaEncode(dataString1_1);
            _byteArray3.toStr(content1_1);
            return (_byteArray3);
        }

        public function get bytes0_0():ByteArrayCollection
        {
            this.createTimestamp();
            this.checkcode = MD5.startMd((((((this.bidnumber + this.clientId) + this.requestid) + this.timespan) + this.timestamp) + this.version)).toLowerCase();
            var _byteArray3:ByteArrayCollection = new ByteArrayCollection();
            var dataString0_0:String = (((((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '",request:{timespan:"') + this.timespan) + '"}}');
            var content0_0:String = this.xxtea.XxteaEncode(dataString0_0);
            _byteArray3.toStr(content0_0);
            return (_byteArray3);
        }

        public function bytes2_1(value:String):ByteArrayCollection
        {
            this.createTimestamp();
            var _byteArray2to1:ByteArrayCollection = new ByteArrayCollection();
            var bidamount:String = value;
            this.checkcode = MD5.startMd((((((bidamount + this.bidnumber) + this.clientId) + this.requestid) + this.timestamp) + this.version));
            trace((((((((((((("{requestid:" + this.requestid) + ',timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '",request:{bidamount:') + bidamount) + "}}"));
            _byteArray2to1.toStr((((((((((((("{requestid:" + this.requestid) + ',timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '",request:{bidamount:') + bidamount) + "}}"));
            return (_byteArray2to1);
        }

        public function bytes2_2(value:String, checkcode:String):ByteArrayCollection
        {
            this.createTimestamp();
            var _byteArray2to2:ByteArrayCollection = new ByteArrayCollection();
            var bidamount:String = value;
            var imagenumber:String = checkcode;
            checkcode = MD5.startMd(((((((bidamount + this.bidnumber) + this.clientId) + imagenumber) + this.requestid) + this.timestamp) + this.version));
            _byteArray2to2.toStr((((((((((((((("{requestid:" + this.requestid) + ',timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{bidamount:"') + bidamount) + '",imagenumber:"') + imagenumber) + '"}}'));
            return (_byteArray2to2);
        }

        public function selfPriceInfo()
        {
            this.createTimestamp();
            var uniqueid:String = GUID.create().toLowerCase();
            var requestid:String = ((this.uid + ".") + this.timestamp);
            var checkcode:String = MD5.startMd((((requestid + this.timestamp) + uniqueid) + this.version)).toLowerCase();
            var jsondata:String = (((((((((((('{requestid:"' + requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{uniqueid:"') + uniqueid) + '"}}');
            var data:String = (('{"method":"getimagecode","cmd":"' + escape(jsondata)) + '"}');
            return (data);
        }

        public function sendPriceInfo(checkcode:String):String
        {
            this.createTimestamp();
            var uniqueid:String = GUID.create().toLowerCase();
            var requestid:String = ((this.uid + ".") + this.timestamp);
            var imagenumber:String = checkcode;
            checkcode = MD5.startMd(((((((this.bidnumber + this.clientId) + imagenumber) + requestid) + this.timestamp) + uniqueid) + this.version)).toLowerCase();
            var jsondata:String = (((((((((((((((('{requestid:"' + requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{uniqueid:"') + uniqueid) + '",bidnumber:"') + this.bidnumber) + '",imagenumber:"') + imagenumber) + '"}}');
            var data:String = (('{"method":"bidcheck","cmd":"' + escape(jsondata)) + '"}');
            return (data);
        }


    }
}//package model
