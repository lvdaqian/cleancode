//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class StaticConstant extends ReflectionMember 
    {

        private var _staticConstantInfo:Vector.<StaticConstantInfo>;

        public function StaticConstant(cls:*, data:XML)
        {
            var item:XML;
            var sci:StaticConstantInfo;
            super(cls, data);
            this._staticConstantInfo = new Vector.<StaticConstantInfo>();
            for each (item in _classXML.constant)
            {
                sci = new StaticConstantInfo();
                sci.key = item.@name.toString();
                sci.value = this._class[sci.key];
                sci.type = item.@type.toString();
                this._staticConstantInfo.push(sci);
                _names.push(sci.key);
            };
        }

        public function get(key:String)
        {
            var item:StaticConstantInfo;
            for each (item in this._staticConstantInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }

        public function get staticConstantInfo():Vector.<StaticConstantInfo>
        {
            return (this._staticConstantInfo);
        }


    }
}//package zebra.system.reflection
