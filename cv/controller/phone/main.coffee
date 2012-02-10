Ext.define('Cv.controller.phone.Main'
 extend: 'Ext.app.Controller'
 config:
  id: 'cvControllerPhoneMain'
  refs:
   main: '#phoneMainPage'
 init: ->
  console.log 'Main Phone Controller init'
  @callParent()
  Ext.Viewport.on('orientationchange',@onOrientationChange)
 onOrientationChange: (viewport, orientation, width, height)->
  console.log 'Orientation Change'
)