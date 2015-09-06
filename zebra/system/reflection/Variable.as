//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class Variable extends ReflectionMember 
    {

        private var _variableInfo:Vector.<VariableInfo>;

        public function Variable(cls:*, data:XML)
        {
            var item:XML;
            var vi:VariableInfo;
            super(cls, data);
            this._variableInfo = new Vector.<VariableInfo>();
            for each (item in _classXML.factory.variable)
            {
                vi = new VariableInfo();
                vi.key = item.@name.toString();
                vi.value = _classObject[vi.key];
                vi.type = item.@type.toString();
                this._variableInfo.push(vi);
                _names.push(vi.key);
            };
        }

        public function get variableInfo():Vector.<VariableInfo>
        {
            return (this._variableInfo);
        }

        public function set(key:String, value:*):void
        {
            var item:VariableInfo;
            for each (item in this._variableInfo)
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
            var item:VariableInfo;
            for each (item in this._variableInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }


    }
}//package zebra.system.reflection
