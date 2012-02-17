(function() {

  Ext.define('Cv.controller.phone.Page', {
    extend: 'Ext.app.Controller',
    config: {
      id: 'cvControllerPhonePage',
      refs: {
        menuItems: '#cvMenu button',
        loadlocalstorage: '#loadlocalstorage',
        savelocalstorage1: '#savelocalstorage1',
        savelocalstorage2: '#savelocalstorage2',
        queryall: '#queryall',
        querybyid: '#querybyid',
        updatebyid: '#updatebyid'
      },
      routes: {
        'pages/index/:id': 'changePage'
      },
      control: {
        menuItems: {
          tap: "redirectPage"
        },
        loadlocalstorage: {
          tap: 'loadlocalstorage'
        },
        savelocalstorage1: {
          tap: 'savelocalstorage1'
        },
        savelocalstorage2: {
          tap: 'savelocalstorage2'
        },
        queryall: {
          tap: 'queryall'
        },
        querybyid: {
          tap: 'querybyid'
        },
        updatebyid: {
          tap: 'updatebyid'
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
      var main;
      console.log("change page" + id);
      main = Ext.ComponentQuery.query('#phoneMainPage')[0];
      if (id === 'menu-MarketBuzz') {
        return main.setItems([Ext.create('Cv.view.phone.Page')]);
      } else if (id === 'menu-Research') {
        return main.setItems([Ext.create('Cv.view.phone.Research')]);
      } else if (id === 'menu-FX') {
        return main.setItems([
          {
            xtype: 'panel',
            html: "It's FX page."
          }
        ]);
      } else {
        return main.setItems([
          {
            xtype: 'panel',
            html: "It's main page."
          }
        ]);
      }
    },
    loadlocalstorage: function() {
      var currentlocalstorage, d, i, itemsArray, out, _i, _len;
      if (this.mainStore) {
        this.mainStore.load();
        d = this.mainStore.getData();
        out = [];
        if (d && d.items) {
          itemsArray = d.items;
          for (_i = 0, _len = itemsArray.length; _i < _len; _i++) {
            i = itemsArray[_i];
            if (i && i.data) out.push(i.data.menu);
          }
        }
        currentlocalstorage = Ext.ComponentQuery.query('#currentlocalstorage')[0];
        return currentlocalstorage.setHtml("Current localstorage: " + out.toString());
      }
    },
    savelocalstorage1: function() {
      var m, menuData, _i, _len;
      if (this.mainStore) {
        menuData = ['MarketBuzz', 'Research'];
        this.mainStore.load();
        this.mainStore.removeAll(true);
        for (_i = 0, _len = menuData.length; _i < _len; _i++) {
          m = menuData[_i];
          this.mainStore.add({
            menu: m
          });
        }
        return this.mainStore.sync();
      }
    },
    savelocalstorage2: function() {
      var m, menuData, _i, _len;
      if (this.mainStore) {
        menuData = ['MarketBuzz', 'Research', 'FX'];
        this.mainStore.load();
        this.mainStore.removeAll(true);
        for (_i = 0, _len = menuData.length; _i < _len; _i++) {
          m = menuData[_i];
          this.mainStore.add({
            menu: m
          });
        }
        return this.mainStore.sync();
      }
    },
    querybyid: function() {
      var self;
      if (CvDbUtil.cvdb) {
        self = this;
        return CvDbUtil.transaction(function(tx) {
          return CvDbUtil.queryDB(tx, 'Portal', ' WHERE id = 1 ', function(tx, results) {
            return self.querySuccess(tx, results, self);
          }, CvDbUtil.errorCB);
        }, CvDbUtil.errorCB, function() {
          return console.log('Transcation Successfully.');
        });
      }
    },
    querySuccess: function(tx, results) {
      var item, length, num, querydataArea, result;
      console.log(results);
      result = '';
      if (results && results.rows && results.rows.length) {
        length = results.rows.length - 1;
        for (num = 0; 0 <= length ? num <= length : num >= length; 0 <= length ? num++ : num--) {
          item = results.rows.item(num);
          result += '<ul><li>id: ' + item['id'] + '</li><li>title: ' + item['title'] + '</li><li>data: ' + item['data'] + '</li></ul>';
        }
      }
      querydataArea = Ext.ComponentQuery.query('#querydataArea')[0];
      querydataArea.setHtml('<div>Data: </div><div>' + result + '</div>');
    },
    queryall: function() {
      var self;
      if (CvDbUtil.cvdb) {
        self = this;
        return CvDbUtil.transaction(function(tx) {
          return CvDbUtil.queryDB(tx, 'Portal', '', function(tx, results) {
            return self.querySuccess(tx, results);
          }, CvDbUtil.errorCB);
        }, CvDbUtil.errorCB, function() {
          return console.log('Transcation Successfully.');
        });
      }
    },
    updatebyid: function() {
      if (CvDbUtil.cvdb) {
        return CvDbUtil.transaction(function(tx) {
          return tx.executeSql('UPDATE Portal SET data = "test data(Current time:' + Ext.Date.now() + ')" WHERE id = 1');
        }, CvDbUtil.errorCB, function() {
          return console.log('Transcation Successfully.');
        });
      }
    },
    init: function() {
      console.log('Page Controller init');
      this.mainStore = Ext.create('Ext.data.Store', {
        model: 'Cv.model.Main',
        storeId: 'mainStore'
      });
      return this.callParent();
    }
  });

}).call(this);
