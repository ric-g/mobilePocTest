(function() {

  Ext.define('cv.profile.Phone', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'Phone',
      controllers: ['cv.controller.page']
    },
    isActive: function() {
      return Ext.os.is.Desktop;
    },
    launch: function() {
      console.log(Date.now() + ' cv.profile.Phone launch');
      return Ext.create('cv.viewport.phone.main');
    }
  });

}).call(this);
