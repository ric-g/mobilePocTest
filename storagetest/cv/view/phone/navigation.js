(function() {

  Ext.define('Cv.view.phone.Navigation', {
    extend: 'Ext.navigation.View',
    xtype: 'cvPhoneNavigation',
    config: {
      id: 'cvNavigationID',
      navigationBar: {
        docked: 'top',
        items: [
          {
            xtype: 'button',
            layout: 'fit',
            text: 'back',
            ui: 'back',
            handler: function() {
              return console.log('back button');
            }
          }
        ]
      },
      items: [
        {
          title: 'CitiVelocity',
          items: [
            {
              xtype: 'cvPhoneMenu'
            }, {
              xtype: 'cvPhoneMainPage'
            }
          ]
        }
      ]
    }
  });

  Ext.define('Cv.view.phone.Menu', {
    extend: 'Ext.Toolbar',
    xtype: 'cvPhoneMenu',
    menus: [],
    config: {
      id: 'cvMenu',
      scrollable: 'horizontal',
      cls: 'testbutton'
      /*
          items: [
            id: 'menuBarButtons'
            itemId: 'menuBarButtons'
            xtype: 'segmentedbutton'
            items: [
              {text: 'text1'}
              {text: 'text2'}
            ]
          ]
      */
    },
    getMenuItems: function() {
      var menuItems, menus,
        _this = this;
      console.log('getMenuItems');
      menus = this.menus;
      menuItems = [];
      menus.forEach(function(page, i) {
        var newId;
        newId = 'menu-' + page;
        return menuItems.push({
          id: newId,
          text: page,
          handler: _this.menuTapHandler
        });
      });
      return menuItems;
    },
    menuTapHandler: function(button, e) {
      return console.log(button._text + ' ' + button.id + ' is clicked');
    },
    initialize: function() {
      var d, i, itemsArray, _i, _len;
      console.log('menu initialize');
      this.mainStore = Ext.create('Ext.data.Store', {
        model: 'Cv.model.Main',
        storeId: 'mainStore'
      });
      this.mainStore.load();
      d = this.mainStore.getData();
      this.menus = [];
      if (d && d.items) {
        itemsArray = d.items;
        for (_i = 0, _len = itemsArray.length; _i < _len; _i++) {
          i = itemsArray[_i];
          if (i && i.data) this.menus.push(i.data.menu);
        }
      }
      this.setItems([
        {
          id: 'menuBarButtons',
          itemId: 'menuBarButtons',
          xtype: 'segmentedbutton',
          allowMultiple: false,
          items: this.getMenuItems()
        }
      ]);
      return this.callParent();
    }
  });

}).call(this);
