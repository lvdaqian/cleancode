//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.Kictout;
    import flash.events.MouseEvent;
    import model.WebParamModel;
    import zebra.Game;
    import zebra.system.util.Javascript;

    public class KickOutPart extends Kictout 
    {

        public function KickOutPart(_arg_1:*)
        {
            switch (_arg_1)
            {
                case 1:
                    this.myPriceResult.text = "该投标号已在其他地方登陆，请检查投标号并重新登录。";
                    break;
                case 2:
                    this.myPriceResult.text = "您与服务器的连接已经断开，请重新登录";
                    break;
            };
            okBut.addEventListener(MouseEvent.CLICK, this.closeHandler);
        }

        private function closeHandler(e:MouseEvent):void
        {
            this.parent.removeChild(this);
            var webParamModel:WebParamModel = WebParamModel(Game.Content.getModel(WebParamModel));
            Javascript.OpenURL((("http://" + webParamModel.httpIP) + "/bid/"));
        }


    }
}//package view
