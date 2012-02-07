(function() {
  var doOnReady;

  Ext.ns('cv', 'cv.views', 'cv.controllers', 'cv.profile');

  Ext.application({
    name: 'cv',
    init: function() {
      return console.log(Date.now() + ' init application');
    },
    profiles: ['Tablet', 'Phone'],
    launch: function() {
      return console.log(Date.now() + ' launch');
    }
  });

  doOnReady = function(fn, scope, options) {
    return console.log(Date.now() + ' onready');
  };

  Ext.onReady(doOnReady);

}).call(this);
