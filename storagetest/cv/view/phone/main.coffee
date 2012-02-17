Ext.define('Cv.view.phone.Main'
    extend: 'Ext.Panel'
    config:
      id: '' 
      fullscreen: true
      layout: 'card'
      items: [
       {xtype: 'cvPhoneNavigation'}
      ]
    ###
    scrollable: 
        direction: 'vertical',
        directionLock: true
    ###
    initialize: ()->
      console.log Date.now() + ' Cv.view.phone.Main initialize'
      @callParent()
    
);