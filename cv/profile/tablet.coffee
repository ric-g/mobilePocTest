Ext.define('Cv.profile.Tablet'
    extend: 'Ext.app.Profile'
    config: 
      name: 'tablet'
      controllers: ['Main','Page']
    isActive: ->
      return Ext.os.is.Desktop || Ext.os.is.Tablet
    launch: ->
      console.log Date.now() + ' Cv.profile.Tablet launch'
      @callParent()
      Ext.Viewport.add(Ext.create('Cv.view.tablet.Main'))
    
)