Ext.define('Cv.controller.phone.Page'
  extend: 'Ext.app.Controller'
  config:
    id: 'cvControllerPhonePage'
    refs:
      #main: '#phoneMainPage'
      menuItems: '#cvMenu button'
      loadlocalstorage: '#loadlocalstorage'
      savelocalstorage1: '#savelocalstorage1'
      savelocalstorage2: '#savelocalstorage2'
      #currentlocalstorage: '#currentlocalstorage'
      queryall: '#queryall'
      querybyid: '#querybyid'
      updatebyid: '#updatebyid'
      #querydataArea: '#querydataArea'
    routes: 
      'pages/index/:id': 'changePage'
    control:
      menuItems:
        tap: "redirectPage"
      loadlocalstorage: 
        tap: 'loadlocalstorage'
      savelocalstorage1: 
        tap: 'savelocalstorage1'
      savelocalstorage2: 
        tap: 'savelocalstorage2'
      queryall: 
        tap: 'queryall'
      querybyid: 
        tap: 'querybyid'
      updatebyid: 
        tap: 'updatebyid'
  redirectPage: (options)->
    if options.id is 'navBackBtn'
      return;
    console.log options
    console.log 'Page Controller redirectPage'
    @redirectTo('pages/index/' + options.id)
  changePage: (id)->
    console.log "change page" + id
    #mainModel = Ext.ModelManager.getModel('Cv.model.Main');
    main = Ext.ComponentQuery.query('#phoneMainPage')[0]
    #mainModel.changeMenu(id);
    if id is 'menu-MarketBuzz'
      main.setItems([Ext.create('Cv.view.phone.Page')])
      #@getMain().setItems([{xtype:'panel',html:"It's marketbuzz page."}])
    else if id is 'menu-Research'
      main.setItems([Ext.create('Cv.view.phone.Research')])
      #@getMain().setItems([{xtype:'panel',html:"It's research page."}])
    else if id is 'menu-FX'
      main.setItems([{xtype:'panel',html:"It's FX page."}])
    else
      main.setItems([{xtype:'panel',html:"It's main page."}])
  loadlocalstorage: ->
    if @.mainStore
      @.mainStore.load()
      #console.log(@.mainStore)
      d = @.mainStore.getData()
      out = []
      if d and d.items
        itemsArray  = d.items
        for i in itemsArray
          if i and i.data
            out.push i.data.menu
      #console.log(d.getData())
      #document.getElementById('currentlocalstorage').innerHTML = "Current localstorage: " + out.toString()
      currentlocalstorage = Ext.ComponentQuery.query('#currentlocalstorage')[0]
      currentlocalstorage.setHtml("Current localstorage: " + out.toString())
  savelocalstorage1: ->
    if @.mainStore
      menuData = ['MarketBuzz', 'Research']
      @.mainStore.load()
      @.mainStore.removeAll(true)
      for m in menuData
        @.mainStore.add({menu: m})
      @.mainStore.sync()
  savelocalstorage2: ->
    if @.mainStore
      menuData = ['MarketBuzz', 'Research', 'FX']
      @.mainStore.load()
      @.mainStore.removeAll(true)
      for m in menuData
        @.mainStore.add({menu: m})
      @.mainStore.sync()
  querybyid: ->
    if(CvDbUtil.cvdb)
      self = this
      CvDbUtil.transaction( (tx)->
        CvDbUtil.queryDB(
          tx
          'Portal'
          ' WHERE id = 1 '
          (tx, results)->
            self.querySuccess(tx, results, self)
          CvDbUtil.errorCB
        )
      CvDbUtil.errorCB
      ->
        console.log 'Transcation Successfully.'
      )
  querySuccess: (tx, results)->
    #console.log tx
    console.log results
    result = ''
    if results && results.rows && results.rows.length
      #console.log results.rows.item(0)
      length = results.rows.length-1
      for num in [0..length]
        item = results.rows.item(num)
        result += '<ul><li>id: ' + item['id'] + '</li><li>title: ' + item['title'] + '</li><li>data: ' + item['data'] + '</li></ul>'
    querydataArea = Ext.ComponentQuery.query('#querydataArea')[0]
    querydataArea.setHtml('<div>Data: </div><div>' + result + '</div>');
    #document.getElementById('querydataArea').innerHTML = '<div>Data: </div><div>' + result + '</div>'
    return
  queryall: ->
    if(CvDbUtil.cvdb)
      self = this
      CvDbUtil.transaction( (tx)->
        CvDbUtil.queryDB(
          tx
          'Portal'
          ''
          (tx, results)->
            self.querySuccess(tx, results)
          CvDbUtil.errorCB
        )
      CvDbUtil.errorCB
      ->
        console.log 'Transcation Successfully.'
      )
  updatebyid: ->
    if(CvDbUtil.cvdb)
      CvDbUtil.transaction( (tx)->
        tx.executeSql('UPDATE Portal SET data = "test data(Current time:'+Ext.Date.now()+')" WHERE id = 1')
      CvDbUtil.errorCB
      ->
        console.log 'Transcation Successfully.'
      )
  init: ->
    console.log 'Page Controller init'
    @.mainStore = Ext.create('Ext.data.Store'
      model: 'Cv.model.Main'
      storeId: 'mainStore'
    )
    @callParent()
)