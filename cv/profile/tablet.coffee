Ext.define('Cv.profile.Tablet'
    extend: 'Ext.app.Profile'
    config: 
      name: 'tablet'
      controllers: ['Main','Page']
    isActive: ->
      return true#Ext.os.is.Desktop || Ext.os.is.Tablet
    launch: ->
      console.log Date.now() + ' Cv.profile.Tablet launch'
      @callParent()
      Ext.create('Cv.view.tablet.Main');
    
)