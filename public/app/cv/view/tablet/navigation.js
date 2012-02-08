(function() {

  Ext.define('cv.view.tablet.navigation', {
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
              dock: 'bottom',
              xtype: 'cvTabletMenu'
            }
          ]
        }
      ]
    }
  });

  Ext.define('cv.view.tablet.Menu', {
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
      console.log(button._text + ' ' + button.id + ' is clicked');
      return console.log(e);
      /*
         Ext.dispatch(
          controller: 'page'
          action: 'index'
          id: button.id
          historyUrl: 'page/index/'+button.id
         )
      */
    },
    constructor: function(config) {
      alert('menu constructor');
      config.items = [
        {
          id: 'menuBarButtons',
          itemId: 'menuBarButtons',
          xtype: 'segmentedbutton',
          allowMultiple: false,
          items: this.getMenuItems()
        }
      ];
      return this.callParent.apply(this, arguments);
    }
  });

}).call(this);
