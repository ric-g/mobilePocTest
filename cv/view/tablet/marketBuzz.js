(function() {

  Ext.define('Cv.view.tablet.MarketBuzz', {
    extend: 'Ext.Panel',
    config: {
      id: 'cvMarketBuzzPage',
      width: "100%",
      style: "background-color:#ffffff",
      layout: {
        type: "hbox"
      },
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
      listeners: [
        {
          event: 'doOrientationChange',
          fn: function(orientation, obj) {
            var newPageItems;
            console.log('page marketBuzz doOrientationChange');
            console.log(orientation);
            alert(orientation);
            console.log(obj);
            newPageItems = obj.getPageItems(orientation);
            obj.removeAll(false, true);
            return obj.setItems(newPageItems);
          },
          buffer: 500,
          scope: this
        }
      ]
    },
    getLandscapeItems: function() {
      var cvMarketBuzzpage1, cvMarketBuzzpage2, cvMarketBuzzpage3;
      console.log('marketBuzz getLandscapeItems');
      cvMarketBuzzpage1 = Ext.getCmp('cvMarketBuzzpage1');
      if (cvMarketBuzzpage1) {
        Ext.layout.AbstractBox(cvMarketBuzzpage1, 1);
      } else {
        cvMarketBuzzpage1 = {
          xtype: 'cvPortal',
          flex: 1,
          style: "background-color:#eeddee",
          id: 'cvMarketBuzzpage1',
          html: "It's marketBuzz portal 1"
        };
      }
      cvMarketBuzzpage2 = Ext.getCmp('cvMarketBuzzpage2');
      if (cvMarketBuzzpage2) {
        Ext.layout.AbstractBox(cvMarketBuzzpage2, 1);
      } else {
        cvMarketBuzzpage2 = {
          xtype: 'cvPortal',
          html: "It's marketBuzz portal 2",
          flex: 1,
          style: "background-color:#adceef",
          id: 'cvMarketBuzzpage2'
        };
      }
      cvMarketBuzzpage3 = Ext.getCmp('cvMarketBuzzpage3');
      if (cvMarketBuzzpage3) {
        Ext.layout.AbstractBox(cvMarketBuzzpage3, 1);
      } else {
        cvMarketBuzzpage3 = {
          xtype: 'cvPortal',
          html: "It's marketBuzz portal 3",
          flex: 1,
          style: "background-color:#0dceef",
          id: 'cvMarketBuzzpage3'
        };
      }
      return [cvMarketBuzzpage1, cvMarketBuzzpage2, cvMarketBuzzpage3];
    },
    getPortraitItems: function() {
      var cvMarketBuzzpage1, cvMarketBuzzpage2, cvMarketBuzzpage3;
      console.log('marketBuzz getPortraitItems');
      if (cvMarketBuzzpage1) {
        Ext.layout.AbstractBox(cvMarketBuzzpage1, 1);
      } else {
        cvMarketBuzzpage1 = {
          xtype: 'cvPortal',
          flex: 1,
          style: "background-color:#eeddee",
          id: 'cvMarketBuzzpage1',
          html: "It's marketBuzz portal 1"
        };
      }
      cvMarketBuzzpage2 = Ext.getCmp('cvMarketBuzzpage2');
      if (cvMarketBuzzpage2) {
        Ext.layout.AbstractBox(cvMarketBuzzpage2, 1);
      } else {
        cvMarketBuzzpage2 = {
          xtype: 'cvPortal',
          html: "It's marketBuzz portal 2",
          flex: 1,
          style: "background-color:#adceef",
          id: 'cvMarketBuzzpage2'
        };
      }
      cvMarketBuzzpage3 = Ext.getCmp('cvMarketBuzzpage3');
      if (cvMarketBuzzpage3) {
        Ext.layout.AbstractBox(cvMarketBuzzpage3, 2);
      } else {
        cvMarketBuzzpage3 = {
          xtype: 'cvPortal',
          html: "It's marketBuzz portal 3",
          flex: 2,
          style: "background-color:#0dceef",
          id: 'cvMarketBuzzpage3'
        };
      }
      return [
        cvMarketBuzzpage1, {
          xtype: 'panel',
          flex: 2,
          layout: {
            type: 'vbox'
          },
          items: [cvMarketBuzzpage2, cvMarketBuzzpage3]
        }
      ];
    },
    getPageItems: function(orientation) {
      console.log('marketBuzz getItems');
      alert(orientation + "  getPageItems");
      if (orientation === 'landscape') return this.getLandscapeItems();
      return this.getPortraitItems();
    },
    /*
     doOrientationChange: (orientation)->
      console.log 'page marketBuzz doOrientationChange'
      @setItems(@getPageItems(orientation));
    */
    initialize: function() {
      var orientation;
      orientation = Ext.Viewport.determineOrientation();
      this.setItems(this.getPageItems(orientation));
      this.callParent();
      return console.log('page marketBuzz initialize');
    }
  });

}).call(this);
