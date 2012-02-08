Ext.define('cv.controller.page'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerPage'
  refs:
   main: '#mainPage'
   menuItems: 'button'
  routes: 
   'pages/index/:id': 'showPage'
  control:
   menuItems:
    tap: "changePage"
 changePage: (options)->
  console.log options
  console.log 'Page Controller changePage'
  if options.id is 'menu-M'
   @getMain().setItems([Ext.create('cv.view.page.M')]);
  else if options.id is 'menu-N'
   @getMain().setItems([Ext.create('cv.view.page.N')]);
  ###
  pageStr = "It's " + options._text + " page."
  @getMain().setItems([
   {xtype: 'panel',html: pageStr + "1",flex: 2}
   {xtype: 'panel',html: pageStr + "2",flex: 1}
  ])
  ###
 showPage:(id)->
  console.log 'show page ' + id
 init: ->
  console.log 'Page Controller init'
)