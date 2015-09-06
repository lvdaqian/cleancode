//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class Method extends ReflectionMember 
    {

        private var _methodInfo:Vector.<MethodInfo>;

        public function Method(cls:*, data:XML)
        {
            var item:XML;
            var mi:MethodInfo;
            var param:XML;
            var mpi:MethodParameterInfo;
            super(cls, data);
            this._methodInfo = new Vector.<MethodInfo>();
            for each (item in _classXML.factory.method)
            {
                mi = new MethodInfo();
                mi.key = item.@name.toString();
                mi.declaredBy = item.@declaredBy.toString();
                mi.returnType = item.@returnType.toString();
                for each (param in item.parameter)
                {
                    mpi = new MethodParameterInfo();
                    mpi.index = int(param.@index);
                    mpi.type = param.@type.toString();
                    mpi.optional = Boolean(param.@optional);
                    mi.parameterInfo.push(mpi);
                };
                this._methodInfo.push(mi);
                _names.push(mi.key);
            };
        }

        public function executeMethod(name:String, data:Array=null):void
        {
            var mi:MethodInfo;
            for each (mi in this._methodInfo)
            {
                if (mi.key == name)
                {
                    if (mi.parameterInfo.length == 0)
                    {
                        var _local_6 = _classObject;
                        (_local_6[mi.key]());
                    }
                    else
                    {
                        _local_6 = _classObject;
                        (_local_6[mi.key](data));
                    };
                    break;
                };
            };
        }

        public function get methodInfo():Vector.<MethodInfo>
        {
            return (this._methodInfo);
        }


    }
}//package zebra.system.reflection
