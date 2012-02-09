(function() {

  Ext.define('cv.controller.phone.page', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerPhonePage',
      refs: {
        main: '#phoneMainPage',
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
      console.log("change page" + id);
      if (id === 'menu-MarketBuzz') {
        return this.getMain().setItems([
          {
            xtype: 'panel',
            html: "It's marketbuzz page."
          }
        ]);
      } else if (id === 'menu-Research') {
        return this.getMain().setItems([
          {
            xtype: 'panel',
            html: "It's research page."
          }
        ]);
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
