//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import flash.utils.Dictionary;
    import zebra.content.GameContent;
    import zebra.content.*;

    class ObjectContent 
    {

        private var _data:Dictionary;
        private var _gameContent:GameContent;

        public function ObjectContent(gameContent:GameContent)
        {
            this._data = new Dictionary();
            super();
            this._gameContent = gameContent;
        }

        public function add(key:*, value:Object):void
        {
            if (this._data[key] == null)
            {
                this._data[key] = value;
            };
        }

        public function get(key:*):Object
        {
            return (this._data[key]);
        }

        public function contain(key:*):Boolean
        {
            return (!((this._data[key] == null)));
        }

        public function remove(key:*):void
        {
            delete this._data[key];
        }

        public function clear():void
        {
            this._data = new Dictionary();
        }


    }
}//package zebra.content
