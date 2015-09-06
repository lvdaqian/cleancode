//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import zebra.Game;

    public class BidStageServerModel extends ServerModel 
    {

        public function BidStageServerModel()
        {
            port = 8300;
            Game.Content.addModel(this);
        }

    }
}//package model
