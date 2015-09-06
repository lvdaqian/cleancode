//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import zebra.content.GameContent;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getDefinitionByName;
    import flash.utils.Dictionary;
    import zebra.content.*;

    class GameSingleClass extends GameContentItem 
    {

        public function GameSingleClass(content:GameContent)
        {
            _gameContent = content;
        }

        public function add(cls:*):void
        {
            var clss:Class;
            var key:String = getQualifiedClassName(cls).split("::").join(".");
            if (_data[key] == null)
            {
                clss = (getDefinitionByName(key) as Class);
                _data[key] = new (clss)();
            };
        }

        public function get(classORpackname:*)
        {
            return (_data[classORpacknameUtil(classORpackname)]);
        }

        public function contain(classORpackname:*):Boolean
        {
            return (!((this.get(classORpackname) == null)));
        }

        public function remove(classORpackname:*):void
        {
            delete _data[classORpacknameUtil(classORpackname)];
        }

        public function clear():void
        {
            _data = new Dictionary();
        }


    }
}//package zebra.content
