(function() {

  Ext.define('Cv.view.tablet.Main', {
    extend: 'Ext.Panel',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvTabletNavigation'
        }
      ]
      /*
            scrollable: 
              direction: 'vertical',
              directionLock: true
      */
    },
    initialize: function() {
      console.log(Date.now() + ' Cv.view.tablet.Main initialize');
      return this.callParent();
    }
  });

}).call(this);
