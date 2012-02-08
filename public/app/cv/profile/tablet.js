(function() {

  Ext.define('cv.profile.Tablet', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'Tablet',
      controllers: ['cv.controller.tablet.main', 'cv.controller.page']
    },
    isActive: function() {
      return Ext.os.is.Android;
    },
    launch: function() {
      console.log(Date.now() + ' cv.profile.Tablet launch');
      return Ext.create('cv.viewport.tablet.main');
    }
  });

}).call(this);
