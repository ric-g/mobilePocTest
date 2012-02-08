(function() {

  Ext.define('cv.view.page.N', {
    extend: 'Ext.Panel',
    config: {
      id: 'cvNpage',
      width: "100%",
      style: "background-color:#ffffff",
      layout: {
        type: "hbox"
      },
      items: [
        {
          xtype: 'panel',
          flex: 2,
          layout: {
            type: "vbox"
          },
          items: [
            {
              xtype: 'panel',
              html: "It's N portal 1",
              flex: 1,
              style: "background-color:#eeddee"
            }, {
              xtype: 'panel',
              html: "It's N portal 2",
              flex: 1,
              style: "background-color:#acdeef"
            }
          ],
          style: "background-color:#000000"
        }, {
          xtype: 'panel',
          html: "It's N portal 3",
          flex: 1,
          style: "background-color:#ddaee"
        }, {
          xtype: 'panel',
          html: "It's N portal 4",
          flex: 1,
          style: "background-color:#efddff"
        }
      ]
    },
    initialize: function() {
      this.callParent.apply(this, arguments);
      return console.log('page N initialize');
    }
  });

}).call(this);
