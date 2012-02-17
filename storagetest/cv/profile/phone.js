(function() {

  Ext.define('Cv.profile.Phone', {
    extend: 'Ext.app.Profile',
    config: {
      name: 'phone',
      controllers: ['Main', 'Page']
    },
    isActive: function() {
      return false;
    },
    launch: function() {
      console.log(Date.now() + ' Cv.profile.Phone launch');
      this.callParent();
      return Ext.Viewport.add(Ext.create('Cv.view.phone.Main'));
    }
  });

}).call(this);
