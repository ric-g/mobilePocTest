Ext.define('cv.controller.page'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerPage'
  refs:
   main: '#mainPage'
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
   @getMain().setItems([Ext.create('cv.view.page.marketBuzz')])
  else if id is 'menu-Research'
   @getMain().setItems([Ext.create('cv.view.page.research')])
  else if id is 'menu-FX'
   @getMain().setItems([{xtype:'panel',html:"It's FX page."}])
 init: ->
  console.log 'Page Controller init'
)