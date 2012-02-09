Ext.define('cv.view.tablet.main'
    extend: 'Ext.Panel'
    config: 
      fullscreen: true
      layout: 'card'
      items: [
        {xtype: 'cvTabletNavigation'}
      ]
    constructor: (config)->
      console.log Date.now() + ' cv.view.tablet.main constructor'
      @superclass.constructor.apply(this, arguments);
    
);