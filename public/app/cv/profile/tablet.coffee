Ext.define('cv.profile.Tablet'
    extend: 'Ext.app.Profile'
    config: 
      name: 'Tablet'
    isActive: ->
      return Ext.os.is.Android;
    launch: ->
      console.log Date.now() + ' cv.profile.Tablet launch'
      Ext.create('cv.viewport.tablet.main');
    
)