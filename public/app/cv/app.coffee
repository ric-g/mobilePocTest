Ext.ns('cv','cv.views','cv.controllers','cv.profile')

Ext.application
    name: 'cv'
    #defaultTarget: 'viewport'
    init: ->
     console.log Date.now()+' init application'
    profiles: ['Tablet', 'Phone']
    launch: ->
        console.log Date.now()+' launch'

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'
Ext.onReady(doOnReady)