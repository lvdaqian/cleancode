//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import flash.utils.Dictionary;
    import zebra.content.GameContent;
    import flash.utils.getQualifiedClassName;

    class GameContentItem 
    {

        protected var _data:Dictionary;
        protected var _gameContent:GameContent;

        public function GameContentItem()
        {
            this._data = new Dictionary();
            super();
        }

        protected function classORpacknameUtil(value:*):String
        {
            var key:String;
            if ((value is Class))
            {
                key = getQualifiedClassName(value).split("::").join(".");
            }
            else
            {
                key = value;
            };
            return (key);
        }


    }
}//package zebra.content
