Ext.define('cv.viewport.tablet.main'
    extend: 'Ext.Panel'
    config: 
      fullscreen: true
      layout: 'card'
      items: [
        {xtype: 'cvNavigation'}
      ]
    constructor: (config)->
      console.log Date.now() + ' cv.viewport.tablet.main constructor'
      @superclass.constructor.apply(this, arguments);
    
);