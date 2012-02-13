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
      menus = ['MarketBuzz', 'Research'];
      menuItems = [];
      menus.forEach(function(page, i) {
        var newId;
        newId = 'menu-' + page;
        menuItems.push({
          id: newId,
          text: page,
          handler: _this.menuTapHandler
        });
        return menuItems[0]['pressed'] = true;
      });
      return menuItems;
    },
    menuTapHandler: function(button, e) {
      return console.log(button._text + ' ' + button.id + ' is clicked');
    },
    initialize: function() {
      console.log('menu initialize');
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
