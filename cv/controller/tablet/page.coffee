Ext.define('cv.controller.tablet.page'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerTabletPage'
  refs:
   main: '#tabletMainPage'
   menuItems: 'button'
  routes: 
   'pages/index/:id': 'changePage'
  control:
   menuItems:
    tap: "redirectPage"
 redirectPage: (options)->
  console.log options
  console.log 'Page Controller redirectPage'
  @redirectTo('pages/index/' + options.id)
 changePage: (id)->
  if id is 'menu-MarketBuzz'
   @getMain().setItems([Ext.create('cv.view.tablet.marketBuzz')])
  else if id is 'menu-Research'
   @getMain().setItems([Ext.create('cv.view.tablet.research')])
  else if id is 'menu-FX'
   @getMain().setItems([{xtype:'panel',html:"It's FX page."}])
 init: ->
  console.log 'Page Controller init'
)