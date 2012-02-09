(function() {

  Ext.define('cv.view.tablet.main', {
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
      console.log(Date.now() + ' cv.view.tablet.main constructor');
      return this.superclass.constructor.apply(this, arguments);
    }
  });

}).call(this);
