(function() {

  Ext.define('Cv.controller.tablet.Main', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerTabletMain',
      refs: {
        main: '#tabletMainPage',
        backBtn: '#navBackBtn'
      },
      control: {
        backBtn: {
          tap: "doBack"
        }
      }
    },
    init: function() {
      console.log('Main Tablet Controller init');
      this.callParent();
      return Ext.Viewport.on('orientationchange', this.onOrientationChange);
    },
    doBack: function(obj) {
      return console.log('click back btn');
    },
    onOrientationChange: function(viewport, orientation, width, height) {
      var cvMarketBuzzpage;
      console.log('Orientation Change: ' + orientation + ";" + width + ";" + height);
      cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzPage');
      if (cvMarketBuzzpage) {
        return cvMarketBuzzpage.doOrientationChange(orientation);
      }
    }
  });

}).call(this);
