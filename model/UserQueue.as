//Created by Action Script Viewer - http://www.buraks.com/asv
package model
{
    import zebra.core.GameModel;
    import util.BidInfoParse;

    public class UserQueue extends GameModel 
    {

        public var userInitPos:int = 15;
        public var serverTargetPos:int = 5;
        private var _waitCount:int = 0;
        public var serverUpdatePos:int = 6;


        public function get waitCount():int
        {
            return (this._waitCount);
        }

        public function createWaitCount():void
        {
            this._waitCount = (this.serverTargetPos - this.userInitPos);
            trace("_waitCount", this.serverTargetPos, this.userInitPos, "==", this._waitCount);
        }

        public function getPos():int
        {
            if (BidInfoParse.userUpdatePos >= this.serverTargetPos)
            {
                return (100);
            };
            return (((1 - ((this.serverTargetPos - BidInfoParse.userUpdatePos) / (this.serverTargetPos - this.userInitPos))) * 100));
        }


    }
}//package model
