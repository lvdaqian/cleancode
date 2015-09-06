//Created by Action Script Viewer - http://www.buraks.com/asv
package ws
{
    import flash.display.MovieClip;
    import fl.controls.Button;
    import fl.controls.TextArea;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class LogWin extends MovieClip 
    {

        public var closeBut:MovieClip;//instance name
        public var localSaveBut:Button;//instance name
        public var log:TextArea;//instance name
        public var sentLogDataBut:Button;//instance name

        public function LogWin()
        {
            this.__setProp_sentLogDataBut_元件9_图层1_0();
            this.__setProp_localSaveBut_元件9_图层1_0();
        }

        function __setProp_sentLogDataBut_元件9_图层1_0()
        {
            try
            {
                this.sentLogDataBut["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.sentLogDataBut.emphasized = false;
            this.sentLogDataBut.enabled = true;
            this.sentLogDataBut.label = "提交到服务器";
            this.sentLogDataBut.labelPlacement = "right";
            this.sentLogDataBut.selected = false;
            this.sentLogDataBut.toggle = false;
            this.sentLogDataBut.visible = true;
            try
            {
                this.sentLogDataBut["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        function __setProp_localSaveBut_元件9_图层1_0()
        {
            try
            {
                this.localSaveBut["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.localSaveBut.emphasized = false;
            this.localSaveBut.enabled = true;
            this.localSaveBut.label = "保持到本地";
            this.localSaveBut.labelPlacement = "right";
            this.localSaveBut.selected = false;
            this.localSaveBut.toggle = false;
            this.localSaveBut.visible = true;
            try
            {
                this.localSaveBut["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package ws
