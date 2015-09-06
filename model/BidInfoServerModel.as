//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import zebra.Game;

    public class BidInfoServerModel extends ServerModel 
    {

        public function BidInfoServerModel()
        {
            port = 8301;
            Game.Content.addModel(this);
        }

    }
}//package model
