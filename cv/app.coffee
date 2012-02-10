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
     Ext.create('Cv.model.Main'
        userId: 'ba72658'
        menuId: 'main'
     )

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)