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
  #Ext.Viewport.on('resize',@resize)
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
     #if cvMarketBuzzpage
      #cvMarketBuzzpage.fireEvent('doOrientationChange','portrait', cvMarketBuzzpage)
     #cvMarketBuzzpage.fireEvent('doOrientationChange','landscape', cvMarketBuzzpage)
     #cvMarketBuzzpage.doOrientationChange('portrait')
     #cvResearchPage = Ext.getCmp('cvResearchPage')
     #if cvResearchPage
       #cvResearchPage.fireEvent('doOrientationChange','portrait', cvResearchPage)
 resize: ( viewport, width, height, eOpts )->
   console.log width+";"+height
   console.log eOpts
 onOrientationChange: (viewport, orientation, width, height)->
  console.log 'Orientation Change: ' + orientation + ";width:" + width + ";height:" + height
  w = Ext.Viewport.getSize().width
  h = Ext.Viewport.getSize().height
  console Ext.Viewport.determineOrientation()+"; width:"+w+'; height'+h
  cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzPage')
  cvResearchPage = Ext.getCmp('cvResearchPage')
  #cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzpage')
  if cvMarketBuzzpage
    cvMarketBuzzpage.fireEvent('doOrientationChange', cvMarketBuzzpage)
  if cvResearchPage
    cvResearchPage.fireEvent('doOrientationChange', cvResearchPage)
)