//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.system.util
{
    import flash.net.SharedObject;

    public class FlashCookie 
    {

        private var _timeOut:uint;
        private var _name:String;
        private var _sharedObject:SharedObject;

        public function FlashCookie($name:String="@zebraGame", $timeOut:uint=15768000, $clear:Boolean=false):void
        {
            this._name = $name;
            this._timeOut = $timeOut;
            this._sharedObject = SharedObject.getLocal(this._name, "/");
            if ($clear)
            {
                this.clearTimeOut();
            };
        }

        public function get name():String
        {
            return (this._name);
        }

        public function get timeOut():uint
        {
            return (this._timeOut);
        }

        public function clearTimeOut():void
        {
            var key:*;
            var obj:* = this._sharedObject.data.cookie;
            if (obj == undefined)
            {
                return;
            };
            for (key in obj)
            {
                if ((((((obj[key] == undefined)) || ((obj[key].time == undefined)))) || (this.isTimeOut(obj[key].time))))
                {
                    delete obj[key];
                };
            };
            this._sharedObject.data.cookie = obj;
            this._sharedObject.flush();
        }

        public function clear():void
        {
            this._sharedObject.clear();
        }

        public function putKey(key:String, value:*):void
        {
            var obj:Object;
            var today:Date = new Date();
            key = ("$key_" + key);
            if ((((this._sharedObject.data.cookie == undefined)) || ((this._sharedObject.data.cookie == null))))
            {
                obj = new Object();
                obj[key] = value;
                obj[key].time = today.getTime();
                this._sharedObject.data.cookie = obj;
            }
            else
            {
                this._sharedObject.data.cookie[key] = value;
                this._sharedObject.data.cookie[key].time = today.getTime();
            };
            this._sharedObject.flush();
        }

        public function getKey(key:String):Object
        {
            return (((this.contains(key)) ? this._sharedObject.data.cookie[("$key_" + key)] : null));
        }

        public function remove(key:String):void
        {
            if (this.contains(key))
            {
                delete this._sharedObject.data.cookie[("$key_" + key)];
                this._sharedObject.flush();
            };
        }

        public function contains(key:String):Boolean
        {
            key = ("$key_" + key);
            return (((!((this._sharedObject.data.cookie == undefined))) && (!((this._sharedObject.data.cookie[key] == undefined)))));
        }

        private function isTimeOut(time:Number):Boolean
        {
            var today:Date = new Date();
            return (((time + (this._timeOut * 1000)) < today.getTime()));
        }


    }
}//package zebra.system.util
