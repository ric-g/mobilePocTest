(function() {

  Ext.define('cv.view.tablet.page', {
    extend: 'Ext.Panel',
    xtype: 'cvTabletMainPage',
    config: {
      width: "100%",
      height: "768px",
      style: "background-color:#ffee00",
      layout: {
        type: 'hbox'
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
      return console.log('tablet page initialize');
    }
  });

}).call(this);
