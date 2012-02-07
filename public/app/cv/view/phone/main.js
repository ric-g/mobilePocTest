(function() {

  Ext.define('cv.viewport.phone.main', {
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
      console.log(Date.now() + ' cv.viewport.phone.main constructor');
      return this.superclass.constructor.apply(this, arguments);
    }
  });

}).call(this);
