//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system
{
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.net.LocalConnection;

    public class GameHack 
    {


        public function keepframe():void
        {
            var frameSound:Sound = new Sound(new URLRequest(""));
            frameSound.play();
            frameSound.close();
        }

        public function gc():void
        {
            try
            {
                new LocalConnection().connect("Zebra-b090fd9c-9f1a-4c08-a4ed-ce74efa80551");
                new LocalConnection().connect("Zebra-b090fd9c-9f1a-4c08-a4ed-ce74efa80551");
            }
            catch(e)
            {
            };
        }


    }
}//package zebra.system
