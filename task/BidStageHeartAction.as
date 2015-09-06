//Created by Action Script Viewer - http://www.buraks.com/asv
package task
{
    import zebra.thread.task.TaskAction;
    import zebra.Game;
    import model.BidStageUserModel;
    import view.BidStageView;
    import zebra.system.collections.FlashBytesReader;
    import zebra.system.net.SocketThreadParam;

    public class BidStageHeartAction extends TaskAction 
    {


        override public function execute():void
        {
            super.execute();
            Game.Hack.gc();
            var userModel:BidStageUserModel = (Game.Content.getModel(BidStageUserModel) as BidStageUserModel);
            if (userModel != null)
            {
                userModel.sendTimespan = new Date();
                BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.receive("0-0", this.Reader0to0Handler);
                BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.send("0-0", userModel.bytes0_0);
            };
        }

        private function Reader0to0Handler(data:SocketThreadParam):void
        {
            var bytesReader:FlashBytesReader = data.bytesReader.clone();
            var receiveData2to2:String = bytesReader.readString();
            var userModel:BidStageUserModel = (Game.Content.getModel(BidStageUserModel) as BidStageUserModel);
            userModel.getTimespan = new Date();
            userModel.timespan = (userModel.getTimespan - userModel.sendTimespan).toString();
            BidStageView(Game.Content.getView(BidStageView)).socketControl.socket.destroy("0-0", this.Reader0to0Handler);
        }


    }
}//package task
