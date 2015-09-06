//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class Accessor extends ReflectionMember 
    {

        private var _accessorInfo:Vector.<AccessorInfo>;

        public function Accessor(cls:*, data:XML)
        {
            var item:XML;
            var ai:AccessorInfo;
            super(cls, data);
            this._accessorInfo = new Vector.<AccessorInfo>();
            for each (item in _classXML.factory.accessor)
            {
                ai = new AccessorInfo();
                ai.key = item.@name.toString();
                ai.value = _classObject[ai.key];
                ai.access = item.@access.toString();
                ai.type = item.@type.toString();
                this._accessorInfo.push(ai);
                this._names.push(ai.key);
            };
        }

        public function set(key:String, value:*):void
        {
            var item:AccessorInfo;
            for each (item in this._accessorInfo)
            {
                if (item.key == key)
                {
                    _classObject[item.key] = value;
                    item.value = value;
                    break;
                };
            };
        }

        public function get(key:String)
        {
            var item:AccessorInfo;
            for each (item in this._accessorInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }

        public function get accessorInfo():Vector.<AccessorInfo>
        {
            return (this._accessorInfo);
        }


    }
}//package zebra.system.reflection
