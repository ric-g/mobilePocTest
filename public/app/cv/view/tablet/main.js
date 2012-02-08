(function() {

  Ext.define('cv.viewport.tablet.main', {
    extend: 'Ext.Panel',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvTabletNavigation'
        }
      ]
    },
    constructor: function(config) {
      alert(Date.now() + ' cv.viewport.tablet.main constructor');
      return this.superclass.constructor.apply(this, arguments);
    }
  });

}).call(this);
