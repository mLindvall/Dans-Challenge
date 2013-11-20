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
  public class PurchaseOrder extends EventDispatcher {
    public function PurchaseOrder(value:Number = NaN) {
      super();
      if (!isNaN(value)) {
        _invoiceNumber = value;
      }
    }

    private var _invoiceNumber:Number;

    [ArrayElementType("com.michaellindvall.danschallenge.valueobject.Item")]
    private var _items:ArrayCollection = new ArrayCollection();

    /**
    * get the invoice number
    *
    * @return Number
    */
    [Bindable(event = "invoiceNumberChange")]
    public function get invoiceNumber():Number {
      return _invoiceNumber;
    }

    /**
    * set the invoice number
    *
    * @param value Number
    */
    public function set invoiceNumber(value:Number):void {
      if (!isNaN(value)) {
        _invoiceNumber = value;
        dispatchEvent(new Event("invoiceNumberChange"));
      }
    }

    /**
    * get the collection of items
    *
    * @return ArrayCollection
    */
    [Bindable(event = "itemsChange")]
    public function get items():ArrayCollection {
      return _items;
    }

    /**
    * sets the items
    *
    * @param value ArrayCollection of items
    */
    public function set items(value:ArrayCollection):void {
      _items = value;
      dispatchEvent(new Event("itemsChange"));
    }
  }
}
