//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.WarnInfo;
    import flash.events.MouseEvent;

    public class WarnInfoPart extends WarnInfo 
    {

        private var otTimer:uint;

        public function WarnInfoPart(type:*, showBut:Boolean=true)
        {
            super();
            switch (type)
            {
                case 1:
                    this.myPriceResult.text = "输入价格不能为空";
                    break;
                case 2:
                    this.myPriceResult.text = "出价金额必须为100元的正整数倍";
                    break;
                case 3:
                    this.myPriceResult.text = "两次输入的出价金额不一致";
                    break;
                case 4:
                    this.myPriceResult.text = "校验码不能为空";
                    break;
                case 5:
                    this.myPriceResult.text = "图像校验码错误！";
                    break;
                case 6:
                    this.myPriceResult.text = "正在等待出价入列";
                    break;
                case 7:
                    this.myPriceResult.text = "没有正在举行的拍卖会，请注意拍卖公告！";
                    break;
                case 8:
                    this.myPriceResult.text = "出价成功";
                    break;
                case 9:
                    this.myPriceResult.text = "你的操作过于频繁，请稍后再尝试";
                    break;
                default:
                    this.myPriceResult.text = String(type);
            };
            okBut.visible = showBut;
            okBut.addEventListener(MouseEvent.CLICK, this.handler);
        }

        private function handler(e:MouseEvent):void
        {
            this.parent.removeChild(this);
        }


    }
}//package view
