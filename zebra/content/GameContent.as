//Created by Action Script Viewer - http://www.buraks.com/asv
package zebra.content
{
    import zebra.system.util.FlashCookie;
    import zebra.loaders.IAssetLoader;
    import flash.utils.getQualifiedClassName;
    import zebra.Game;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.display.BitmapData;
    import flash.text.Font;

    public class GameContent 
    {

        private var _viewContent:GameViewContent;
        private var _modelContent:GameModelContent;
        private var _objectContent:ObjectContent;
        private var _assetLoaderContent:GameAssetLoaderContent;
        private var _singleClass:GameSingleClass;
        private var _cookies:FlashCookie;

        public function GameContent()
        {
            this._viewContent = new GameViewContent(this);
            this._modelContent = new GameModelContent(this);
            this._objectContent = new ObjectContent(this);
            this._assetLoaderContent = new GameAssetLoaderContent(this);
            this._singleClass = new GameSingleClass(this);
            this._cookies = new FlashCookie("@zebraGame");
        }

        public function addSingleClass(cls:*):void
        {
            this._singleClass.add(cls);
        }

        public function getSingleClass(cls:*)
        {
            return (this._singleClass.get(cls));
        }

        public function removeSingleClass(cls:*):void
        {
            this._singleClass.remove(cls);
        }

        public function addView(view:*):void
        {
            this._viewContent.add(view);
        }

        public function addUpdateView(view:*):void
        {
            var key:String = this.toClassStr(view);
            if (this._viewContent.contain(key))
            {
                this._viewContent.update(view);
            }
            else
            {
                this._viewContent.add(view);
            };
        }

        public function getView(classORpackname:*)
        {
            return (this._viewContent.get(classORpackname));
        }

        public function removeView(classORpackname:*):void
        {
            this._viewContent.remove(classORpackname);
        }

        public function addModel(model:*):void
        {
            var key:String = this.toClassStr(model);
            this._modelContent.add(model);
        }

        public function getModel(classORpackname:*)
        {
            return (this._modelContent.get(classORpackname));
        }

        public function removeModel(classORpackname:*):void
        {
            this._modelContent.remove(classORpackname);
        }

        public function addObject(key:String, object:Object):void
        {
            this._objectContent.add(key, object);
        }

        public function removeObject(key:String):void
        {
            return (this._objectContent.remove(key));
        }

        public function getObject(key:String)
        {
            return (this._objectContent.get(key));
        }

        public function addAssetLoader(key:String, assetLoader:IAssetLoader):void
        {
            this._assetLoaderContent.add(key, assetLoader);
        }

        public function removeAssetLoader(key:String):void
        {
            return (this._assetLoaderContent.remove(key));
        }

        public function getAssetLoader(key:String):IAssetLoader
        {
            return (this._assetLoaderContent.get(key));
        }

        public function clear():void
        {
            this._objectContent.clear();
            this._modelContent.clear();
            this._viewContent.clear();
            this._assetLoaderContent.clear();
        }

        private function toClassStr(cls:*):String
        {
            return (getQualifiedClassName(cls).split("::").join("."));
        }

        public function getClass(className:String):Class
        {
            return ((Game.currentApplicationDomain.getDefinition(className) as Class));
        }

        public function getLibTarget(className:String)
        {
            var c:Class = this.getClass(className);
            return (new (c)());
        }

        public function getMovieClipByClass(className:String):MovieClip
        {
            var cls:Class = this.getClass(className);
            return (MovieClip(new (cls)()));
        }

        public function getSimpleButtonByClass(className:String):SimpleButton
        {
            var cls:Class = this.getClass(className);
            return (SimpleButton(new (cls)()));
        }

        public function getBitmapDataByClass(className:String):BitmapData
        {
            var cls:Class = this.getClass(className);
            return (BitmapData(new (cls)()));
        }

        public function getFont(className:String):Font
        {
            var FontClass:Class = (this.getClass(className) as Class);
            Font.registerFont(FontClass);
            return (Font(new (FontClass)()));
        }

        public function get cookies():FlashCookie
        {
            return (this._cookies);
        }


    }
}//package zebra.content
