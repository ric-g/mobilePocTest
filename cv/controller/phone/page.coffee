Ext.define('Cv.controller.phone.Page'
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
  if options.id is 'navBackBtn'
   return;
  console.log options
  console.log 'Page Controller redirectPage'
  @redirectTo('pages/index/' + options.id)
 changePage: (id)->
  console.log "change page" + id
  mainModel = Ext.ModelManager.getModel('Cv.model.Main');
  #mainModel.changeMenu(id);
  if id is 'menu-MarketBuzz'
   #@getMain().setItems([Ext.create('Cv.view.page.marketBuzz')])
   @getMain().setItems([{xtype:'panel',html:"It's marketbuzz page."}])
  else if id is 'menu-Research'
   #@getMain().setItems([Ext.create('Cv.view.page.research')])
   @getMain().setItems([{xtype:'panel',html:"It's research page."}])
  else if id is 'menu-FX'
   @getMain().setItems([{xtype:'panel',html:"It's FX page."}])
 init: ->
  console.log 'Page Controller init'
  @callParent()
)