//Created by Action Script Viewer - http://www.buraks.com/asv
package fl.controls
{
    import flash.display.DisplayObject;
    import fl.core.UIComponent;
    import flash.events.Event;
    import flash.events.TextEvent;
    import fl.core.InvalidationType;
    import fl.events.ScrollEvent;

    public class UIScrollBar extends ScrollBar 
    {

        private static var defaultStyles:Object = {};

        protected var _scrollTarget:DisplayObject;
        protected var inEdit:Boolean = false;
        protected var inScroll:Boolean = false;
        protected var _targetScrollProperty:String;
        protected var _targetMaxScrollProperty:String;


        public static function getStyleDefinition():Object
        {
            return (UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        override public function set minScrollPosition(_arg_1:Number):void
        {
            super.minScrollPosition = (((_arg_1)<0) ? 0 : _arg_1);
        }

        override public function set maxScrollPosition(_arg_1:Number):void
        {
            var _local_2:Number = _arg_1;
            if (this._scrollTarget != null)
            {
                _local_2 = Math.min(_local_2, this._scrollTarget[this._targetMaxScrollProperty]);
            };
            super.maxScrollPosition = _local_2;
        }

        public function get scrollTarget():DisplayObject
        {
            return (this._scrollTarget);
        }

        public function set scrollTarget(target:DisplayObject):void
        {
            if (this._scrollTarget != null)
            {
                this._scrollTarget.removeEventListener(Event.CHANGE, this.handleTargetChange, false);
                this._scrollTarget.removeEventListener(TextEvent.TEXT_INPUT, this.handleTargetChange, false);
                this._scrollTarget.removeEventListener(Event.SCROLL, this.handleTargetScroll, false);
            };
            this._scrollTarget = target;
            var blockProg:String;
            var textDir:String;
            var hasPixelVS:Boolean;
            if (this._scrollTarget != null)
            {
                try
                {
                    if (this._scrollTarget.hasOwnProperty("blockProgression"))
                    {
                        blockProg = this._scrollTarget["blockProgression"];
                    };
                    if (this._scrollTarget.hasOwnProperty("direction"))
                    {
                        textDir = this._scrollTarget["direction"];
                    };
                    if (this._scrollTarget.hasOwnProperty("pixelScrollV"))
                    {
                        hasPixelVS = true;
                    };
                }
                catch(e:Error)
                {
                    blockProg = null;
                    textDir = null;
                };
            };
            var scrollHoriz:Boolean = (this.direction == ScrollBarDirection.HORIZONTAL);
            var rot:Number = Math.abs(this.rotation);
            if (((scrollHoriz) && ((((blockProg == "rl")) || ((textDir == "rtl"))))))
            {
                if ((((getScaleY() > 0)) && ((rotation == 90))))
                {
                    x = (x + width);
                };
                setScaleY(-1);
            }
            else
            {
                if (((((!(scrollHoriz)) && ((blockProg == "rl")))) && ((textDir == "rtl"))))
                {
                    if ((((getScaleY() > 0)) && (!((rotation == 90)))))
                    {
                        y = (y + height);
                    };
                    setScaleY(-1);
                }
                else
                {
                    if (getScaleY() < 0)
                    {
                        if (scrollHoriz)
                        {
                            if (rotation == 90)
                            {
                                x = (x - width);
                            };
                        }
                        else
                        {
                            if (rotation != 90)
                            {
                                y = (y - height);
                            };
                        };
                    };
                    setScaleY(1);
                };
            };
            this.setTargetScrollProperties(scrollHoriz, blockProg, hasPixelVS);
            if (this._scrollTarget != null)
            {
                this._scrollTarget.addEventListener(Event.CHANGE, this.handleTargetChange, false, 0, true);
                this._scrollTarget.addEventListener(TextEvent.TEXT_INPUT, this.handleTargetChange, false, 0, true);
                this._scrollTarget.addEventListener(Event.SCROLL, this.handleTargetScroll, false, 0, true);
            };
            invalidate(InvalidationType.DATA);
        }

        [Inspectable]
        public function get scrollTargetName():String
        {
            return (this._scrollTarget.name);
        }

        public function set scrollTargetName(target:String):void
        {
            try
            {
                this.scrollTarget = parent.getChildByName(target);
            }
            catch(error:Error)
            {
                throw (new Error("ScrollTarget not found, or is not a valid target"));
            };
        }

        [Inspectable(defaultValue="vertical", type="list", enumeration="vertical,horizontal")]
        override public function get direction():String
        {
            return (super.direction);
        }

        override public function set direction(_arg_1:String):void
        {
            var _local_2:DisplayObject;
            if (isLivePreview)
            {
                return;
            };
            if (((!(componentInspectorSetting)) && (!((this._scrollTarget == null)))))
            {
                _local_2 = this._scrollTarget;
                this.scrollTarget = null;
            };
            super.direction = _arg_1;
            if (_local_2 != null)
            {
                this.scrollTarget = _local_2;
            }
            else
            {
                this.updateScrollTargetProperties();
            };
        }

        public function update():void
        {
            this.inEdit = true;
            this.updateScrollTargetProperties();
            this.inEdit = false;
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateScrollTargetProperties();
            };
            super.draw();
        }

        protected function updateScrollTargetProperties():void
        {
            var blockProg:String;
            var hasPixelVS:Boolean;
            var pageSize:Number;
            var minScroll:Number;
            var minScrollVValue:* = undefined;
            if (this._scrollTarget == null)
            {
                this.setScrollProperties(pageSize, minScrollPosition, maxScrollPosition);
                scrollPosition = 0;
            }
            else
            {
                blockProg = null;
                hasPixelVS = false;
                try
                {
                    if (this._scrollTarget.hasOwnProperty("blockProgression"))
                    {
                        blockProg = this._scrollTarget["blockProgression"];
                    };
                    if (this._scrollTarget.hasOwnProperty("pixelScrollV"))
                    {
                        hasPixelVS = true;
                    };
                }
                catch(e1:Error)
                {
                };
                this.setTargetScrollProperties((this.direction == ScrollBarDirection.HORIZONTAL), blockProg, hasPixelVS);
                if (this._targetScrollProperty == "scrollH")
                {
                    minScroll = 0;
                    try
                    {
                        if (((this._scrollTarget.hasOwnProperty("controller")) && (this._scrollTarget["controller"].hasOwnProperty("compositionWidth"))))
                        {
                            pageSize = this._scrollTarget["controller"]["compositionWidth"];
                        }
                        else
                        {
                            pageSize = this._scrollTarget.width;
                        };
                    }
                    catch(e2:Error)
                    {
                        pageSize = _scrollTarget.width;
                    };
                }
                else
                {
                    try
                    {
                        if (blockProg != null)
                        {
                            minScrollVValue = this._scrollTarget["pixelMinScrollV"];
                            if ((minScrollVValue is int))
                            {
                                minScroll = minScrollVValue;
                            }
                            else
                            {
                                minScroll = 1;
                            };
                        }
                        else
                        {
                            minScroll = 1;
                        };
                    }
                    catch(e3:Error)
                    {
                        minScroll = 1;
                    };
                    pageSize = 10;
                };
                this.setScrollProperties(pageSize, minScroll, this.scrollTarget[this._targetMaxScrollProperty]);
                scrollPosition = this._scrollTarget[this._targetScrollProperty];
            };
        }

        override public function setScrollProperties(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0):void
        {
            var _local_5:Number = _arg_3;
            var _local_6:Number = (((_arg_2)<0) ? 0 : _arg_2);
            if (this._scrollTarget != null)
            {
                _local_5 = Math.min(_arg_3, this._scrollTarget[this._targetMaxScrollProperty]);
            };
            super.setScrollProperties(_arg_1, _local_6, _local_5, _arg_4);
        }

        override public function setScrollPosition(_arg_1:Number, _arg_2:Boolean=true):void
        {
            super.setScrollPosition(_arg_1, _arg_2);
            if (!(this._scrollTarget))
            {
                this.inScroll = false;
                return;
            };
            this.updateTargetScroll();
        }

        protected function updateTargetScroll(_arg_1:ScrollEvent=null):void
        {
            if (this.inEdit)
            {
                return;
            };
            this._scrollTarget[this._targetScrollProperty] = scrollPosition;
        }

        protected function handleTargetChange(_arg_1:Event):void
        {
            this.inEdit = true;
            this.setScrollPosition(this._scrollTarget[this._targetScrollProperty], true);
            this.updateScrollTargetProperties();
            this.inEdit = false;
        }

        protected function handleTargetScroll(_arg_1:Event):void
        {
            if (inDrag)
            {
                return;
            };
            if (!(enabled))
            {
                return;
            };
            this.inEdit = true;
            this.updateScrollTargetProperties();
            scrollPosition = this._scrollTarget[this._targetScrollProperty];
            this.inEdit = false;
        }

        private function setTargetScrollProperties(_arg_1:Boolean, _arg_2:String, _arg_3:Boolean=false):void
        {
            if (_arg_2 == "rl")
            {
                if (_arg_1)
                {
                    this._targetScrollProperty = ((_arg_3) ? "pixelScrollV" : "scrollV");
                    this._targetMaxScrollProperty = ((_arg_3) ? "pixelMaxScrollV" : "maxScrollV");
                }
                else
                {
                    this._targetScrollProperty = "scrollH";
                    this._targetMaxScrollProperty = "maxScrollH";
                };
            }
            else
            {
                if (_arg_1)
                {
                    this._targetScrollProperty = "scrollH";
                    this._targetMaxScrollProperty = "maxScrollH";
                }
                else
                {
                    this._targetScrollProperty = ((_arg_3) ? "pixelScrollV" : "scrollV");
                    this._targetMaxScrollProperty = ((_arg_3) ? "pixelMaxScrollV" : "maxScrollV");
                };
            };
        }


    }
}//package fl.controls
