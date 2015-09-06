//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import ws.Bidinfo;
    import zebra.Game;

    public class BidInfoPart extends Bidinfo 
    {

        public function BidInfoPart()
        {
            Game.Content.addUpdateView(this);
            this.setLightState(1);
        }

        public function setLightState(value:int):void
        {
            switch (value)
            {
                case 1:
                    light.gotoAndStop(1);
                    networkText.visible = true;
                    break;
                case 2:
                    light.gotoAndStop(2);
                    networkText.visible = false;
                    break;
                case 3:
                    light.gotoAndStop(3);
                    networkText.visible = false;
                    break;
            };
        }


    }
}//package view
