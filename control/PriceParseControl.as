//Created by Action Script Viewer - http://www.buraks.com/asv
package control
{
    import model.LogApplication;
    import view.BidStagePart;
    import zebra.Game;
    import view.BidInitView;
    import view.WarnInfoPart;
    import view.LogWinPart;

    public class PriceParseControl 
    {

        public var logappliction:LogApplication;

        public function PriceParseControl()
        {
            this.logappliction = new LogApplication();
            super();
        }

        public static function parse(jsonstr:String, state:int=0)
        {
            switch (state)
            {
                case 0:
                    BidStagePart(Game.Content.getView(BidStagePart)).setPriceInfo(firstState(jsonstr));
                    break;
                case 1:
                    httpState(jsonstr);
                    break;
                case 2:
                    get2To3Header(jsonstr);
                    break;
                case 3:
                    httpState2_3(jsonstr);
                    break;
            };
        }

        private static function firstState(serverJSON:String)
        {
            var bidcount:*;
            var _local_5:*;
            var selfInfo:*;
            var json:Object = new Object();
            json = JSON.parse(serverJSON);
            trace(("######" + json));
            var responseCode2:String = json.response.responsecode;
            if ((((((responseCode2 == "0")) && (!((json.response.data.results == null))))) && (!((json.response.data.results[0] == null)))))
            {
                bidcount = json.response.data.results[0].bidcount;
                _local_5 = json.response.data.results[0].type;
                selfInfo = (("您第" + bidcount) + "次出价\n");
                selfInfo = (selfInfo + (("出价金额:" + json.response.data.results[0].bidamount) + "\n"));
                selfInfo = (selfInfo + (("出价时间:" + json.response.data.results[0].dealtime) + "\n"));
                if (_local_5 == "1")
                {
                    selfInfo = (selfInfo + "出价方式:网络出价");
                }
                else
                {
                    selfInfo = (selfInfo + "出价方式:电话出价");
                };
                return (selfInfo);
            };
            return ("");
        }

        private static function httpState(jsonstr:String):void
        {
            var msg2101:String;
            var bidamount:*;
            var bidcount:*;
            var bidtime:*;
            var _local_8:*;
            var msg:String;
            var selfInfo:*;
            var json:Object = JSON.parse(jsonstr);
            var responsecode:String = json.response.responsecode;
            if (responsecode != "0")
            {
                if (responsecode == "2101")
                {
                    msg2101 = json.response.responsemsg;
                    BidInitView.setWin(new WarnInfoPart(msg2101, true));
                };
            }
            else
            {
                if (json.response.data != null)
                {
                    if (json.response.data[0] != null)
                    {
                        bidamount = json.response.data[0].bidamount;
                        bidcount = json.response.data[0].bidcount;
                        bidtime = json.response.data[0].dealtime;
                        _local_8 = json.response.data[0].type;
                        msg = json.response.data[0].msg;
                        selfInfo = (("您第" + bidcount) + "次出价\n");
                        selfInfo = (selfInfo + (("出价金额:" + bidamount) + "\n"));
                        selfInfo = (selfInfo + (("出价时间:" + bidtime) + "\n"));
                        if (_local_8 == "1")
                        {
                            selfInfo = (selfInfo + "出价方式:网络出价");
                        }
                        else
                        {
                            selfInfo = (selfInfo + "出价方式:电话出价");
                        };
                        BidStagePart(Game.Content.getView(BidStagePart)).setPriceInfo(selfInfo);
                    };
                };
            };
        }

        private static function httpState2_3(jsonstr:String):void
        {
            var msg2101:String;
            var bidamount:*;
            var bidcount:*;
            var bidtime:*;
            var _local_10:*;
            var msg:String;
            var selfInfo:*;
            var now:Date = new Date();
            var timestamp:String = ((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds()));
            LogWinPart(Game.Content.getView(LogWinPart)).info(((("投标板块,2-3http最新出价情况,当前时间" + timestamp) + ",数据：") + jsonstr));
            trace(jsonstr);
            var json:Object = JSON.parse(jsonstr);
            var responsecode:String = json.response.responsecode;
            if (responsecode != "0")
            {
                if (responsecode == "2101")
                {
                    msg2101 = json.response.responsemsg;
                    BidInitView.setWin(new WarnInfoPart(msg2101, true));
                };
            }
            else
            {
                if (json.response.data[0] != null)
                {
                    bidamount = json.response.data[0].bidamount;
                    bidcount = json.response.data[0].bidcount;
                    bidtime = json.response.data[0].bidtime;
                    _local_10 = json.response.data[0].type;
                    msg = json.response.data[0].msg;
                    selfInfo = (("您第" + bidcount) + "次出价\n");
                    selfInfo = (selfInfo + (("出价金额:" + bidamount) + "\n"));
                    selfInfo = (selfInfo + (("出价时间:" + bidtime) + "\n"));
                    if (_local_10 == "1")
                    {
                        selfInfo = (selfInfo + "出价方式:网络出价");
                    }
                    else
                    {
                        selfInfo = (selfInfo + "出价方式:电话出价");
                    };
                    BidStagePart(Game.Content.getView(BidStagePart)).setPriceInfo(selfInfo);
                    BidInitView.setWin(new WarnInfoPart(msg));
                };
            };
        }

        private static function get2To3Header(serverJSON:String):void
        {
            var bidamount:*;
            var bidcount:*;
            var bidtime:*;
            var _local_7:*;
            var msg:String;
            var servertime:String;
            var beforeDealTime:String;
            var dealtime0:String;
            var temp:String;
            var now:Date;
            var timestamp:String;
            var selfInfo:*;
            var bidamount1:*;
            var bidtime1:*;
            var msg1:String;
            var servertime1:String;
            var beforeDealTime1:String;
            var dealtime1:String;
            var temp1:String;
            var json:Object = JSON.parse(serverJSON);
            var responsecode:String = json.response.responsecode;
            if (responsecode == "0")
            {
                bidamount = json.response.data.bidamount;
                bidcount = json.response.data.bidcount;
                bidtime = json.response.data.bidtime;
                _local_7 = json.response.data.type;
                msg = json.response.data.msg;
                servertime = json.servertime;
                beforeDealTime = json.response.data.dealtime;
                dealtime0 = beforeDealTime.substring(0, (beforeDealTime.length - 4));
                temp = msg;
                if (bidcount != "0")
                {
                    selfInfo = (("您第" + bidcount) + "次出价\n");
                    selfInfo = (selfInfo + (("出价金额:" + bidamount) + "\n"));
                    selfInfo = (selfInfo + (("出价时间:" + dealtime0) + "\n"));
                    if (_local_7 == "1")
                    {
                        selfInfo = (selfInfo + "出价方式: 网络出价");
                    }
                    else
                    {
                        selfInfo = (selfInfo + "出价方式: 电话出价");
                    };
                    BidStagePart(Game.Content.getView(BidStagePart)).setPriceInfo(selfInfo);
                    BidInitView.setWin(new WarnInfoPart(temp));
                }
                else
                {
                    selfInfo = (("您第" + bidcount) + "次出价\n");
                    selfInfo = (selfInfo + (("出价金额:" + bidamount) + "\n"));
                    selfInfo = (selfInfo + (("出价时间:" + dealtime0) + "\n"));
                    if (_local_7 == "1")
                    {
                        selfInfo = (selfInfo + "出价方式:网络出价");
                    }
                    else
                    {
                        selfInfo = (selfInfo + "出价方式:电话出价");
                    };
                    BidStagePart(Game.Content.getView(BidStagePart)).setPriceInfo(selfInfo);
                };
                now = new Date();
                timestamp = ((((String(now.getHours()) + ":") + String(now.getMinutes())) + ":") + String(now.getSeconds()));
                LogWinPart(Game.Content.getView(LogWinPart)).info(((("投标板块,接收出价情况2-3,当前时间:" + timestamp) + ",server time:") + servertime));
            }
            else
            {
                bidamount1 = json.response.data.bidamount;
                bidtime1 = json.response.data.bidtime;
                msg1 = json.response.data.msg;
                servertime1 = json.servertime;
                beforeDealTime1 = json.response.data.dealtime;
                dealtime1 = "";
                if (responsecode != "4019")
                {
                    dealtime1 = beforeDealTime1.substring(0, (beforeDealTime1.length - 4));
                }
                else
                {
                    dealtime1 = beforeDealTime1;
                };
                temp1 = (((((((msg1 + "\n") + "出价金额:") + bidamount1) + "元") + "\n") + "系统处理时间:") + dealtime1);
                BidInitView.setWin(new WarnInfoPart(temp1));
            };
        }

        private static function substringMillisecond(beforeTime:String):String
        {
            var afterTime:String;
            trace(("beforeTime is :" + beforeTime));
            if (BidStagePart(Game.Content.getView(BidStagePart)).bidcode != 4)
            {
                if (beforeTime.indexOf("000") != -1)
                {
                    afterTime = beforeTime.substring(0, (beforeTime.length - 4));
                    trace(("afterTime is :" + afterTime));
                };
            }
            else
            {
                afterTime = beforeTime;
            };
            return (afterTime);
        }


    }
}//package control
