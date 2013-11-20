/*############################################################################*/
/*                                                                            */
/* @author mlin014                                                            */
/*                                                                            */
/*############################################################################*/

package com.michaellindvall.danschallenge.valueobject {

  import flash.events.Event;
  import flash.events.EventDispatcher;
  import mx.collections.ArrayCollection;

  [Bindable]
  public class Item extends EventDispatcher {
    public function Item() {
      super();
    }

    private var _componentACount:Number = 0;
    [ArrayElementType("com.michaellindvall.danschallenge.valueobject.ComponentA")]
    private var _componentAList:ArrayCollection = new ArrayCollection();
    private var _componentBCount:Number = 0;
    [ArrayElementType("com.michaellindvall.danschallenge.valueobject.ComponentB")]
    private var _componentBList:ArrayCollection = new ArrayCollection();
    private var _itemDescription:String;
    private var _itemNo:Number;

    [Bindable(event = "componentACountChange")]
    public function get componentACount():Number {
      return _componentACount;
    }

    public function set componentACount(value:Number):void {
      if (!isNaN(value)) {
        _componentACount = value;
        dispatchEvent(new Event("componentACountChange"));
      }
    }

    [Bindable(event = "componentAListChange")]
    public function get componentAList():ArrayCollection {
      return _componentAList;
    }

    public function set componentAList(value:ArrayCollection):void {
      _componentAList = value;
      dispatchEvent(new Event("componentAListChange"));
    }

    [Bindable(event = "componentBCountChange")]
    public function get componentBCount():Number {
      return _componentBCount;
    }

    public function set componentBCount(value:Number):void {
      if (!isNaN(value)) {
        _componentBCount = value;
        dispatchEvent(new Event("componentBCountChange"));
      }
    }

    [Bindable(event = "componentBListChange")]
    public function get componentBList():ArrayCollection {
      return _componentBList;
    }

    public function set componentBList(value:ArrayCollection):void {
      _componentBList = value;
      dispatchEvent(new Event("componentBListChange"));
    }

    [Bindable(event = "itemDiscriptionChange")]
    public function get itemDescription():String {
      return _itemDescription;
    }

    public function set itemDescription(value:String):void {
      _itemDescription = value;
      dispatchEvent(new Event("itemDescriptionChange"));
    }

    [Bindable(event = "itemNoChange")]
    public function get itemNo():Number {
      return _itemNo;
    }

    public function set itemNo(value:Number):void {
      if (!isNaN(value)) {
        _itemNo = value;
        dispatchEvent(new Event("itemNoChange"));
      }
    }
  }
}
