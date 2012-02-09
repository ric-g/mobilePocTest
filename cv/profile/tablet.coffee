Ext.define('cv.profile.tablet'
    extend: 'Ext.app.Profile'
    config: 
      name: 'tablet'
      controllers: ['cv.controller.tablet.main','cv.controller.tablet.page']
    isActive: ->
      return Ext.os.is.Tablet
    launch: ->
      console.log Date.now() + ' cv.profile.Tablet launch'
      Ext.create('cv.view.tablet.main');
    
)