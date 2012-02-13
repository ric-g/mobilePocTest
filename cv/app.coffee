Ext.ns('Cv')
Ext.Loader.setConfig
    enabled: false
Ext.application
    name: 'Cv'
    #appFolder: 'cv'
    #defaultTarget: 'viewport'
    init: ->
     console.log Date.now()+' init application'
    profiles: ['Tablet', 'Phone']
    launch: ->
     console.log Date.now()+' application launch ' +Ext.os.deviceType
     console.log("DetermineOrientation:"+Ext.Viewport.determineOrientation()
                +"; WindowWidth:"+Ext.Viewport.getWindowWidth()
                +"; WindowHeigh"+Ext.Viewport.getWindowHeight()
                +"; WindowOuterHeight"+Ext.Viewport.getWindowOuterHeight())
     ###
     mainModel = Ext.create('Cv.model.Main'
        userId: 'ba72658'
        menuId: 'main'
     )
     ###
     Ext.create('Ext.data.Store'
      model: 'Cv.model.Main'
      storeId: 'mainStore'
     )
     mainStore = Ext.data.StoreManager.lookup('mainStore');
     ###
     mainStore.setData(Ext.create('Cv.model.Main'
        userId: 'ba72658'
        menuId: 'main'
     ))
     ###
     #MainModel = Ext.ModelManager.getModel('Cv.model.Main');
     #console.log new MainModel()
     #mainModel.set('userId','1')

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)