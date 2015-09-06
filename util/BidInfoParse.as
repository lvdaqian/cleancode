//Created by Action Script Viewer - http://www.buraks.com/asv
package util
{
    import view.LogWinPart;
    import zebra.Game;
    import event.InfoTagEvent;

    public class BidInfoParse 
    {

        public static var userUpdatePos:int = 0;

        private var main:Main;

        public function BidInfoParse()
        {
            this.main = new Main();
            super();
        }

        public static function info(value:String, noJSON:Boolean=false):String
        {
            var now:Date;
            var timestamp:String;
            var servertime1:String;
            var servertime2:String;
            var noBidData:String;
            var Arr2:Array;
            var i:int;
            var receiveData:String = value;
            trace(("公开信息长度" + receiveData.length));
            var Arr:Array = new Array();
            Arr = receiveData.split(",", receiveData.length);
            var showData:String = "";
            var temp:String = Arr[1];
            if (temp == "A")
            {
                showData = (Arr[2] + "\n");
                showData = (showData + (("投放额度数:" + Arr[3]) + "\n"));
                showData = (showData + (("<font color='#FF0000'>本场拍卖会警示价:" + Arr[4]) + "</font>\n"));
                showData = (showData + (((("拍卖会起止时间:" + Arr[5]) + "至") + Arr[6]) + "\n"));
                showData = (showData + (((("首次出价时段:" + Arr[7]) + "至") + Arr[8]) + "\n"));
                showData = (showData + ((((("修改出价时段:" + Arr[9]) + "至") + Arr[10]) + "\n") + "\n"));
                showData = (showData + ("    目前为首次出价时段" + "\n"));
                showData = (showData + (("系统目前时间:<font color='#FF0000'>" + Arr[11]) + "</font>\n"));
                showData = (showData + (("目前已投标人数:<font color='#FF0000'>" + Arr[12]) + "</font>\n"));
                showData = (showData + (("目前最低可成交价:<font color='#FF0000'>" + Arr[13]) + "</font>\n"));
                showData = (showData + (("最低可成交价出价时间:<font color='#FF0000'>" + Arr[14]) + "</font>\n"));
                userUpdatePos = Arr[15];
                trace(("3-1当前处理位置 " + userUpdatePos));
                now = new Date();
                timestamp = ((String(now.getMinutes()) + ".") + String(now.getSeconds()));
                servertime1 = Arr[11].substring(3, Arr[11].length);
                servertime1 = servertime1.split(":").join(".");
                LogWinPart(Game.Content.getView(LogWinPart)).info(((timestamp + "-") + servertime1));
            }
            else
            {
                if (temp == "B")
                {
                    showData = "<font color='#FF0000'>";
                    showData = (showData + (Arr[2] + "\n"));
                    showData = (showData + (("投放额度数:" + Arr[3]) + "\n"));
                    showData = (showData + (("目前已投标人数:" + Arr[4]) + "\n"));
                    showData = (showData + (((("拍卖会起止时间:" + Arr[5]) + "至") + Arr[6]) + "\n"));
                    showData = (showData + (((("首次出价时段:" + Arr[7]) + "至") + Arr[8]) + "\n"));
                    showData = (showData + ((((("修改出价时段:" + Arr[9]) + "至") + Arr[10]) + "\n") + "\n"));
                    showData = (showData + "</font>");
                    showData = (showData + ("    目前为修改出价时段" + "\n"));
                    showData = (showData + (("系统目前时间:<font color='#FF0000'><b>" + Arr[11]) + "</b></font>\n"));
                    showData = (showData + (("目前最低可成交价:<font color='#FF0000'><b>" + Arr[12]) + "</b></font>\n"));
                    showData = (showData + (("最低可成交价出价时间:<font color='#FF0000'><b>" + Arr[13]) + "</b></font>\n"));
                    showData = (showData + (((("目前数据库接受处理价格区间:<font color='#FF0000'><b>" + Arr[14]) + "至") + Arr[15]) + "</b></font>\n"));
                    userUpdatePos = Arr[16];
                    trace(("3-1当前处理位置 " + userUpdatePos));
                    now = new Date();
                    timestamp = ((String(now.getMinutes()) + ".") + String(now.getSeconds()));
                    servertime2 = Arr[11].substring(3, Arr[11].length);
                    LogWinPart(Game.Content.getView(LogWinPart)).info(((timestamp + "-") + servertime2));
                }
                else
                {
                    noBidData = Arr[2];
                    Arr2 = new Array();
                    Arr2 = noBidData.split("\\n", noBidData.length);
                    showData = "";
                    i = 0;
                    while (i < Arr2.length)
                    {
                        showData = (showData + (Arr2[i] + "\n"));
                        i++;
                    };
                    if (Arr[2] != null)
                    {
                    };
                    userUpdatePos = Arr[3];
                };
            };
            var e:InfoTagEvent = new InfoTagEvent();
            e.tag = temp;
            e.value = Arr[12];
            Game.DirectEvent.send(InfoTagEvent.name, e);
            return (showData);
        }


    }
}//package util
