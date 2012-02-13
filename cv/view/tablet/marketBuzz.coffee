Ext.define('Cv.view.tablet.MarketBuzz'
 extend: 'Ext.Panel'
 config:
  id: 'cvMarketBuzzPage'
  width: "100%"
  style: "background-color:#ffffff"
  layout: 
   type: "hbox"
  ###
  items: [
   {xtype: 'cvPortal',flex: 1,style: "background-color:#eeddee", id: 'cvMarketBuzzpage1',html: "It's marketBuzz portal 1"}
   {
       xtype: 'panel'
       flex: 2
       layout:
           type: 'vbox'
       items: [
           {xtype: 'panel',html: "It's marketBuzz portal 2",flex: 1,style: "background-color:#adceef",id: 'cvMarketBuzzpage2'}
           {xtype: 'panel',html: "It's marketBuzz portal 3",flex: 1,style: "background-color:#0dceef",id: 'cvMarketBuzzpage3'}
       ]
   }
  ]
  ###
  listeners: [
    {
      event: 'doOrientationChange'
      fn: (orientation)->
       console.log 'page marketBuzz doOrientationChange'
       console.log orientation
       @setItems(@getPageItems(orientation));
      buffer: 500
      scope: this,
    }
  ]
 getLandscapeItems: ()->
  console.log 'marketBuzz getLandscapeItems'
  #if isInitialize is true
  return [
           {xtype: 'cvPortal',flex: 2,style: "background-color:#eeddee", id: 'cvMarketBuzzpage1',html: "It's marketBuzz portal 1"}
           {xtype: 'panel',html: "It's marketBuzz portal 2",flex: 1,style: "background-color:#adceef",id: 'cvMarketBuzzpage2'}
           {xtype: 'panel',html: "It's marketBuzz portal 3",flex: 1,style: "background-color:#0dceef",id: 'cvMarketBuzzpage3'}
         ]
  ###
  return [
          Ext.getCmp('cvMarketBuzzpage1')
          items: [
           Ext.getCmp('cvMarketBuzzpage2')
           Ext.getCmp('cvMarketBuzzpage3')
          ]
         ]
  ###
 getPortraitItems: ()->
  console.log 'marketBuzz getPortraitItems'
  return [
          {xtype: 'cvPortal',flex: 2,style: "background-color:#eeddee", id: 'cvMarketBuzzpage1',html: "It's marketBuzz portal 1"}
          {
           xtype: 'panel'
           flex: 1
           layout:
            type: 'vbox'
           items: [
            {xtype: 'panel',html: "It's marketBuzz portal 2",flex: 1,style: "background-color:#adceef",id: 'cvMarketBuzzpage2'}
            {xtype: 'panel',html: "It's marketBuzz portal 3",flex: 1,style: "background-color:#0dceef",id: 'cvMarketBuzzpage3'}
           ]
          }
         ]
 getPageItems: (orientation)->
     console.log 'marketBuzz getItems'
     if orientation is 'landscape'
         return @getLandscapeItems()
     return @getPortraitItems()
 ###
 doOrientationChange: (orientation)->
  console.log 'page marketBuzz doOrientationChange'
  @setItems(@getPageItems(orientation));
 ###
 initialize: ->
  orientation = Ext.Viewport.determineOrientation()
  @setItems(@getPageItems(orientation));
  #@callParent.apply(this,arguments)
  @callParent()
  console.log 'page marketBuzz initialize'
)
