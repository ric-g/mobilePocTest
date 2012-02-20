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
     console.log "DetermineOrientation:"+Ext.Viewport.determineOrientation()+"; WindowWidth:"+Ext.Viewport.getWindowWidth()+"; WindowHeigh:"+Ext.Viewport.getWindowHeight()+"; WindowOuterHeight:"+Ext.Viewport.getWindowOuterHeight()
     console.log Ext.Viewport.determineOrientation()+"; width:"+Ext.Viewport.getSize().width+'; height'+Ext.Viewport.getSize().height
     alert(Ext.feature.has.Orientation+';'+window.orientation)
     ###
     nativeAppOrientation = Ext.Viewport.determineOrientation();
     document.body.style.overflow='hidden';
     document.getElementsByTagName('html')[0].style.overflow='hidden';
     Ext.EventManager.onWindowResize( ->
      alert(nativeAppOrientation + ";"+Ext.Viewport.determineOrientation())
      if nativeAppOrientation isnt Ext.Viewport.determineOrientation()
       e = document.createEvent('Events');
       e.initEvent('orientationchange', true, false);
       document.dispatchEvent(e);
       nativeAppOrientation = Ext.Viewport.determineOrientation();
     this
     {buffer: 500}
     )
        ###
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

@getOrientation = ()->
 #w = Ext.Viewport.getSize().width
 #h = Ext.Viewport.getSize().height
 #if typeof w isnt 'Number' or typeof h isnt 'Number'
 return  Ext.Viewport.determineOrientation()
 #if w > h
  #return 'landscape'
 return 'portrait'
