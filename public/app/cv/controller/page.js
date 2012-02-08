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
      if (id === 'menu-M') {
        return this.getMain().setItems([Ext.create('cv.view.page.M')]);
      } else if (id === 'menu-N') {
        return this.getMain().setItems([Ext.create('cv.view.page.N')]);
      }
    },
    init: function() {
      return console.log('Page Controller init');
    }
  });

}).call(this);
