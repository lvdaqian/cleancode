//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.input
{
    import zebra.thread.task.TaskAction;
    import flash.display.Stage;
    import flash.geom.Point;

    class MouseInputTaskAction extends TaskAction 
    {

        private var _stage:Stage;
        public var mousePoint:Point;

        public function MouseInputTaskAction(stage:Stage)
        {
            this._stage = stage;
        }

        override public function execute():void
        {
            super.execute();
            this.mousePoint = new Point(this._stage.mouseX, this._stage.mouseY);
            this.finish();
        }


    }
}//package zebra.input
