//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import view.KickOutPart;
    import view.BidInitView;

    public class ServerModel 
    {

        public var bootIP:String;
        public var iplist:Array;
        public var port:int = 0;
        public var changeCount:int = 0;
        private var _ipCurrentIndex:int = 0;
        private var _allowChangeCount:Boolean = false;

        public function ServerModel()
        {
            this.iplist = ["192.168.1.110", "10.100.2.11", "10.10.10.241", "10.100.2.10"];
            super();
        }

        public function setAllowChangeCount():void
        {
            this._allowChangeCount = true;
        }

        public function resetAllowChangeCount():void
        {
            this._allowChangeCount = false;
            this.changeCount = 0;
        }

        public function get ip():String
        {
            return (this.iplist[this._ipCurrentIndex]);
        }

        public function changeIP():void
        {
            var kickoutpart10:KickOutPart;
            if (this.changeCount > 9)
            {
                Main.isKickOut = true;
                kickoutpart10 = new KickOutPart(2);
                BidInitView.setWin(kickoutpart10);
            }
            else
            {
                this._ipCurrentIndex++;
                if (this._ipCurrentIndex >= this.iplist.length)
                {
                    this._ipCurrentIndex = 0;
                };
                if (this._allowChangeCount)
                {
                    this.changeCount++;
                };
                trace(("changeCount is:" + this.changeCount));
            };
        }


    }
}//package model
