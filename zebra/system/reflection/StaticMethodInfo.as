//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class StaticMethodInfo 
    {

        public var key:String;
        public var returnType:String;
        public var declaredBy:String;
        public var parameterInfo:Vector.<StaticMethodParameterInfo>;

        public function StaticMethodInfo()
        {
            this.parameterInfo = new Vector.<StaticMethodParameterInfo>();
            super();
        }

    }
}//package zebra.system.reflection
