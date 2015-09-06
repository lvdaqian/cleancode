//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.input
{
    import flash.events.EventDispatcher;
    import flash.display.Stage;
    import flash.geom.Point;
    import zebra.events.TaskActionEvent;
    import zebra.Game;
    import zebra.events.GameMouseEvent;

    [Event(name="updateMousePosition", type="zebra.events.GameMouseEvent")]
    public class MouseInput extends EventDispatcher 
    {

        private var _enabled:Boolean;
        private var _stage:Stage;
        private var mouseInputTaskAction:MouseInputTaskAction;
        public var prevPoint:Point;
        public var currentPoint:Point;

        public function MouseInput(stage:Stage)
        {
            this._enabled = true;
            this._stage = stage;
            this.mouseInputTaskAction = new MouseInputTaskAction(this._stage);
            this.mouseInputTaskAction.addEventListener(TaskActionEvent.COMPLETE, this._updateMousePointLogic);
            Game.TimeUpdate.addTaskAction(this.mouseInputTaskAction);
        }

        public function dispose():void
        {
            Game.TimeUpdate.removeTaskAction(this.mouseInputTaskAction);
        }

        private function _updateMousePointLogic(e:TaskActionEvent):void
        {
            var mouseInputEvent:GameMouseEvent;
            if (this._enabled)
            {
                if ((((this.prevPoint == null)) && ((this.currentPoint == null))))
                {
                    this.currentPoint = MouseInputTaskAction(e.target).mousePoint;
                }
                else
                {
                    this.prevPoint = this.currentPoint;
                    this.currentPoint = MouseInputTaskAction(e.target).mousePoint;
                    if (!(this.currentPoint.equals(this.prevPoint)))
                    {
                        mouseInputEvent = new GameMouseEvent(GameMouseEvent.UpdateMousePosition);
                        mouseInputEvent.prevPoint = this.prevPoint;
                        mouseInputEvent.currentPoint = this.currentPoint;
                        this.dispatchEvent(mouseInputEvent);
                    };
                };
            };
        }

        public function get changePoint():Point
        {
            if (this.prevPoint == null)
            {
                return (new Point(0, 0));
            };
            return (new Point((this.currentPoint.x - this.prevPoint.x), (this.currentPoint.y - this.prevPoint.y)));
        }

        public function get enabled():Boolean
        {
            return (this._enabled);
        }

        public function set enabled(value:Boolean):void
        {
            this._enabled = value;
            if (value)
            {
                this.currentPoint = new Point(this._stage.mouseX, this._stage.mouseY);
            }
            else
            {
                this.prevPoint = (this.currentPoint = null);
            };
        }

        public function reset():void
        {
            this.prevPoint = new Point(this._stage.mouseX, this._stage.mouseY);
            this.currentPoint = new Point(this._stage.mouseX, this._stage.mouseY);
        }


    }
}//package zebra.input
