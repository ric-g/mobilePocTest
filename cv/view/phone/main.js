(function() {

  Ext.define('cv.view.phone.main', {
    extend: 'Ext.Panel',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvPhoneNavigation'
        }
      ]
    },
    scrollable: {
      direction: 'vertical',
      directionLock: true
    },
    constructor: function(config) {
      console.log(Date.now() + ' cv.view.phone.main constructor');
      return this.superclass.constructor.apply(this, arguments);
    }
  });

}).call(this);
