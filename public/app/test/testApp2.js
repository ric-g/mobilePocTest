(function() {
  var doOnReady;

  Ext.ns('cv', 'cv.views', 'cv.controllers');

  Ext.application({
    name: 'cv',
    defaultTarget: 'viewport',
    init: function() {
      return console.log('init application');
    },
    controllers: ['cv.Controller.Page'],
    launch: function() {
      console.log('launch');
      return Ext.create('cv.Viewport');
    }
  });

  Ext.define('cv.TitleBar', {
    extend: 'Ext.TitleBar',
    xtype: 'cvTitleBar',
    docked: 'top',
    title: 'Citivelocity',
    height: 40
  });

  Ext.define('cv.Viewport', {
    extend: 'Ext.Panel',
    alias: 'viewport',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvNavigation'
        }
      ]
    }
  });

  Ext.define('cv.navigation', {
    extend: 'Ext.navigation.View',
    xtype: 'cvNavigation',
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
              xtype: 'cvMenu'
            }
          ]
        }
      ]
    }
  });

  Ext.define('cv.Menu', {
    extend: 'Ext.Toolbar',
    xtype: 'cvMenu',
    config: {
      id: 'cvMenu',
      scroll: 'horizontal',
      cls: 'testbutton',
      height: 40
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
      menus = ['M', 'N'];
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
      console.log('menu constructor');
      config.items = [
        {
          id: 'menuBarButtons',
          itemId: 'menuBarButtons',
          xtype: 'segmentedbutton',
          allowMultiple: false,
          items: this.getMenuItems()
        }
      ];
      return this.superclass.constructor.apply(this, arguments);
    }
  });

  Ext.define('cv.Page', {
    extend: 'Ext.Panel',
    config: {
      pageId: ''
    },
    initialize: function() {
      return console.log('page initialize');
    }
  });

  Ext.define('cv.Page.M', {
    extend: 'cv.Page',
    initialize: function() {
      this.callParent.apply(this, arguments);
      return console.log('page M initialize');
    }
  });

  Ext.define('cv.Controller.Page', {
    extend: 'Ext.app.Controller',
    config: {
      refs: {
        nav: '#cvMenu'
      }
    },
    changePage: function(options) {
      return console.log('Page Controller changePage');
    },
    init: function() {
      return console.log('Page Controller init');
    }
  });

  doOnReady = function(fn, scope, options) {
    return console.log('onready');
  };

  Ext.onReady(doOnReady);

}).call(this);
