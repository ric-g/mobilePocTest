Ext.define('cv.profile.Phone'
    extend: 'Ext.app.Profile'
    config: 
      name: 'Phone'
    isActive: ->
      return Ext.os.is.Desktop;
    launch: ->
      console.log Date.now() + ' cv.profile.Phone launch'
      Ext.create('cv.viewport.phone.main');
    
)