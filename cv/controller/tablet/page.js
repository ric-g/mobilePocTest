(function() {

  Ext.define('Cv.controller.tablet.Page', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerTabletPage',
      refs: {
        main: '#tabletMainPage',
        menuItems: 'button'
      },
      routes: {
        'pages/index/:id': 'changePage'
      },
      control: {
        menuItems: {
          tap: "redirectPage"
        }
      }
    },
    redirectPage: function(options) {
      if (options.id === 'navBackBtn') return;
      console.log(options);
      console.log('Page Controller redirectPage');
      return this.redirectTo('pages/index/' + options.id);
    },
    changePage: function(id) {
      var mainModel;
      mainModel = Ext.ModelManager.getModel('Cv.model.Main');
      if (id === 'menu-MarketBuzz') {
        return this.getMain().setItems([Ext.create('Cv.view.tablet.MarketBuzz')]);
      } else if (id === 'menu-Research') {
        return this.getMain().setItems([Ext.create('Cv.view.tablet.Research')]);
      } else if (id === 'menu-FX') {
        return this.getMain().setItems([
          {
            xtype: 'panel',
            html: "It's FX page."
          }
        ]);
      }
    },
    init: function() {
      console.log('Page Controller init');
      return this.callParent();
    }
  });

}).call(this);
