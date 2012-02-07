(function() {
  var renderPage;

  Ext.ns('cv', 'cv.views', 'cv.controllers');

  Ext.setup({
    statusBarStyle: 'black-translucent',
    onReady: function() {
      return console.log('test ready');
    }
  });

  new Ext.Application({
    name: 'cv',
    launch: function() {
      return console.log('application test');
    }
  });

  Ext.regApplication({
    name: 'cv',
    defaultTarget: 'viewport',
    launch: function() {
      console.log('launch');
      this.viewport = new cv.Viewport({
        application: this
      });
      return Ext.dispatch({
        controller: 'page',
        action: 'index',
        id: 'M',
        historyUrl: 'page/index/M'
      });
    }
  });

  cv.Viewport = Ext.extend(Ext.Panel, {
    id: 'viewport',
    fullscreen: true,
    layout: 'card',
    dockedItems: [
      {
        dock: 'top',
        xtype: 'toolbar',
        layout: 'card',
        title: 'CitiVelocity',
        items: [
          {
            xtype: 'button',
            text: 'Return',
            dock: 'left',
            listeners: {
              click: {
                element: 'el',
                fn: function() {
                  console.log('click');
                  return console.log(this);
                }
              }
            }
          }
        ]
      }, {
        dock: 'top',
        items: [
          {
            xtype: 'searchfield',
            name: 'searchfield',
            placeholder: 'Search...'
          }
        ]
      }, {
        dock: 'bottom',
        xtype: 'cvMenu'
      }
    ]
  }, {
    initComponent: function() {
      Ext.apply(this);
      cv.Viewport.superclass.initComponent.apply(this, arguments);
      return console.log('viewport initcomponent');
    }
  });

  cv.Menu = Ext.extend(Ext.Toolbar, {
    height: 40,
    itemId: 'cvMenu',
    layout: 'fix',
    scroll: 'horizontal',
    cls: 'testbutton',
    initComponent: function() {
      Ext.apply(this, {
        items: [
          {
            id: 'menuBarButtons',
            itemId: 'menuBarButtons',
            xtype: 'segmentedbutton',
            items: this.getMenuItems()
          }
        ]
      });
      return cv.Menu.superclass.initComponent.apply(this, arguments);
    },
    getMenuItems: function() {
      var menuItems, menus,
        _this = this;
      menus = ['M', 'N'];
      menuItems = [];
      menus.forEach(function(page, i) {
        menuItems.push({
          id: page,
          text: page,
          handler: _this.menuTapHandler
        });
        return menuItems[0]['pressed'] = true;
      });
      console.log(menuItems);
      return menuItems;
    },
    menuTapHandler: function(button, e) {
      console.log(button.text + ' ' + button.id + ' is clicked');
      return Ext.dispatch({
        controller: 'page',
        action: 'index',
        id: button.id,
        historyUrl: 'page/index/' + button.id
      });
    }
  });

  Ext.reg('cvMenu', cv.Menu);

  cv.pages = {};

  cv.portlets = {};

  renderPage = function(pageId) {
    return console.log('render page');
  };

  cv.Page = Ext.extend(Ext.Panel, {
    pageId: '',
    constructor: function(config) {
      this.pageId = config != null ? config.pageId : void 0;
      console.log('constructor pageid ' + this.pageId);
      return cv.Page.superclass.constructor.call(this, config);
    },
    initComponent: function() {
      var portlets;
      console.log('init component');
      if (this.pageId !== 'M') {
        this.html = '<h1>this is ' + this.pageId + ' Page.';
      } else {
        portlets = this.getPortlets();
        Ext.apply(this, {
          items: portlets
        });
      }
      return cv.Page.superclass.initComponent.call(this);
    },
    getPortlets: function() {
      var result;
      console.log('get portlets');
      result = [];
      return result;
    }
  });

  Ext.regController('page', {
    index: function(options) {
      var pageId;
      pageId = options.id;
      console.log('page index id: ' + options.id);
      if (!cv.pages[pageId]) {
        cv.pages[pageId] = new cv.Page({
          pageId: pageId
        });
      }
      Ext.getCmp('menuBarButtons').setPressed(Ext.getCmp(pageId), true, false);
      return Ext.getCmp('viewport').setActiveItem(cv.pages[pageId], {
        type: 'slide',
        direction: 'right'
      });
    }
  });

}).call(this);
