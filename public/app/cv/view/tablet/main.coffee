Ext.define('cv.viewport.tablet.main'
    extend: 'Ext.Panel'
    config: 
      fullscreen: true
      layout: 'card'
      items: [
        {xtype: 'cvTabletNavigation'}
      ]
    constructor: (config)->
      alert Date.now() + ' cv.viewport.tablet.main constructor'
      @superclass.constructor.apply(this, arguments);
    
);