//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import zebra.core.GameModel;
    import flash.utils.ByteArray;
    import zebra.Game;
    import util.MD5;
    import zebra.system.collections.ByteArrayCollection;
    import zebra.system.collections.GUID;

    public class BidStageUserModel extends GameModel 
    {

        public var requestid2to2:String;
        public var timespan = "0";
        public var sendTimespan;
        public var getTimespan;
        public var bidnumber:String = "70000004";
        public var clientId:String = "4d3d8712-6d54-4624-8c44-ff0f33cc75b3";
        public var checkcode:String = "";
        public var version:String = "1.0";
        public var keyStr:String = "shcarbid";
        public var key:ByteArray;
        public var xxtea:XxteaEncodeAndDecode;
        public var logappliction:LogApplication;
        public var timestamp:String = "";

        public function BidStageUserModel()
        {
            this.key = new ByteArray();
            this.xxtea = new XxteaEncodeAndDecode();
            this.logappliction = new LogApplication();
            super();
            Game.Content.addUpdateView(this);
        }

        public function get uid():String
        {
            return (this.bidnumber);
        }

        public function get requestid():String
        {
            return (((this.bidnumber + ".") + this.timestamp));
        }

        public function createTimestamp():String
        {
            var now:Date = new Date();
            this.timestamp = (((String(now.getHours()) + String(now.getMinutes())) + String(now.getSeconds())) + String(now.getMilliseconds()));
            return (this.timestamp);
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
            trace(dataString1_1);
            var content1_1:String = this.xxtea.XxteaEncode(dataString1_1);
            trace(content1_1);
            var testxxtea:String = this.xxtea.XxteaDecode(content1_1);
            trace(testxxtea);
            _byteArray3.toStr(content1_1);
            this.logappliction.WriteLog1("投标板块", "上线1-1", this.requestid);
            return (_byteArray3);
        }

        public function get bytes0_0():ByteArrayCollection
        {
            this.createTimestamp();
            var timespan1:String = "0";
            this.checkcode = MD5.startMd((((((this.bidnumber + this.clientId) + this.requestid) + timespan1) + this.timestamp) + this.version));
            var _byteArray3:ByteArrayCollection = new ByteArrayCollection();
            var _dataString0_0:String = (((((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '",request:{timespan:"') + timespan1) + '"}}');
            var content0_0:String = this.xxtea.XxteaEncode(_dataString0_0);
            var testxxtea1:String = this.xxtea.XxteaDecode(content0_0);
            _byteArray3.toStr(content0_0);
            return (_byteArray3);
        }

        public function bytes2_1(value:String):ByteArrayCollection
        {
            this.createTimestamp();
            var _byteArray2to1:ByteArrayCollection = new ByteArrayCollection();
            var bidamount:String = value;
            this.checkcode = MD5.startMd((((((bidamount + this.bidnumber) + this.clientId) + this.requestid) + this.timestamp) + this.version));
            var dataString2_1:String = (((((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + this.checkcode) + '",version:"') + this.version) + '",request:{bidamount:') + bidamount) + "}}");
            var content2_1:String = this.xxtea.XxteaEncode(dataString2_1);
            _byteArray2to1.toStr(content2_1);
            this.logappliction.WriteLog1("投标板块", "请求校验码2-1", this.requestid);
            return (_byteArray2to1);
        }

        public function bytes2_2(value:String, checkcode:String):ByteArrayCollection
        {
            this.createTimestamp();
            var _byteArray2to2:ByteArrayCollection = new ByteArrayCollection();
            var bidamount:String = value;
            var imagenumber:String = checkcode;
            checkcode = MD5.startMd(((((((bidamount + this.bidnumber) + this.clientId) + imagenumber) + this.requestid) + this.timestamp) + this.version));
            this.requestid2to2 = this.requestid;
            var dataString2_2:String = (((((((((((((('{requestid:"' + this.requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{bidamount:"') + bidamount) + '",imagenumber:"') + imagenumber) + '"}}');
            trace(dataString2_2);
            var content2_2:String = this.xxtea.XxteaEncode(dataString2_2);
            _byteArray2to2.toStr(content2_2);
            this.logappliction.WriteLog1("投标板块", "请求进入队列2-2", this.requestid);
            return (_byteArray2to2);
        }

        public function selfPriceInfo(_uniqueid:*=null)
        {
            this.createTimestamp();
            var uniqueid:String = GUID.create().toLowerCase();
            if (_uniqueid != null)
            {
                uniqueid = _uniqueid.toLowerCase();
            };
            var requestid:String = ((this.uid + ".") + this.timestamp);
            var checkcode:String = MD5.startMd((((requestid + this.timestamp) + uniqueid) + this.version)).toLowerCase();
            var jsondata:String = (((((((((('{requestid:"' + requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{}}');
            var sentdata:String = jsondata;
            var data:String = (('{"method":"getimagecode","cmd":"' + escape(sentdata)) + '"}');
            return (data);
        }

        public function selfPriceInfowithoutUniqueid()
        {
            this.createTimestamp();
            var requestid:String = ((this.uid + ".") + this.timestamp);
            var checkcode:String = MD5.startMd(((requestid + this.timestamp) + this.version)).toLowerCase();
            var jsondata:String = (((((((((('{requestid:"' + requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.uid) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '"}');
            var sentdata:String = jsondata;
            var data:String = (('{"method":"getimagecode","cmd":"' + escape(sentdata)) + '"}');
            return (data);
        }

        public function sendPriceInfo(checkcode:String, uniqueid:*):String
        {
            this.createTimestamp();
            var requestid:String = ((this.uid + ".") + this.timestamp);
            var imagenumber:String = checkcode;
            checkcode = MD5.startMd(((((((this.bidnumber + this.clientId) + imagenumber) + requestid) + this.timestamp) + uniqueid) + this.version)).toLowerCase();
            var jsondataForInfo:String = (((((((((((((((('{requestid:"' + requestid) + '",timestamp:"') + this.timestamp) + '",bidnumber:"') + this.bidnumber) + '",checkcode:"') + checkcode) + '",version:"') + this.version) + '",request:{uniqueid:"') + uniqueid) + '",bidnumber:"') + this.bidnumber) + '",imagenumber:"') + imagenumber) + '"}}');
            var sentdataForInfo:String = jsondataForInfo;
            var data:String = (('{"method":"bidcheck","cmd":"' + escape(sentdataForInfo)) + '"}');
            return (data);
        }

        public function sentLogData(log:*)
        {
            var logdata:String = log;
            trace(log);
            var data:String = (('{"cmd":"' + log) + '"}');
            return (data);
        }


    }
}//package model
