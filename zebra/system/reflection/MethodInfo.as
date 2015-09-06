//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class MethodInfo 
    {

        public var key:String;
        public var returnType:String;
        public var declaredBy:String;
        public var parameterInfo:Vector.<MethodParameterInfo>;

        public function MethodInfo()
        {
            this.parameterInfo = new Vector.<MethodParameterInfo>();
            super();
        }

    }
}//package zebra.system.reflection
