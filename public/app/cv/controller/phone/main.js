(function() {

  Ext.define('cv.controller.phone.main', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerMain',
      refs: {
        main: '#mainPage'
      }
    },
    init: function() {
      console.log('Main Phone Controller init');
      return Ext.Viewport.on('orientationchange', this.onOrientationChange);
    },
    onOrientationChange: function(viewport, orientation, width, height) {
      return console.log('Orientation Change');
    }
  });

}).call(this);
