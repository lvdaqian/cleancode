//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class Constant extends ReflectionMember 
    {

        private var _constantInfo:Vector.<ConstantInfo>;

        public function Constant(cls:*, data:XML)
        {
            var item:XML;
            var sci:ConstantInfo;
            super(cls, data);
            this._constantInfo = new Vector.<ConstantInfo>();
            for each (item in _classXML.factory.constant)
            {
                sci = new ConstantInfo();
                sci.key = item.@name.toString();
                sci.value = _classObject[sci.key];
                sci.type = item.@type.toString();
                this._constantInfo.push(sci);
                _names.push(sci.key);
            };
        }

        public function get(key:String)
        {
            var item:ConstantInfo;
            for each (item in this._constantInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }

        public function get constantInfo():Vector.<ConstantInfo>
        {
            return (this._constantInfo);
        }


    }
}//package zebra.system.reflection
