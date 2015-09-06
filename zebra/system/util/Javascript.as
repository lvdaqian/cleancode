//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.util
{
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.utils.setTimeout;
    import flash.external.ExternalInterface;

    public class Javascript 
    {


        public static function QQ(qq:uint):void
        {
            navigateToURL(new URLRequest(("tencent://message/?uin=" + qq)), "_blank");
        }

        public static function OpenURL(url:String=null, target:String=null):void
        {
            if (url == null)
            {
                return;
            };
            if (target == null)
            {
                navigateToURL(new URLRequest(url), "_self");
            }
            else
            {
                navigateToURL(new URLRequest(url), "_blank");
            };
        }

        public static function Alert(str:String=""):void
        {
            navigateToURL(new URLRequest((('javascript:alert("' + str) + '");')), "_self");
        }

        public static function GoogleAnalytics(trackCode:String="", delay:Number=0):void
        {
            setTimeout(RunGoogleAnalytics, delay, trackCode);
        }

        private static function RunGoogleAnalytics(trackCode:String):void
        {
            var _request:URLRequest = new URLRequest((("javascript:pageTracker._trackPageview('" + trackCode) + "');"));
            navigateToURL(_request, "_self");
        }

        public static function GoogleAsynAnalytics(trackCode:String="", jsMethond:String="GACode"):void
        {
            var _request:URLRequest;
            if (jsMethond != null)
            {
                ExternalInterface.call(jsMethond, trackCode);
            }
            else
            {
                _request = new URLRequest((("javascript:pageTracker._trackPageview('" + trackCode) + "');"));
                navigateToURL(_request, "_self");
            };
        }

        public static function RefreshPage():void
        {
            navigateToURL(new URLRequest("javascript:location.reload();"), "_self");
        }

        public static function ClosePage():void
        {
            navigateToURL(new URLRequest("javascript:window.close()"), "_self");
        }

        public static function jsMethond(str:String):void
        {
        }


    }
}//package zebra.system.util
