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
    resize: function(viewport, width, height, eOpts) {
      console.log(width + ";" + height);
      return console.log(eOpts);
    },
    onOrientationChange: function(viewport, orientation, width, height) {
      var cvMarketBuzzpage, cvResearchPage, h, w;
      console.log('Orientation Change: ' + orientation + ";width:" + width + ";height:" + height);
      w = Ext.Viewport.getSize().width;
      h = Ext.Viewport.getSize().height;
      console(Ext.Viewport.determineOrientation() + "; width:" + w + '; height' + h);
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
