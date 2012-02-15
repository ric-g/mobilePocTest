(function() {

  Ext.define('Cv.view.phone.Page', {
    extend: 'Ext.Panel',
    xtype: 'cvPhoneMainPage',
    config: {
      width: "100%",
      height: "500px",
      style: "background-color:#ffee00",
      layout: {
        type: 'vbox'
      },
      scrollable: {
        direction: 'vertical',
        directionLock: true
      },
      id: 'phoneMainPage',
      items: [
        {
          xtype: 'panel',
          html: "It's main page",
          flex: 1
        }
      ]
    },
    initialize: function() {
      console.log('page initialize');
      return this.callParent();
    }
  });

}).call(this);
