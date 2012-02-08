(function() {
  var doOnReady;

  Ext.ns('cv', 'cv.view', 'cv.controllers', 'cv.profile');

  Ext.application({
    name: 'cv',
    init: function() {
      return console.log(Date.now() + ' init application');
    },
    profiles: ['Tablet', 'Phone'],
    launch: function() {
      return console.log(Date.now() + ' application launch');
    }
  });

  doOnReady = function(fn, scope, options) {
    alert("onready");
    return console.log(Date.now() + ' onready');
  };

  Ext.onReady(doOnReady);

}).call(this);
