//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class StaticAccessor extends ReflectionMember 
    {

        private var _staticAccessorInfo:Vector.<StaticAccessorInfo>;

        public function StaticAccessor(cls:*, data:XML)
        {
            var item:XML;
            var sai:StaticAccessorInfo;
            super(cls, data);
            this._staticAccessorInfo = new Vector.<StaticAccessorInfo>();
            for each (item in _classXML.accessor)
            {
                sai = new StaticAccessorInfo();
                sai.key = item.@name.toString();
                sai.value = this._class[sai.key];
                sai.access = item.@access.toString();
                sai.type = item.@type.toString();
                this._staticAccessorInfo.push(sai);
                _names.push(sai.key);
            };
        }

        public function set(key:String, value:*):void
        {
            var item:StaticAccessorInfo;
            for each (item in this._staticAccessorInfo)
            {
                if (item.key == key)
                {
                    this._class[item.key] = value;
                    item.value = value;
                    break;
                };
            };
        }

        public function get(key:String)
        {
            var item:StaticAccessorInfo;
            for each (item in this._staticAccessorInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }

        public function get staticAccessorInfo():Vector.<StaticAccessorInfo>
        {
            return (this._staticAccessorInfo);
        }


    }
}//package zebra.system.reflection
