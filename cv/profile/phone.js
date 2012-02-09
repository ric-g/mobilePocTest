(function() {

  Ext.define('cv.profile.phone', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'phone',
      controllers: ['cv.controller.phone.main', 'cv.controller.phone.page']
    },
    isActive: function() {
      return Ext.os.is.Desktop || Ext.os.is.Phone;
    },
    launch: function() {
      console.log(Date.now() + ' cv.profile.Phone launch');
      return Ext.create('cv.view.phone.main');
    }
  });

}).call(this);
