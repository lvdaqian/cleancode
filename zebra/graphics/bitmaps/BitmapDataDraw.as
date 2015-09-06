//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.graphics.bitmaps
{
    import flash.display.DisplayObject;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;

    public class BitmapDataDraw 
    {

        private var _target:DisplayObject = null;
        private var _zoom:Number = 1;
        private var _horizontal:Boolean;
        private var _vertical:Boolean;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _width:Number = 0;
        private var _height:Number = 0;
        private var _full:Boolean;

        public function BitmapDataDraw($target:DisplayObject=null, $full:Boolean=false)
        {
            this._target = $target;
            this._full = $full;
        }

        public function render():BitmapData
        {
            var m:Matrix;
            if (this._target == null)
            {
                throw (new Error("没有显示对象"));
            };
            var _rect:Rectangle = this._target.getBounds(this._target.parent);
            var _w:Number = (((this._width == 0)) ? this._target.width : this._width);
            var _h:Number = (((this._height == 0)) ? this._target.height : this._height);
            _w = (_w * this._zoom);
            _h = (_h * this._zoom);
            var hm:int = (((this._horizontal == true)) ? -1 : 1);
            var vm:int = (((this._vertical == true)) ? -1 : 1);
            var hw:Number = (((this._horizontal == true)) ? _w : 0);
            var vh:Number = (((this._vertical == true)) ? _h : 0);
            var Data:BitmapData = new BitmapData(_w, _h, true, 0);
            if (this._full)
            {
                m = new Matrix(1, 0, 0, 1, (this._target.x - _rect.x), (this._target.y - _rect.y));
                m.scale((hm * this._zoom), (vm * this._zoom));
                m.translate(hw, vh);
                Data.draw(this._target, m);
            }
            else
            {
                m = new Matrix(1, 0, 0, 1, -(this._x), -(this._y));
                m.scale((hm * this._zoom), (vm * this._zoom));
                Data.draw(this._target, m);
            };
            return (Data);
        }

        public function renderTarget($target:DisplayObject):BitmapData
        {
            this._target = $target;
            return (this.render());
        }

        public function renderMobile(mobileRect:Rectangle):BitmapData
        {
            var m:Matrix;
            if (this._target == null)
            {
                throw (new Error("没有显示对象"));
            };
            var _rect:Rectangle = this._target.getBounds(this._target.parent);
            var _w:Number = mobileRect.width;
            var _h:Number = mobileRect.height;
            _w = (_w * this._zoom);
            _h = (_h * this._zoom);
            var hm:int = (((this._horizontal == true)) ? -1 : 1);
            var vm:int = (((this._vertical == true)) ? -1 : 1);
            var hw:Number = (((this._horizontal == true)) ? _w : 0);
            var vh:Number = (((this._vertical == true)) ? _h : 0);
            var Data:BitmapData = new BitmapData(_w, _h, false, 14934858);
            if (this._full)
            {
                m = new Matrix(1, 0, 0, 1, (this._target.x - _rect.x), (this._target.y - _rect.y));
                m.scale((hm * this._zoom), (vm * this._zoom));
                m.translate(hw, vh);
                Data.draw(this._target, m);
            }
            else
            {
                m = new Matrix(1, 0, 0, 1, -(this._x), -(this._y));
                m.scale((hm * this._zoom), (vm * this._zoom));
                Data.draw(this._target, m);
            };
            return (Data);
        }

        public function renderMovieClip():Vector.<BitmapData>
        {
            return (BitmapDataTool.MovieClipToBitmapData(this));
        }

        public function get zoom():Number
        {
            return (this._zoom);
        }

        public function set zoom(value:Number):void
        {
            this._zoom = value;
        }

        public function get horizontal():Boolean
        {
            return (this._horizontal);
        }

        public function set horizontal(value:Boolean):void
        {
            this._horizontal = value;
        }

        public function get vertical():Boolean
        {
            return (this._vertical);
        }

        public function set vertical(value:Boolean):void
        {
            this._vertical = value;
        }

        public function get x():Number
        {
            return (this._x);
        }

        public function set x(value:Number):void
        {
            this._x = value;
        }

        public function get y():Number
        {
            return (this._y);
        }

        public function set y(value:Number):void
        {
            this._y = value;
        }

        public function get width():Number
        {
            return (this._width);
        }

        public function set width(value:Number):void
        {
            this._width = value;
        }

        public function get height():Number
        {
            return (this._height);
        }

        public function set height(value:Number):void
        {
            this._height = value;
        }

        public function get full():Boolean
        {
            return (this._full);
        }

        public function set full(value:Boolean):void
        {
            this._full = value;
        }

        public function get target():DisplayObject
        {
            return (this._target);
        }

        public function set target(value:DisplayObject):void
        {
            this._target = value;
        }


    }
}//package zebra.graphics.bitmaps
