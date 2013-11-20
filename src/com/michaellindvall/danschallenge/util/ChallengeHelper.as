/*############################################################################*/
/*                                                                            */
/* @author mlin014                                                            */
/*                                                                            */
/*############################################################################*/

package com.michaellindvall.danschallenge.util {

  import com.michaellindvall.danschallenge.valueobject.Component;
  import com.michaellindvall.danschallenge.valueobject.ComponentA;
  import com.michaellindvall.danschallenge.valueobject.ComponentB;
  import com.michaellindvall.danschallenge.valueobject.Item;
  import com.michaellindvall.danschallenge.valueobject.PurchaseOrder;
  
  import mx.collections.ArrayCollection;

  public class ChallengeHelper {

    public function ChallengeHelper() {
      var po:PurchaseOrder = null;
      for (var i:int = 0; i < 20; i++) {
        po = new PurchaseOrder(1000 + i);
        var item:Item;
        for (var k:int = 0; k < (i*2+1); k++) {
          item = new Item();
          item.itemDescription = (5 +(k * i)).toString() + " description";
          item.itemNo = 5 +(k * i);
          var compA:ComponentA;
          var compB:ComponentB;
          for (var l:int = 0; l < 3;l++) {
            compA = new ComponentA();
            compA.description = l.toString();
            compA.amount = Math.random() * (1 + 5 - l) + l;
            item.componentAList.addItem(compA);
            item.componentACount += compA.amount;
            compB = new ComponentB();
            compB.description = l.toString();
            compB.amount = compA.amount;
            item.componentBList.addItem(compB);
            item.componentBCount += compB.amount;
          }
          po.items.addItem(item);
        }
        
        _poList.addItem(po);

      }
    }

    [ArrayElementType("com.michaellindvall.danschallenge.valueobject.PurchaseOrder")]
    private var _poList:ArrayCollection = new ArrayCollection();

    public function get poList():ArrayCollection {
      return _poList;
    }
  }
}
