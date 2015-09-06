//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class StaticMethod extends ReflectionMember 
    {

        private var _staticMethodInfo:Vector.<StaticMethodInfo>;

        public function StaticMethod(cls:*, data:XML)
        {
            var item:XML;
            var smi:StaticMethodInfo;
            var param:XML;
            var smp:StaticMethodParameterInfo;
            super(cls, data);
            this._staticMethodInfo = new Vector.<StaticMethodInfo>();
            for each (item in _classXML.method)
            {
                smi = new StaticMethodInfo();
                smi.key = item.@name.toString();
                smi.declaredBy = item.@declaredBy.toString();
                smi.returnType = item.@returnType.toString();
                for each (param in item.parameter)
                {
                    smp = new StaticMethodParameterInfo();
                    smp.index = int(param.@index);
                    smp.type = param.@type.toString();
                    smp.optional = Boolean(param.@optional);
                    smi.parameterInfo.push(smp);
                };
                this._staticMethodInfo.push(smi);
                _names.push(smi.key);
            };
        }

        public function executeMethod(name:String, data:Array=null):void
        {
            var smp:StaticMethodInfo;
            for each (smp in this._staticMethodInfo)
            {
                if (smp.key == name)
                {
                    if (smp.parameterInfo.length == 0)
                    {
                        var _local_6 = this._class;
                        (_local_6[smp.key]());
                    }
                    else
                    {
                        _local_6 = this._class;
                        (_local_6[smp.key](data));
                    };
                    break;
                };
            };
        }

        public function get staticMethodInfo():Vector.<StaticMethodInfo>
        {
            return (this._staticMethodInfo);
        }


    }
}//package zebra.system.reflection
