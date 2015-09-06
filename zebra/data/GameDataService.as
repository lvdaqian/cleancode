//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.data
{
    import zebra.Game;

    public class GameDataService 
    {


        public function get FlashvarsParams():Object
        {
            return (Game.graphicsDeviceManager.stage.loaderInfo.parameters);
        }


    }
}//package zebra.data
