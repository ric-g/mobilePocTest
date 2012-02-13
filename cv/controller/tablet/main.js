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
      var cvMarketBuzzpage, cvResearchPage;
      console.log('Orientation Change: ' + orientation + ";" + width + ";" + height);
      alert(Ext.Viewport.determineOrientation() + ";" + orientation);
      cvMarketBuzzpage = Ext.getCmp('cvMarketBuzzPage');
      cvResearchPage = Ext.getCmp('cvResearchPage');
      if (cvMarketBuzzpage) {
        cvMarketBuzzpage.fireEvent('doOrientationChange', cvMarketBuzzpage);
      }
      if (cvResearchPage) {
        return cvResearchPage.fireEvent('doOrientationChange', cvResearchPage);
      }
    }
  });

}).call(this);
