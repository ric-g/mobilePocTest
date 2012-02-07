(function() {

  Ext.define('cv.viewport.tablet.main', {
    extend: 'Ext.Panel',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvNavigation'
        }
      ]
    },
    constructor: function(config) {
      console.log(Date.now() + ' cv.viewport.tablet.main constructor');
      return this.superclass.constructor.apply(this, arguments);
    }
  });

}).call(this);
