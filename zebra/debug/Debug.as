//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.debug
{
    import zebra.system.reflection.Reflection;
    import flash.utils.getQualifiedClassName;

    public class Debug 
    {


        public static function output(str:String, tabindex:int=0, textcolor:String="0x000000", textBgColor:String="0xFFFFFF"):void
        {
            var ot:String = (((((((("[Tab:" + tabindex) + "],{") + str) + "},{") + textcolor) + "},{") + textBgColor) + "}");
            trace(ot);
        }

        public static function dumpClass(cls:*, tabindex:int=0, textcolor:String="0x0000FF", textBgColor:String="0xFFFFFF"):void
        {
            var item:String;
            var access:String;
            output(cls.toString(), tabindex, textcolor, textBgColor);
            output("{", tabindex, textcolor, textBgColor);
            var data:Reflection = new Reflection(cls);
            for each (item in data.variable.names)
            {
                output(((("  " + item) + ":") + data.variable.get(item)), tabindex, textcolor, textBgColor);
            };
            for each (access in data.accessor.names)
            {
                output(((("  " + access) + ":") + data.accessor.get(access)), tabindex, textcolor, textBgColor);
            };
            output("}", tabindex, textcolor, textBgColor);
        }

        public static function dump(_obj:*):void
        {
            var i:*;
            if (!(_obj))
            {
                return;
            };
            trace("********************************");
            trace((("[" + getQualifiedClassName(_obj)) + "]=>"));
            for (i in _obj)
            {
                trace(((("         " + i) + "  :  ") + _obj[i]));
            };
        }


    }
}//package zebra.debug
