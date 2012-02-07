Ext.define('cv.navigation'
 extend: 'Ext.navigation.View'
 xtype: 'cvNavigation'
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
     {dock: 'bottom', xtype: 'cvMenu'}
   ]
  ]
)


Ext.define('cv.Menu'
 extend: 'Ext.Toolbar'
 xtype: 'cvMenu'
 config:
  id: 'cvMenu'
  #layout: 'fix'
  scroll: 'horizontal'
  cls: 'testbutton'
  height: 40
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
   menus = ['M','N']
   menuItems = []
   menus.forEach (page, i)=>
    newId = 'menu-'+page
    menuItems.push({id: newId, text: page, handler: @menuTapHandler})
    menuItems[0]['pressed'] = true
   return menuItems
  menuTapHandler: (button, e)->
   console.log (button._text + ' ' + button.id + ' is clicked')
   console.log (e)
   ###
   Ext.dispatch(
    controller: 'page'
    action: 'index'
    id: button.id
    historyUrl: 'page/index/'+button.id
   )
   ###
  constructor: (config) ->
   console.log 'menu constructor'
   config.items=[
    id: 'menuBarButtons'
    itemId: 'menuBarButtons'
    xtype: 'segmentedbutton'
    allowMultiple: false
    items: @getMenuItems()
   ]
   @superclass.constructor.apply(this,arguments)

)