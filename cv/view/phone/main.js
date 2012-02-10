(function() {

  Ext.define('Cv.view.phone.Main', {
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
    initialize: function() {
      console.log(Date.now() + ' Cv.view.phone.Main initialize');
      return this.callParent();
    }
  });

}).call(this);
