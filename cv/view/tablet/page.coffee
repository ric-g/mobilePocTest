
Ext.define('Cv.view.tablet.Page'
 extend: 'Ext.Panel'
 xtype: 'cvTabletMainPage'
 config:
  width: "100%"
  height: "768px"
  style: "background-color:#ffee00"
  layout: 
   type: 'hbox'
  scrollable: 
   direction: 'vertical',
   directionLock: true
  id: 'tabletMainPage'
  #html: "<p>It's main page</p>"
  items: [
   {xtype: 'panel',html: "It's main page",flex: 1}
  ]
 initialize: ->
  console.log 'tablet page initialize'
  @callParent()
)
