Ext.define('cv.view.page.M'
 extend: 'Ext.Panel'
 config:
  id: 'cvMpage'
  width: "100%"
  style: "background-color:#ffffff"
  layout: 
   type: "hbox"
  items: [
   {xtype: 'panel',html:"It's M portal 1",flex: 2,style: "background-color:#eeddee"}
   {xtype: 'panel',html: "It's M portal 2",flex: 1,style: "background-color:#adceef"}
  ]
 initialize: ->
  @callParent.apply(this,arguments)
  console.log 'page M initialize'
)
