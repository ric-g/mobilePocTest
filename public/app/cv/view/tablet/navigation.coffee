Ext.define('cv.view.tablet.navigation'
 extend: 'Ext.navigation.View'
 xtype: 'cvTabletNavigation'
 config:
  id: 'cvNavigationID'
  navigationBar:
   docked: 'top'
   items: [
    {
     xtype: 'button'
     layout: 'fit'
     text: 'back'
     ui: 'back'
     handler: ->
      console.log 'back button'
     }
   ]
  items: [
   title: 'CitiVelocity'
   items: [
     {xtype: 'cvTabletMenu'}
     {xtype: 'cvMainPage'}
   ]
  ]
)


Ext.define('cv.view.tablet.Menu'
 extend: 'Ext.Toolbar'
 xtype: 'cvTabletMenu'
 config:
  id: 'cvMenu'
  #layout: 'fix'
  scroll: 'horizontal'
  cls: 'testbutton'
  #height: 40
  ###
  items: [
    id: 'menuBarButtons'
    itemId: 'menuBarButtons'
    xtype: 'segmentedbutton'
    items: [
     {text: 'text1'}
     {text: 'text2'}
    ]
  ]
  ###
 getMenuItems: ->
   console.log 'getMenuItems'
   menus = ['MarketBuzz','Research','FX']
   menuItems = []
   menus.forEach (page, i)=>
    newId = 'menu-'+page
    menuItems.push({id: newId, text: page, handler: @menuTapHandler})
    menuItems[0]['pressed'] = true
   return menuItems
 menuTapHandler: (button, e)->
   console.log (button._text + ' ' + button.id + ' is clicked')
 initialize: ()->
   console.log 'menu initialize'
   @setItems([
    id: 'menuBarButtons'
    itemId: 'menuBarButtons'
    xtype: 'segmentedbutton'
    allowMultiple: false
    items: @getMenuItems()
   ])
   #@superclass.constructor.apply(this,arguments)
   @callParent()

)