Ext.define('cv.controller.tablet.main'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerTabletMain'
  refs:
   main: '#mainPage'
 init: ->
  console.log 'Main Tablet Controller init'
  Ext.Viewport.on('orientationchange',@onOrientationChange)
 onOrientationChange: (viewport, orientation, width, height)->
  console.log 'Orientation Change'
)