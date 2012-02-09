Ext.define('cv.controller.phone.page'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerPhonePage'
  refs:
   main: '#phoneMainPage'
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
  console.log "change page" + id
  if id is 'menu-MarketBuzz'
   #@getMain().setItems([Ext.create('cv.view.page.marketBuzz')])
   @getMain().setItems([{xtype:'panel',html:"It's marketbuzz page."}])
  else if id is 'menu-Research'
   #@getMain().setItems([Ext.create('cv.view.page.research')])
   @getMain().setItems([{xtype:'panel',html:"It's research page."}])
  else if id is 'menu-FX'
   @getMain().setItems([{xtype:'panel',html:"It's FX page."}])
 init: ->
  console.log 'Page Controller init'
)