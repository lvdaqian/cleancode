//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import flash.utils.getDefinitionByName;
    import __AS3__.vec.*;

    public class ReflectionMember 
    {

        protected var _class:Class;
        protected var _classObject;
        protected var _classXML:XML;
        protected var _names:Vector.<String>;

        public function ReflectionMember(cls:*, data:XML)
        {
            this._classObject = cls;
            this._class = (getDefinitionByName(Reflection.getClassPath(this._classObject)) as Class);
            this._classXML = data;
            this._names = new Vector.<String>();
        }

        public function get names():Vector.<String>
        {
            return (this._names);
        }


    }
}//package zebra.system.reflection
