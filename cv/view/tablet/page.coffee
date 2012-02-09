
Ext.define('cv.view.tablet.page'
 extend: 'Ext.Panel'
 xtype: 'cvTabletMainPage'
 config:
  width: "100%"
  height: "768px"
  style: "background-color:#ffee00"
  layout: 
   type: 'hbox'
  id: 'tabletMainPage'
  #html: "<p>It's main page</p>"
  items: [
   {xtype: 'panel',html: "It's main page",flex: 1}
  ]
 initialize: ->
  console.log 'tablet page initialize'
  
)
