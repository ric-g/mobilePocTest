Ext.define('cv.profile.phone'
    extend: 'Ext.app.Profile'
    config: 
      name: 'phone'
      controllers: ['cv.controller.phone.main','cv.controller.phone.page']
    isActive: ->
      return Ext.os.is.Desktop || Ext.os.is.Phone;
    launch: ->
      console.log Date.now() + ' cv.profile.Phone launch'
      Ext.create('cv.view.phone.main');
)