Ext.ns('cv','cv.view','cv.controllers','cv.profile')

Ext.application
    name: 'cv'
    #defaultTarget: 'viewport'
    init: ->
     console.log Date.now()+' init application'
    profiles: ['Tablet', 'Phone']
    launch: ->
        console.log Date.now()+' application launch'

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)