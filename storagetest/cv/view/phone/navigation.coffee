Ext.define('Cv.view.phone.Navigation'
  extend: 'Ext.navigation.View'
  xtype: 'cvPhoneNavigation'
  config:
    id: 'cvNavigationID'
    navigationBar:
      docked: 'top'
      items: [
        {
          xtype: 'button'
          layout: 'fit'
          text: 'back'
          ui: 'back'
          handler: ->
            console.log 'back button'
        }
      ]
    items: [
      title: 'CitiVelocity'
      items: [
        {xtype: 'cvPhoneMenu'}
        {xtype: 'cvPhoneMainPage'}
      ]
    ]
)


Ext.define('Cv.view.phone.Menu'
  extend: 'Ext.Toolbar'
  xtype: 'cvPhoneMenu'
  menus: []
  config:
    id: 'cvMenu'
    #layout: 'fix'
    scrollable: 'horizontal'
    cls: 'testbutton'
    #height: 40
    ###
    items: [
      id: 'menuBarButtons'
      itemId: 'menuBarButtons'
      xtype: 'segmentedbutton'
      items: [
        {text: 'text1'}
        {text: 'text2'}
      ]
    ]
    ###
  getMenuItems: ->
    console.log 'getMenuItems'
    menus = @.menus#['MarketBuzz', 'Research']
    menuItems = []
    menus.forEach (page, i)=>
      newId = 'menu-'+page
      menuItems.push({id: newId, text: page, handler: @menuTapHandler})
      #menuItems[0]['pressed'] = true
    return menuItems
  menuTapHandler: (button, e)->
    console.log (button._text + ' ' + button.id + ' is clicked')
    #console.log (e)
  initialize: () ->
    console.log 'menu initialize'
    @.mainStore = Ext.create('Ext.data.Store'
      model: 'Cv.model.Main'
      storeId: 'mainStore'
    )
    @.mainStore.load()
    d = @.mainStore.getData()
    @.menus = []
    if d and d.items
      itemsArray  = d.items
      for i in itemsArray
        if i and i.data
          @.menus.push i.data.menu
    #console.log @.menus
    @setItems([
      id: 'menuBarButtons'
      itemId: 'menuBarButtons'
      xtype: 'segmentedbutton'
      allowMultiple: false
      items: @getMenuItems()
    ])
    #@superclass.constructor.apply(this,arguments)
    @callParent()

)