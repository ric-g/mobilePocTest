#namespace
Ext.ns('cv','cv.views','cv.controllers')

#seems most of properties are used for apple device
#Ext.setup
		#statusBarStyle:Sets the status bar style for fullscreen iPhone OS web apps
#    statusBarStyle: 'black-translucent'
#    onReady: ->
#        console.log 'test ready'

#Ext.setup: launch a basic application.
#if call Ext.setup, can't call Ext.application again
#Ext.application
#    name: 'cv'
#    launch: ->
#        console.log 'application test'


Ext.application
    name: 'cv'
    defaultTarget: 'viewport'
    init: ->
     console.log 'init application'
    controllers: ['cv.Controller.Page']
    launch: ->
        console.log 'launch'
        Ext.create('cv.Viewport')

Ext.define('cv.TitleBar',
 extend: 'Ext.TitleBar'
 xtype: 'cvTitleBar'
 docked: 'top'
 title: 'Citivelocity'
 height: 40
)

Ext.define('cv.Viewport',
 extend: 'Ext.Panel'
 alias: 'viewport'
 config: 
        fullscreen: true,
        layout: 'card',
        items: [
         #{xtype: 'cvTitleBar'}
         {xtype: 'cvNavigation'}
        ]
        
 
)

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

Ext.define('cv.Page'
 extend: 'Ext.Panel'
 config:
  pageId: ''
 initialize: ->
  console.log 'page initialize'
  
)

Ext.define('cv.Page.M'
 extend: 'cv.Page'
 initialize: ->
  @callParent.apply(this,arguments)
  console.log 'page M initialize'
)


Ext.define('cv.Controller.Page'
 extend: 'Ext.app.Controller'
 config:
  refs:
   nav: '#cvMenu'
 changePage: (options)->
  console.log 'Page Controller changePage'
 init: ->
  console.log 'Page Controller init'
)

doOnReady = (fn,scope,options) ->
 console.log 'onready'
Ext.onReady(doOnReady)