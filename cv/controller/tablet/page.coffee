Ext.define('Cv.controller.tablet.Page'
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
  if options.id is 'navBackBtn'
   return;
  console.log options
  console.log 'Page Controller redirectPage'
  @redirectTo('pages/index/' + options.id)
 changePage: (id)->
  mainModel = Ext.ModelManager.getModel('Cv.model.Main');
  #mainModel.changeMenu(id);
  #mainModel.set('menuId',id)
  if id is 'menu-MarketBuzz'
   @getMain().setItems([Ext.create('Cv.view.tablet.MarketBuzz')])
  else if id is 'menu-Research'
   @getMain().setItems([Ext.create('Cv.view.tablet.Research')])
  else if id is 'menu-FX'
   @getMain().setItems([{xtype:'panel',html:"It's FX page."}])
 init: ->
  console.log 'Page Controller init'
  @callParent()
)