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
      var mainStore;
      console.log(Date.now() + ' application launch ' + Ext.os.deviceType);
      console.log("DetermineOrientation:" + Ext.Viewport.determineOrientation() + "; WindowWidth:" + Ext.Viewport.getWindowWidth() + "; WindowHeigh:" + Ext.Viewport.getWindowHeight() + "; WindowOuterHeight:" + Ext.Viewport.getWindowOuterHeight());
      alert(Ext.Viewport.determineOrientation() + "; width:" + Ext.Viewport.getSize().width + '; height' + Ext.Viewport.getSize().height);
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

}).call(this);
