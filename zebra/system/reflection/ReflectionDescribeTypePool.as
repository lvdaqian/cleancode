//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import flash.utils.Dictionary;
    import zebra.system.reflection.*;

    class ReflectionDescribeTypePool 
    {

        private static var refList:Dictionary = new Dictionary();


        public static function add(classPath:String, data:XML):void
        {
            if (refList[classPath] == null)
            {
                refList[classPath] = data;
            };
        }

        public static function has(classPath:String):Boolean
        {
            return (!((refList[classPath] == null)));
        }

        public static function get(classPath:String):XML
        {
            return (XML(refList[classPath]));
        }


    }
}//package zebra.system.reflection
