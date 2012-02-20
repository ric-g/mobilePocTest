(function() {
  var doOnReady;

  Ext.ns('Cv');

  Ext.Loader.setConfig({
    enabled: false
  });

  Ext.application({
    name: 'Cv',
    init: function() {
      return console.log(Date.now() + ' init application');
    },
    profiles: ['Tablet', 'Phone'],
    launch: function() {
      var mainStore, nativeAppOrientation;
      console.log(Date.now() + ' application launch ' + Ext.os.deviceType);
      console.log("DetermineOrientation:" + Ext.Viewport.determineOrientation() + "; WindowWidth:" + Ext.Viewport.getWindowWidth() + "; WindowHeigh:" + Ext.Viewport.getWindowHeight() + "; WindowOuterHeight:" + Ext.Viewport.getWindowOuterHeight());
      console.log(Ext.Viewport.determineOrientation() + "; width:" + Ext.Viewport.getSize().width + '; height' + Ext.Viewport.getSize().height);
      nativeAppOrientation = Ext.Viewport.determineOrientation();
      document.body.style.overflow = 'hidden';
      document.getElementsByTagName('html')[0].style.overflow = 'hidden';
      Ext.EventManager.onWindowResize(function() {
        var e;
        alert(nativeAppOrientation + ";" + Ext.Viewport.determineOrientation());
        if (nativeAppOrientation !== Ext.Viewport.determineOrientation()) {
          e = document.createEvent('Events');
          e.initEvent('orientationchange', true, false);
          document.dispatchEvent(e);
          return nativeAppOrientation = Ext.Viewport.determineOrientation();
        }
      }, this, {
        buffer: 500
      });
      /*
           mainModel = Ext.create('Cv.model.Main'
              userId: 'ba72658'
              menuId: 'main'
           )
      */
      Ext.create('Ext.data.Store', {
        model: 'Cv.model.Main',
        storeId: 'mainStore'
      });
      return mainStore = Ext.data.StoreManager.lookup('mainStore');
      /*
           mainStore.setData(Ext.create('Cv.model.Main'
              userId: 'ba72658'
              menuId: 'main'
           ))
      */
    }
  });

  doOnReady = function(fn, scope, options) {
    return console.log(Date.now() + ' onready');
  };

  Ext.onReady(doOnReady);

  this.getOrientation = function() {
    return Ext.Viewport.determineOrientation();
    return 'portrait';
  };

}).call(this);
