(function() {

  Ext.define('Cv.view.tablet.Navigation', {
    extend: 'Ext.navigation.View',
    xtype: 'cvTabletNavigation',
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
            id: 'navBackBtn',
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
              xtype: 'cvTabletMenu'
            }, {
              xtype: 'cvTabletMainPage'
            }
          ]
        }
      ]
    }
  });

  Ext.define('Cv.view.tablet.Menu', {
    extend: 'Ext.Toolbar',
    xtype: 'cvTabletMenu',
    config: {
      id: 'cvMenu',
      scroll: 'horizontal',
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
      menus = ['MarketBuzz', 'Research', 'FX'];
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
