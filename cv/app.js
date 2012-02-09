(function() {
  var doOnReady;

  Ext.ns('cv', 'cv.view', 'cv.controller', 'cv.profile');

  Ext.Loader.setConfig({
    enabled: false
  });

  Ext.application({
    name: 'cv',
    init: function() {
      return console.log(Date.now() + ' init application');
    },
    profiles: ['tablet', 'phone'],
    launch: function() {
      console.log(Date.now() + ' application launch ' + Ext.os.deviceType);
      return console.log("DetermineOrientation:" + Ext.Viewport.determineOrientation(), +"; WindowWidth:" + Ext.Viewport.getWindowWidth(), +"; WindowHeigh" + Ext.Viewport.getWindowHeight(), +"; WindowOuterHeight" + Ext.Viewport.getWindowOuterHeight());
    }
  });

  doOnReady = function(fn, scope, options) {
    return console.log(Date.now() + ' onready');
  };

  Ext.onReady(doOnReady);

}).call(this);
