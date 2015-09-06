//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class StaticVariable extends ReflectionMember 
    {

        private var _staticVariableInfo:Vector.<StaticVariableInfo>;

        public function StaticVariable(cls:*, data:XML)
        {
            var item:XML;
            var svi:StaticVariableInfo;
            super(cls, data);
            this._staticVariableInfo = new Vector.<StaticVariableInfo>();
            for each (item in _classXML.variable)
            {
                svi = new StaticVariableInfo();
                svi.key = item.@name.toString();
                svi.value = this._class[svi.key];
                svi.type = item.@type.toString();
                this._staticVariableInfo.push(svi);
                _names.push(svi.key);
            };
        }

        public function set(key:String, value:*):void
        {
            var item:StaticVariableInfo;
            for each (item in this._staticVariableInfo)
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
            var item:StaticVariableInfo;
            for each (item in this._staticVariableInfo)
            {
                if (item.key == key)
                {
                    return (item.value);
                };
            };
        }

        public function get staticVariableInfo():Vector.<StaticVariableInfo>
        {
            return (this._staticVariableInfo);
        }


    }
}//package zebra.system.reflection
