(function() {

  Ext.define('Cv.view.phone.Research', {
    extend: 'Ext.Panel',
    xtype: 'cvPhoneResearchPage',
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
      id: 'phoneResearchPage',
      items: [
        {
          xtype: 'toolbar',
          title: 'Web Sql Storage',
          ui: 'light'
        }, {
          xtype: 'button',
          text: 'query all data',
          id: 'queryall'
        }, {
          xtype: 'button',
          text: 'query data by id',
          id: 'querybyid'
        }, {
          xtype: 'button',
          text: 'Update data by id',
          id: 'updatebyid'
        }, {
          xtype: 'panel',
          height: 100,
          html: "<div><label>Database: </label>cvdb</div><div><label>Table: </label>Portal</div><div><label>Fields: </label>id, title, data</div><div><label>Query Id: </label>1</div>",
          flex: 1
        }, {
          xtype: 'panel',
          html: "<div>Data: </div>",
          id: 'querydataArea'
        }
      ]
    },
    initialize: function() {
      console.log('Research initialize');
      return this.callParent();
    }
  });

}).call(this);
