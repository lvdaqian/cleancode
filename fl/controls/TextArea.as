//Created by Action Script Viewer - http://www.buraks.com/asv
package fl.controls
{
    import fl.core.UIComponent;
    import fl.managers.IFocusManagerComponent;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import fl.core.InvalidationType;
    import flash.system.IME;
    import flash.text.TextLineMetrics;
    import fl.events.ScrollEvent;
    import flash.events.TextEvent;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.text.TextFieldType;
    import flash.ui.Keyboard;
    import fl.events.ComponentEvent;
    import flash.text.TextFormat;
    import fl.managers.IFocusManager;
    import flash.events.FocusEvent;

    [Event(name="change", type="flash.events.Event")]
    [Event(name="textInput", type="flash.events.TextEvent")]
    [Event(name="enter", type="fl.events.ComponentEvent")]
    [Event(name="scroll", type="fl.events.ScrollEvent")]
    [Style(name="upSkin", type="Class")]
    [Style(name="disabledSkin", type="Class")]
    [Style(name="textPadding", type="Number", format="Length")]
    [Style(name="embedFonts", type="Boolean")]
    public class TextArea extends UIComponent implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"TextArea_upSkin",
            "disabledSkin":"TextArea_disabledSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":3,
            "embedFonts":false
        };
        protected static const SCROLL_BAR_STYLES:Object = {
            "downArrowDisabledSkin":"downArrowDisabledSkin",
            "downArrowDownSkin":"downArrowDownSkin",
            "downArrowOverSkin":"downArrowOverSkin",
            "downArrowUpSkin":"downArrowUpSkin",
            "upArrowDisabledSkin":"upArrowDisabledSkin",
            "upArrowDownSkin":"upArrowDownSkin",
            "upArrowOverSkin":"upArrowOverSkin",
            "upArrowUpSkin":"upArrowUpSkin",
            "thumbDisabledSkin":"thumbDisabledSkin",
            "thumbDownSkin":"thumbDownSkin",
            "thumbOverSkin":"thumbOverSkin",
            "thumbUpSkin":"thumbUpSkin",
            "thumbIcon":"thumbIcon",
            "trackDisabledSkin":"trackDisabledSkin",
            "trackDownSkin":"trackDownSkin",
            "trackOverSkin":"trackOverSkin",
            "trackUpSkin":"trackUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };
        public static var createAccessibilityImplementation:Function;

        public var textField:TextField;
        protected var _editable:Boolean = true;
        protected var _wordWrap:Boolean = true;
        protected var _horizontalScrollPolicy:String = "auto";
        protected var _verticalScrollPolicy:String = "auto";
        protected var _horizontalScrollBar:UIScrollBar;
        protected var _verticalScrollBar:UIScrollBar;
        protected var background:DisplayObject;
        protected var _html:Boolean = false;
        protected var _savedHTML:String;
        protected var textHasChanged:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        public function get horizontalScrollBar():UIScrollBar
        {
            return (this._horizontalScrollBar);
        }

        public function get verticalScrollBar():UIScrollBar
        {
            return (this._verticalScrollBar);
        }

        [Inspectable(defaultValue="true", verbose="1")]
        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            mouseChildren = this.enabled;
            invalidate(InvalidationType.STATE);
        }

        [Inspectable(defaultValue="")]
        public function get text():String
        {
            return (this.textField.text);
        }

        public function set text(_arg_1:String):void
        {
            if (((componentInspectorSetting) && ((_arg_1 == ""))))
            {
                return;
            };
            this.textField.text = _arg_1;
            this._html = false;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
            this.textHasChanged = true;
        }

        [Inspectable]
        public function get htmlText():String
        {
            return (this.textField.htmlText);
        }

        public function set htmlText(_arg_1:String):void
        {
            if (((componentInspectorSetting) && ((_arg_1 == ""))))
            {
                return;
            };
            if (_arg_1 == "")
            {
                this.text = "";
                return;
            };
            this._html = true;
            this._savedHTML = _arg_1;
            this.textField.htmlText = _arg_1;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
            this.textHasChanged = true;
        }

        [Inspectable(defaultValue="false")]
        public function get condenseWhite():Boolean
        {
            return (this.textField.condenseWhite);
        }

        public function set condenseWhite(_arg_1:Boolean):void
        {
            this.textField.condenseWhite = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        [Inspectable(defaultValue="auto", enumeration="auto,on,off")]
        public function get horizontalScrollPolicy():String
        {
            return (this._horizontalScrollPolicy);
        }

        public function set horizontalScrollPolicy(_arg_1:String):void
        {
            this._horizontalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        [Inspectable(defaultValue="auto", enumeration="auto,on,off")]
        public function get verticalScrollPolicy():String
        {
            return (this._verticalScrollPolicy);
        }

        public function set verticalScrollPolicy(_arg_1:String):void
        {
            this._verticalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get horizontalScrollPosition():Number
        {
            return (this.textField.scrollH);
        }

        public function set horizontalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            this.textField.scrollH = _arg_1;
        }

        public function get verticalScrollPosition():Number
        {
            return (this.textField.scrollV);
        }

        public function set verticalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            this.textField.scrollV = _arg_1;
        }

        public function get textWidth():Number
        {
            drawNow();
            return (this.textField.textWidth);
        }

        public function get textHeight():Number
        {
            drawNow();
            return (this.textField.textHeight);
        }

        public function get length():Number
        {
            return (this.textField.text.length);
        }

        [Inspectable(defaultValue="")]
        public function get restrict():String
        {
            return (this.textField.restrict);
        }

        public function set restrict(_arg_1:String):void
        {
            if (((componentInspectorSetting) && ((_arg_1 == ""))))
            {
                _arg_1 = null;
            };
            this.textField.restrict = _arg_1;
        }

        [Inspectable(defaultValue="0")]
        public function get maxChars():int
        {
            return (this.textField.maxChars);
        }

        public function set maxChars(_arg_1:int):void
        {
            this.textField.maxChars = _arg_1;
        }

        public function get maxHorizontalScrollPosition():int
        {
            return (this.textField.maxScrollH);
        }

        public function get maxVerticalScrollPosition():int
        {
            return (this.textField.maxScrollV);
        }

        [Inspectable(defaultValue="true")]
        public function get wordWrap():Boolean
        {
            return (this._wordWrap);
        }

        public function set wordWrap(_arg_1:Boolean):void
        {
            this._wordWrap = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        public function get selectionBeginIndex():int
        {
            return (this.textField.selectionBeginIndex);
        }

        public function get selectionEndIndex():int
        {
            return (this.textField.selectionEndIndex);
        }

        public function get displayAsPassword():Boolean
        {
            return (this.textField.displayAsPassword);
        }

        public function set displayAsPassword(_arg_1:Boolean):void
        {
            this.textField.displayAsPassword = _arg_1;
        }

        [Inspectable(defaultValue="true")]
        public function get editable():Boolean
        {
            return (this._editable);
        }

        public function set editable(_arg_1:Boolean):void
        {
            this._editable = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        public function get imeMode():String
        {
            return (IME.conversionMode);
        }

        public function set imeMode(_arg_1:String):void
        {
            _imeMode = _arg_1;
        }

        public function get alwaysShowSelection():Boolean
        {
            return (this.textField.alwaysShowSelection);
        }

        public function set alwaysShowSelection(_arg_1:Boolean):void
        {
            this.textField.alwaysShowSelection = _arg_1;
        }

        override public function drawFocus(_arg_1:Boolean):void
        {
            if (focusTarget != null)
            {
                focusTarget.drawFocus(_arg_1);
                return;
            };
            super.drawFocus(_arg_1);
        }

        public function getLineMetrics(_arg_1:int):TextLineMetrics
        {
            return (this.textField.getLineMetrics(_arg_1));
        }

        public function setSelection(_arg_1:int, _arg_2:int):void
        {
            this.textField.setSelection(_arg_1, _arg_2);
        }

        public function appendText(_arg_1:String):void
        {
            this.textField.appendText(_arg_1);
            invalidate(InvalidationType.DATA);
        }

        override protected function configUI():void
        {
            super.configUI();
            tabChildren = true;
            this.textField = new TextField();
            addChild(this.textField);
            this.updateTextFieldType();
            this._verticalScrollBar = new UIScrollBar();
            this._verticalScrollBar.name = "V";
            this._verticalScrollBar.visible = false;
            this._verticalScrollBar.focusEnabled = false;
            copyStylesToChild(this._verticalScrollBar, SCROLL_BAR_STYLES);
            this._verticalScrollBar.addEventListener(ScrollEvent.SCROLL, this.handleScroll, false, 0, true);
            addChild(this._verticalScrollBar);
            this._horizontalScrollBar = new UIScrollBar();
            this._horizontalScrollBar.name = "H";
            this._horizontalScrollBar.visible = false;
            this._horizontalScrollBar.focusEnabled = false;
            this._horizontalScrollBar.direction = ScrollBarDirection.HORIZONTAL;
            copyStylesToChild(this._horizontalScrollBar, SCROLL_BAR_STYLES);
            this._horizontalScrollBar.addEventListener(ScrollEvent.SCROLL, this.handleScroll, false, 0, true);
            addChild(this._horizontalScrollBar);
            this.textField.addEventListener(TextEvent.TEXT_INPUT, this.handleTextInput, false, 0, true);
            this.textField.addEventListener(Event.CHANGE, this.handleChange, false, 0, true);
            this.textField.addEventListener(KeyboardEvent.KEY_DOWN, this.handleKeyDown, false, 0, true);
            this._horizontalScrollBar.scrollTarget = this.textField;
            this._verticalScrollBar.scrollTarget = this.textField;
            addEventListener(MouseEvent.MOUSE_WHEEL, this.handleWheel, false, 0, true);
        }

        protected function updateTextFieldType():void
        {
            this.textField.type = ((((this.enabled) && (this._editable))) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
            this.textField.selectable = this.enabled;
            this.textField.wordWrap = this._wordWrap;
            this.textField.multiline = true;
        }

        protected function handleKeyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                dispatchEvent(new ComponentEvent(ComponentEvent.ENTER, true));
            };
        }

        protected function handleChange(_arg_1:Event):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new Event(Event.CHANGE, true));
            invalidate(InvalidationType.DATA);
        }

        protected function handleTextInput(_arg_1:TextEvent):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT, true, false, _arg_1.text));
        }

        protected function handleScroll(_arg_1:ScrollEvent):void
        {
            dispatchEvent(_arg_1);
        }

        protected function handleWheel(_arg_1:MouseEvent):void
        {
            if (((!(this.enabled)) || (!(this._verticalScrollBar.visible))))
            {
                return;
            };
            this._verticalScrollBar.scrollPosition = (this._verticalScrollBar.scrollPosition - (_arg_1.delta * this._verticalScrollBar.lineScrollSize));
            dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, (_arg_1.delta * this._verticalScrollBar.lineScrollSize), this._verticalScrollBar.scrollPosition));
        }

        protected function setEmbedFont()
        {
            var _local_1:Object = getStyleValue("embedFonts");
            if (_local_1 != null)
            {
                this.textField.embedFonts = _local_1;
            };
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.STATE))
            {
                this.updateTextFieldType();
            };
            if (isInvalid(InvalidationType.STYLES))
            {
                this.setStyles();
                this.setEmbedFont();
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                this.drawTextFormat();
                this.drawBackground();
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.DATA))
            {
                this.drawLayout();
            };
            super.draw();
        }

        protected function setStyles():void
        {
            copyStylesToChild(this._verticalScrollBar, SCROLL_BAR_STYLES);
            copyStylesToChild(this._horizontalScrollBar, SCROLL_BAR_STYLES);
        }

        protected function drawTextFormat():void
        {
            var _local_1:Object = UIComponent.getStyleDefinition();
            var _local_2:TextFormat = ((this.enabled) ? (_local_1.defaultTextFormat as TextFormat) : (_local_1.defaultDisabledTextFormat as TextFormat));
            this.textField.setTextFormat(_local_2);
            var _local_3:TextFormat = (getStyleValue(((this.enabled) ? "textFormat" : "disabledTextFormat")) as TextFormat);
            if (_local_3 != null)
            {
                this.textField.setTextFormat(_local_3);
            }
            else
            {
                _local_3 = _local_2;
            };
            this.textField.defaultTextFormat = _local_3;
            this.setEmbedFont();
            if (this._html)
            {
                this.textField.htmlText = this._savedHTML;
            };
        }

        protected function drawBackground():void
        {
            var _local_1:DisplayObject = this.background;
            var _local_2:String = ((this.enabled) ? "upSkin" : "disabledSkin");
            this.background = getDisplayObjectInstance(getStyleValue(_local_2));
            if (this.background != null)
            {
                addChildAt(this.background, 0);
            };
            if (((((!((_local_1 == null))) && (!((_local_1 == this.background))))) && (contains(_local_1))))
            {
                removeChild(_local_1);
            };
        }

        protected function drawLayout():void
        {
            var _local_1:Number = Number(getStyleValue("textPadding"));
            this.textField.x = (this.textField.y = _local_1);
            this.background.width = width;
            this.background.height = height;
            var _local_2:Number = height;
            var _local_3:Boolean = this.needVScroll();
            var _local_4:Number = (width - ((_local_3) ? this._verticalScrollBar.width : 0));
            var _local_5:Boolean = this.needHScroll();
            if (_local_5)
            {
                _local_2 = (_local_2 - this._horizontalScrollBar.height);
            };
            this.setTextSize(_local_4, _local_2, _local_1);
            if (((((_local_5) && (!(_local_3)))) && (this.needVScroll())))
            {
                _local_3 = true;
                _local_4 = (_local_4 - this._verticalScrollBar.width);
                this.setTextSize(_local_4, _local_2, _local_1);
            };
            if (_local_3)
            {
                this._verticalScrollBar.visible = true;
                this._verticalScrollBar.x = (width - this._verticalScrollBar.width);
                this._verticalScrollBar.height = _local_2;
                this._verticalScrollBar.visible = true;
                this._verticalScrollBar.enabled = this.enabled;
            }
            else
            {
                this._verticalScrollBar.visible = false;
            };
            if (_local_5)
            {
                this._horizontalScrollBar.visible = true;
                this._horizontalScrollBar.y = (height - this._horizontalScrollBar.height);
                this._horizontalScrollBar.width = _local_4;
                this._horizontalScrollBar.visible = true;
                this._horizontalScrollBar.enabled = this.enabled;
            }
            else
            {
                this._horizontalScrollBar.visible = false;
            };
            this.updateScrollBars();
            addEventListener(Event.ENTER_FRAME, this.delayedLayoutUpdate, false, 0, true);
        }

        protected function delayedLayoutUpdate(_arg_1:Event):void
        {
            if (this.textHasChanged)
            {
                this.textHasChanged = false;
                this.drawLayout();
                return;
            };
            removeEventListener(Event.ENTER_FRAME, this.delayedLayoutUpdate);
        }

        protected function updateScrollBars()
        {
            this._horizontalScrollBar.update();
            this._verticalScrollBar.update();
            this._verticalScrollBar.enabled = this.enabled;
            this._horizontalScrollBar.enabled = this.enabled;
            this._horizontalScrollBar.drawNow();
            this._verticalScrollBar.drawNow();
        }

        protected function needVScroll():Boolean
        {
            if (this._verticalScrollPolicy == ScrollPolicy.OFF)
            {
                return (false);
            };
            if (this._verticalScrollPolicy == ScrollPolicy.ON)
            {
                return (true);
            };
            return ((this.textField.maxScrollV > 1));
        }

        protected function needHScroll():Boolean
        {
            if (this._horizontalScrollPolicy == ScrollPolicy.OFF)
            {
                return (false);
            };
            if (this._horizontalScrollPolicy == ScrollPolicy.ON)
            {
                return (true);
            };
            return ((this.textField.maxScrollH > 0));
        }

        protected function setTextSize(_arg_1:Number, _arg_2:Number, _arg_3:Number):void
        {
            var _local_4:Number = (_arg_1 - (_arg_3 * 2));
            var _local_5:Number = (_arg_2 - (_arg_3 * 2));
            if (_local_4 != this.textField.width)
            {
                this.textField.width = _local_4;
            };
            if (_local_5 != this.textField.height)
            {
                this.textField.height = _local_5;
            };
        }

        override protected function isOurFocus(_arg_1:DisplayObject):Boolean
        {
            return ((((_arg_1 == this.textField)) || (super.isOurFocus(_arg_1))));
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            setIMEMode(true);
            if (_arg_1.target == this)
            {
                stage.focus = this.textField;
            };
            var _local_2:IFocusManager = focusManager;
            if (_local_2)
            {
                if (this.editable)
                {
                    _local_2.showFocusIndicator = true;
                };
                _local_2.defaultButtonEnabled = false;
            };
            super.focusInHandler(_arg_1);
            if (this.editable)
            {
                setIMEMode(true);
            };
        }

        override protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            var _local_2:IFocusManager = focusManager;
            if (_local_2)
            {
                _local_2.defaultButtonEnabled = true;
            };
            this.setSelection(0, 0);
            super.focusOutHandler(_arg_1);
            if (this.editable)
            {
                setIMEMode(false);
            };
        }


    }
}//package fl.controls
