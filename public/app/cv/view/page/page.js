(function() {

  Ext.define('cv.view.page', {
    extend: 'Ext.Panel',
    xtype: 'cvMainPage',
    config: {
      width: "100%",
      height: "500px",
      style: "background-color:#ffee00",
      layout: {
        type: 'hbox'
      },
      id: 'mainPage',
      items: [
        {
          xtype: 'panel',
          html: "It's main page",
          flex: 1
        }
      ]
    },
    initialize: function() {
      return console.log('page initialize');
    }
  });

}).call(this);
