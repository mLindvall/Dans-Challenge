/*############################################################################*/
/*                                                                            */
/* @author mlin014                                                            */
/*                                                                            */
/*############################################################################*/

package com.michaellindvall.danschallenge.valueobject {

  import flash.events.Event;
  import flash.events.EventDispatcher;

  public class Component extends EventDispatcher {
    public function Component() {
      super();
    }

    private var _amount:Number;

    private var _description:String;

    [Bindable(event = "amountChange")]
    public function get amount():Number {
      return _amount;
    }

    public function set amount(value:Number):void {
      if (!isNaN(value)) {
        _amount = value;
        dispatchEvent(new Event("amountChange"));
      }
    }

    [Bindable(event = "descriptionChange")]
    public function get description():String {
      return _description;
    }

    public function set description(value:String):void {
      _description = value;
      dispatchEvent(new Event("discriptionChange"));
    }
    
    /**
    * @private
    * override toString()
    */
    override public function toString():String {
      return description + ":\t" + amount.toFixed(2) + "\n";
    }
  }
}
