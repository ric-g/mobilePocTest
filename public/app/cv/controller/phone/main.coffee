Ext.define('cv.controller.phone.main'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerMain'
  refs:
   main: '#mainPage'
 init: ->
  console.log 'Main Phone Controller init'
  Ext.Viewport.on('orientationchange',@onOrientationChange)
 onOrientationChange: (viewport, orientation, width, height)->
  console.log 'Orientation Change'
)