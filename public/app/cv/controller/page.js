(function() {

  Ext.define('cv.controller.page', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerPage',
      refs: {
        main: '#mainPage',
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
      console.log(options);
      console.log('Page Controller redirectPage');
      return this.redirectTo('pages/index/' + options.id);
    },
    changePage: function(id) {
      if (id === 'menu-MarketBuzz') {
        return this.getMain().setItems([Ext.create('cv.view.page.marketBuzz')]);
      } else if (id === 'menu-Research') {
        return this.getMain().setItems([Ext.create('cv.view.page.research')]);
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
      return console.log('Page Controller init');
    }
  });

}).call(this);
