Ext.ns('cv','cv.view','cv.controller','cv.profile')
Ext.Loader.setConfig
    enabled: false
Ext.application
    name: 'cv'
    #appFolder: 'cv'
    #defaultTarget: 'viewport'
    init: ->
     console.log Date.now()+' init application'
    profiles: ['tablet', 'phone']
    launch: ->
     console.log Date.now()+' application launch ' +Ext.os.deviceType
     console.log("DetermineOrientation:"+Ext.Viewport.determineOrientation()
                +"; WindowWidth:"+Ext.Viewport.getWindowWidth()
                +"; WindowHeigh"+Ext.Viewport.getWindowHeight()
                +"; WindowOuterHeight"+Ext.Viewport.getWindowOuterHeight())

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)