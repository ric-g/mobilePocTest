(function() {

  Ext.define('cv.profile.Tablet', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'Tablet',
      controllers: ['cv.controller.tablet.main', 'cv.controller.page']
    },
    isActive: function() {
      alert(Ext.os.is.Tablet);
      return Ext.os.is.Tablet;
    },
    launch: function() {
      alert('tablet');
      console.log(Date.now() + ' cv.profile.Tablet launch');
      return Ext.create('cv.viewport.tablet.main');
    }
  });

}).call(this);
