Ext.define('Cv.profile.Phone'
    extend: 'Ext.app.Profile'
    config: 
      name: 'phone'
      controllers: ['Main','Page']
    isActive: ->
      return false#Ext.os.is.Phone;
    launch: ->
      console.log Date.now() + ' Cv.profile.Phone launch'
      @callParent()
      Ext.Viewport.add(Ext.create('Cv.view.phone.Main'));
)