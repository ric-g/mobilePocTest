
Ext.define('cv.view.phone.page'
 extend: 'Ext.Panel'
 xtype: 'cvPhoneMainPage'
 config:
  width: "100%"
  height: "500px"
  style: "background-color:#ffee00"
  layout: 
   type: 'vbox'
  scrollable: 
   direction: 'vertical',
   directionLock: true
  id: 'phoneMainPage'
  #html: "<p>It's main page</p>"
  items: [
   {xtype: 'panel',html: "It's main page",flex: 1}
  ]
 initialize: ->
  console.log 'page initialize'
  
)
