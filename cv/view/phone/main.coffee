Ext.define('cv.view.phone.main'
    extend: 'Ext.Panel'
    config: 
      fullscreen: true
      layout: 'card'
      items: [
       {xtype: 'cvPhoneNavigation'}
      ]
    scrollable: 
        direction: 'vertical',
        directionLock: true
    constructor: (config)->
      console.log Date.now() + ' cv.view.phone.main constructor'
      @superclass.constructor.apply(this, arguments);
    
);