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
  if id is 'menu-M'
   @getMain().setItems([Ext.create('cv.view.page.M')]);
  else if id is 'menu-N'
   @getMain().setItems([Ext.create('cv.view.page.N')]);
 init: ->
  console.log 'Page Controller init'
)