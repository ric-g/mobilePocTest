(function() {

  Ext.define('Cv.view.tablet.MarketBuzz', {
    extend: 'Ext.Panel',
    config: {
      id: 'cvMarketBuzzPage',
      width: "100%",
      style: "background-color:#ffffff",
      layout: {
        type: "hbox"
      }
      /*
        items: [
         {xtype: 'cvPortal',flex: 1,style: "background-color:#eeddee", id: 'cvMarketBuzzpage1',html: "It's marketBuzz portal 1"}
         {
             xtype: 'panel'
             flex: 2
             layout:
                 type: 'vbox'
             items: [
                 {xtype: 'panel',html: "It's marketBuzz portal 2",flex: 1,style: "background-color:#adceef",id: 'cvMarketBuzzpage2'}
                 {xtype: 'panel',html: "It's marketBuzz portal 3",flex: 1,style: "background-color:#0dceef",id: 'cvMarketBuzzpage3'}
             ]
         }
        ]
      */
    },
    getLandscapeItems: function() {
      console.log('marketBuzz getLandscapeItems');
      return [
        {
          xtype: 'cvPortal',
          flex: 2,
          style: "background-color:#eeddee",
          id: 'cvMarketBuzzpage1',
          html: "It's marketBuzz portal 1"
        }, {
          xtype: 'panel',
          html: "It's marketBuzz portal 2",
          flex: 1,
          style: "background-color:#adceef",
          id: 'cvMarketBuzzpage2'
        }, {
          xtype: 'panel',
          html: "It's marketBuzz portal 3",
          flex: 1,
          style: "background-color:#0dceef",
          id: 'cvMarketBuzzpage3'
        }
      ];
      /*
        return [
                Ext.getCmp('cvMarketBuzzpage1')
                items: [
                 Ext.getCmp('cvMarketBuzzpage2')
                 Ext.getCmp('cvMarketBuzzpage3')
                ]
               ]
      */
    },
    getPortraitItems: function() {
      console.log('marketBuzz getPortraitItems');
      return [
        {
          xtype: 'cvPortal',
          flex: 2,
          style: "background-color:#eeddee",
          id: 'cvMarketBuzzpage1',
          html: "It's marketBuzz portal 1"
        }, {
          xtype: 'panel',
          flex: 1,
          layout: {
            type: 'vbox'
          },
          items: [
            {
              xtype: 'panel',
              html: "It's marketBuzz portal 2",
              flex: 1,
              style: "background-color:#adceef",
              id: 'cvMarketBuzzpage2'
            }, {
              xtype: 'panel',
              html: "It's marketBuzz portal 3",
              flex: 1,
              style: "background-color:#0dceef",
              id: 'cvMarketBuzzpage3'
            }
          ]
        }
      ];
    },
    getPageItems: function(orientation) {
      console.log('marketBuzz getItems');
      if (orientation === 'landscape') return this.getLandscapeItems();
      return this.getPortraitItems();
    },
    doOrientationChange: function(orientation) {
      console.log('page marketBuzz doOrientationChange');
      return this.setItems(this.getPageItems(orientation));
    },
    initialize: function() {
      var orientation;
      orientation = Ext.Viewport.determineOrientation();
      this.setItems(this.getPageItems(orientation));
      this.callParent();
      return console.log('page marketBuzz initialize');
    }
  });

}).call(this);
