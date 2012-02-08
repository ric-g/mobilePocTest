Ext.ns('cv','cv.view','cv.controllers','cv.profile')

Ext.application
    name: 'cv'
    #defaultTarget: 'viewport'
    init: ->
     console.log Date.now()+' init application'
    profiles: ['Tablet', 'Phone']
    launch: ->
     alert 'application launch'
     alert Ext.os.deviceType
     console.log Date.now()+' application launch'

doOnReady = (fn,scope,options) ->
 alert "onready"
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)