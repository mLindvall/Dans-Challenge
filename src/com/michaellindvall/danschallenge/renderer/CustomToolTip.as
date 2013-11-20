/*############################################################################*/
/*                                                                            */
/* @author mlin014                                                            */
/*                                                                            */
/*############################################################################*/

package com.michaellindvall.danschallenge.renderer {

  import mx.controls.AdvancedDataGrid;
  import mx.controls.DataGrid;
  import mx.controls.Label;
  import mx.controls.dataGridClasses.DataGridColumn;
  import mx.events.ToolTipEvent;

  /**
  * Creates a customized tooltip that displays as a datagrid
  * @see http://www.jusfortechies.com/flex/datagrid_tooltip.php
  */
  public class CustomToolTip extends Label {
    public function CustomToolTip() {
      super();
      this.toolTip = " ";
      this.addEventListener(ToolTipEvent.TOOL_TIP_CREATE, createCustomTip);
    }

    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
      super.updateDisplayList(unscaledWidth, unscaledHeight);
      //this.setStyle("color", "#0033CC");
      this.toolTip = getToolTip();
    }

    private function createCustomTip(event:ToolTipEvent):void {
      if (true) {
        var creditDetailsToolTip:ConfiguableToolTip = new ConfiguableToolTip();

        //Create a datagrid and set the dataprovider
        var tooltipDg:DataGrid = new DataGrid();
        tooltipDg.width = 270;
        tooltipDg.wordWrap = true;
        tooltipDg.horizontalScrollPolicy = "off";
        tooltipDg.verticalScrollPolicy = "off";
        var cols:Array = tooltipDg.columns;

        var dgCol:DataGridColumn;

        dgCol = new DataGridColumn("description");
        cols.push(dgCol);

        dgCol = new DataGridColumn("amount");
        cols.push(dgCol);

        tooltipDg.columns = cols;
        var adg:AdvancedDataGrid = listData.owner as AdvancedDataGrid;
        var func:Function = adg.columns[listData.columnIndex].dataTipFunction;
        tooltipDg.dataProvider = data[adg.columns[listData.columnIndex].dataTipField];

        //Add datagrid to the VBox
        creditDetailsToolTip.addChild(tooltipDg);

        //Set the VBox to the tooltip
        event.toolTip = creditDetailsToolTip;
      }
      else {
        event.toolTip = null;
      }
    }

    private function getToolTip():String {
      try {
        var adg:AdvancedDataGrid = listData.owner as AdvancedDataGrid;
        var func:Function = adg.columns[listData.columnIndex].dataTipFunction;

        if (func != null) {
          return func.call(this, this.data);
        }
        else if (adg.columns[listData.columnIndex].dataTipField.length) {
          return data[adg.columns[listData.columnIndex].dataTipField];
        }
        else {
          return "";
        }
      }
      catch (err:Error) {
        trace("error");
      }
      return "";
    }
  }
}
