Ext.define('cv.profile.Phone'
    extend: 'Ext.app.Profile'
    config: 
      name: 'Phone'
      controllers: ['cv.controller.phone.main','cv.controller.page']
    isActive: ->
      return Ext.os.is.Desktop || Ext.os.is.Phone;
    launch: ->
      console.log Date.now() + ' cv.profile.Phone launch'
      Ext.create('cv.viewport.phone.main');
)