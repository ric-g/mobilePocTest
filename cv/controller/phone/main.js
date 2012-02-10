(function() {

  Ext.define('Cv.controller.phone.Main', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerPhoneMain',
      refs: {
        main: '#phoneMainPage'
      }
    },
    init: function() {
      console.log('Main Phone Controller init');
      this.callParent();
      return Ext.Viewport.on('orientationchange', this.onOrientationChange);
    },
    onOrientationChange: function(viewport, orientation, width, height) {
      return console.log('Orientation Change');
    }
  });

}).call(this);
