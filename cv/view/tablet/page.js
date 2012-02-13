(function() {

  Ext.define('Cv.view.tablet.Page', {
    extend: 'Ext.Panel',
    xtype: 'cvTabletMainPage',
    config: {
      width: "100%",
      height: "768px",
      style: "background-color:#ffffff",
      layout: {
        type: 'hbox'
      },
      scrollable: {
        direction: 'vertical',
        directionLock: true
      },
      id: 'tabletMainPage',
      items: [
        {
          xtype: 'panel',
          html: "It's main page",
          flex: 1
        }
      ]
    },
    initialize: function() {
      console.log('tablet page initialize');
      return this.callParent();
    }
  });

}).call(this);
