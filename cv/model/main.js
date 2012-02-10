(function() {

  Ext.define('Cv.model.Main', {
    extend: 'Ext.data.Model',
    config: {
      fields: [
        {
          name: 'userId',
          type: 'string'
        }, {
          name: 'menuId',
          type: 'string'
        }
      ]
    },
    changeMenu: function(id) {
      return this.set('menuId', id);
    },
    getMenuId: function() {
      return this.get('menuId');
    },
    setUserId: function(id) {
      return this.set('userId', id);
    },
    getUserId: function() {
      return this.get('userId');
    }
  });

}).call(this);
