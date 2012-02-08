Ext.define('cv.viewport.phone.main'
    extend: 'Ext.Panel'
    config: 
      fullscreen: true
      layout: 'card'
      items: [
       {xtype: 'cvPhoneNavigation'}
      ]
    constructor: (config)->
      console.log Date.now() + ' cv.viewport.phone.main constructor'
      @superclass.constructor.apply(this, arguments);
    
);