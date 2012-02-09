(function() {

  Ext.define('cv.profile.tablet', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'tablet',
      controllers: ['cv.controller.tablet.main', 'cv.controller.tablet.page']
    },
    isActive: function() {
      return Ext.os.is.Tablet;
    },
    launch: function() {
      console.log(Date.now() + ' cv.profile.Tablet launch');
      return Ext.create('cv.view.tablet.main');
    }
  });

}).call(this);
