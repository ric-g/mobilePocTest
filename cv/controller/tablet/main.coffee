Ext.define('Cv.controller.tablet.Main'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerTabletMain'
  refs:
   main: '#tabletMainPage'
   backBtn: '#navBackBtn'
  control:
   backBtn:
    tap: "doBack"
 init: ->
  console.log 'Main Tablet Controller init'
  @callParent()
  Ext.Viewport.on('orientationchange',@onOrientationChange)
 doBack: (obj)->
     console.log 'click back btn'
     #console.log(@getMain())
     ##mainModel = Ext.ModelManager.getModel('Cv.model.Main');
     #mainStore = Ext.data.StoreManager.lookup('mainStore');
     #console.log(mainStore)
     #menuId = mainModel.getMenuId()
     #if menuId is 'menu-MarketBuzz'
     #cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzPage')
     #cvMarketBuzzpage = Ext.ComponentQuery.query('#cvMarketBuzzPage')
     #console.log(cvMarketBuzzpage)
     #cvMarketBuzzpage.fireEvent('doOrientationChange','portrait')
     #cvMarketBuzzpage.doOrientationChange('portrait')
 onOrientationChange: (viewport, orientation, width, height)->
  console.log 'Orientation Change: ' + orientation + ";" + width + ";" + height
  cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzPage')
  #cvMarketBuzzpage = Ext.getCmp('cvRewpage')
  #cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzpage')
  if cvMarketBuzzpage
    cvMarketBuzzpage.fireEvent('doOrientationChange',orientation)
)