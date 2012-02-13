(function() {

  Ext.define('Cv.view.Portal', {
    extend: 'Ext.Panel',
    xtype: 'cvPortal',
    config: {
      style: "background-color:#ffffff",
      html: 'portal html'
    },
    initialize: function() {
      this.callParent.apply(this, arguments);
      return console.log(this.getId() + ' portal initialize');
    }
  });

}).call(this);
