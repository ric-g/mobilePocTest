
Ext.define('cv.view.page'
 extend: 'Ext.Panel'
 xtype: 'cvMainPage'
 config:
  width: "100%"
  height: "500px"
  style: "background-color:#ffee00"
  layout: 
   type: 'hbox'
  id: 'mainPage'
  #html: "<p>It's main page</p>"
  items: [
   {xtype: 'panel',html: "It's main page",flex: 1}
  ]
 initialize: ->
  console.log 'page initialize'
  
)
