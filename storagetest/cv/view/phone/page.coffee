Ext.define('Cv.view.phone.Page'
  extend: 'Ext.Panel'
  xtype: 'cvPhoneMainPage'
  config:
    width: "100%"
    height: "500px"
    style: "background-color:#ffee00"
    layout: 
      type: 'vbox'
    scrollable: 
      direction: 'vertical',
      directionLock: true
    id: 'phoneMainPage'
    #html: "<p>It's main page</p>"
    items: [
      {xtype: 'toolbar',title: 'Local Storage', ui: 'light'}
      {xtype: 'button', text: 'load localstorage', id: 'loadlocalstorage'}
      {xtype: 'button', text: 'save localstorage1', id: 'savelocalstorage1'}
      {xtype: 'button', text: 'save localstorage2', id: 'savelocalstorage2'}
      {xtype: 'panel',height: 100, html: "<div><label>localstorage1: </label>['MarketBuzz', 'Research']</div><div><label>localstorage1: </label>['MarketBuzz', 'Research', 'FX']</div>"}
      {xtype: 'panel', html: "Current localstorage: ", id: 'currentlocalstorage'}
    ]
  initialize: ->
    console.log 'page initialize'
    @callParent()
)
