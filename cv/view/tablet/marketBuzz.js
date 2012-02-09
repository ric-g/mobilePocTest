(function() {

  Ext.define('cv.view.tablet.marketBuzz', {
    extend: 'Ext.Panel',
    config: {
      id: 'cvMarketBuzzpage',
      width: "100%",
      style: "background-color:#ffffff",
      layout: {
        type: "hbox"
      },
      items: [
        {
          xtype: 'panel',
          html: "It's marketBuzz portal 1",
          flex: 2,
          style: "background-color:#eeddee"
        }, {
          xtype: 'panel',
          html: "It's marketBuzz portal 2",
          flex: 1,
          style: "background-color:#adceef"
        }
      ]
    },
    initialize: function() {
      this.callParent.apply(this, arguments);
      return console.log('page marketBuzz initialize');
    }
  });

}).call(this);
