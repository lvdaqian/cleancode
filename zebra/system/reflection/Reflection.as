//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.reflection
{
    import flash.utils.getDefinitionByName;
    import flash.utils.describeType;
    import flash.system.ApplicationDomain;
    import flash.utils.getQualifiedClassName;

    public class Reflection 
    {

        private var _classXML:XML;
        private var _class:Class;
        private var _classObject;
        private var _staticVariable:StaticVariable;
        private var _staticConstant:StaticConstant;
        private var _staticMethod:StaticMethod;
        private var _staticAccessor:StaticAccessor;
        private var _accessor:Accessor;
        private var _constant:Constant;
        private var _variable:Variable;
        private var _method:Method;
        private var _namespacepath:String;
        private var _className:String;

        public function Reflection(cls:*=null)
        {
            this.parse(cls);
        }

        public static function describeTypeFullXML(cls:Class):XML
        {
            var classPath:String = getClassPath(cls);
            var targetClass:Class = (getDefinitionByName(classPath) as Class);
            if (!(ReflectionDescribeTypePool.has(classPath)))
            {
                ReflectionDescribeTypePool.add(classPath, describeType(targetClass));
            };
            return (ReflectionDescribeTypePool.get(classPath));
        }

        public static function getClassByName(name:String, domain:ApplicationDomain=null):Class
        {
            if (!(domain))
            {
                domain = ApplicationDomain.currentDomain;
            };
            return ((domain.getDefinition(name) as Class));
        }

        public static function getClassPackage(o:*):String
        {
            var fullpath:String = getQualifiedClassName(o);
            fullpath = fullpath.split("::").join(".");
            var parts:Array = fullpath.split(".");
            if (parts.length > 1)
            {
                parts.pop();
                return (parts.join("."));
            };
            return ("");
        }

        public static function getClassPath(o:*, normalize:Boolean=true):String
        {
            var fullpath:String = getQualifiedClassName(o);
            if (normalize)
            {
                fullpath = fullpath.split("::").join(".");
            };
            return (fullpath);
        }

        public static function getClassName(o:*, path:Boolean=false):String
        {
            var parts:Array;
            var fullpath:String = getQualifiedClassName(o);
            if (path)
            {
                return (fullpath);
            };
            fullpath = fullpath.split("::").join(".");
            parts = fullpath.split(".");
            if (parts.length > 1)
            {
                return (parts.pop());
            };
            return (fullpath);
        }

        public static function invoke(c:Class, args:Array=null)
        {
            if (!(args))
            {
                return (new (c)());
            };
            var a:Array = args;
            switch (a.length)
            {
                case 0:
                    return (new (c)());
                case 1:
                    return (new (c)(a[0]));
                case 2:
                    return (new (c)(a[0], a[1]));
                case 3:
                    return (new (c)(a[0], a[1], a[2]));
                case 4:
                    return (new (c)(a[0], a[1], a[2], a[3]));
                case 5:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4]));
                case 6:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5]));
                case 7:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6]));
                case 8:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]));
                case 9:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]));
                case 10:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]));
                case 11:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]));
                case 12:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]));
                case 13:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]));
                case 14:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]));
                case 15:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]));
                case 16:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]));
                case 17:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16]));
                case 18:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17]));
                case 19:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18]));
                case 20:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19]));
                case 21:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]));
                case 22:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21]));
                case 23:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22]));
                case 24:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23]));
                case 25:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24]));
                case 26:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25]));
                case 27:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26]));
                case 28:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27]));
                case 29:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28]));
                case 30:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29]));
                case 31:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30]));
                case 32:
                    return (new (c)(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30], a[31]));
                default:
                    return (null);
            };
        }


        protected function parse(cls:*):void
        {
            this._classObject = cls;
            this._class = (getDefinitionByName(getClassPath(this._classObject)) as Class);
            this._classXML = describeTypeFullXML(this._class);
            this._staticVariable = new StaticVariable(this._classObject, this._classXML);
            this._staticConstant = new StaticConstant(this._classObject, this._classXML);
            this._staticMethod = new StaticMethod(this._classObject, this._classXML);
            this._staticAccessor = new StaticAccessor(this._classObject, this._classXML);
            this._accessor = new Accessor(this._classObject, this._classXML);
            this._constant = new Constant(this._classObject, this._classXML);
            this._variable = new Variable(this._classObject, this._classXML);
            this._method = new Method(this._classObject, this._classXML);
            this._namespacepath = String(this._classXML.@name).replace("::", ".");
            var namespacefull:Array = this._namespacepath.split(".");
            this._className = namespacefull[(namespacefull.length - 1)];
        }

        public function get staticVariable():StaticVariable
        {
            return (this._staticVariable);
        }

        public function get staticConstant():StaticConstant
        {
            return (this._staticConstant);
        }

        public function get staticMethod():StaticMethod
        {
            return (this._staticMethod);
        }

        public function get staticAccessor():StaticAccessor
        {
            return (this._staticAccessor);
        }

        public function get classObject():Class
        {
            return (this._class);
        }

        public function get accessor():Accessor
        {
            return (this._accessor);
        }

        public function get variable():Variable
        {
            return (this._variable);
        }

        public function get constant():Constant
        {
            return (this._constant);
        }

        public function get method():Method
        {
            return (this._method);
        }

        public function get namespacePath():String
        {
            return (this._namespacepath);
        }

        public function get className():String
        {
            return (this._className);
        }


    }
}//package zebra.system.reflection
