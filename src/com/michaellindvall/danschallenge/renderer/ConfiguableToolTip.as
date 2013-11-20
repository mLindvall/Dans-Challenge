package com.michaellindvall.danschallenge.renderer
{
  import mx.core.IToolTip;
  import flash.display.Sprite;
  import flash.accessibility.AccessibilityProperties;
  import flash.display.DisplayObjectContainer;
  import flash.geom.Transform;
  import mx.managers.ISystemManager;
  import flash.display.DisplayObject;
  import mx.containers.VBox;
  import flash.display.LoaderInfo;
  import flash.geom.Rectangle;
  import flash.display.Stage;
  import flash.events.Event;
  import flash.geom.Point;

  public class ConfiguableToolTip extends VBox implements IToolTip
  {
    public function ConfiguableToolTip()
    {
      //TODO: implement function
      super();
    }
     //  Implement required methods of the IToolTip interface
        public var _text:String;

        public function get text():String { 
            return _text; 
        } 
        public function set text(value:String):void {
        } 
  }
}