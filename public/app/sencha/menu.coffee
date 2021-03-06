cv.Menu = Ext.extend(Ext.Toolbar,
    height: 40
    itemId: 'cvMenu'
    layout: 'fit'
    scroll: 'horizontal'
    initComponent: ->
        Ext.apply(this,
            items:[
                id: 'menuBarButtons'
                itemId: 'menuBarButtons'
                xtype: 'segmentedbutton'
                items: @getMenuItems()
            ]
        )
        cv.Menu.superclass.initComponent.apply(this, arguments)
    
    getMenuItems: ->
        #hardcode menu itmes for the time being
        #TODO read from datastore
        menus = ['MarketBuzz','Rates','Credit','FX','EmergeMarkets','Muni']
        menuItems = []
        # => to rebind this to foreach callback
        menus.forEach (page, i)=>
            #press the default one  TODO, should have a page id
            menuItems.push({id: page, text: page, handler: @menuTapHandler})
            menuItems[0]['pressed'] = true
        console.log menuItems
        return menuItems
    menuTapHandler: (button, e)->
        console.log (button.text + ' ' + button.id + ' is clicked')
        #dispatch to page/index/id action
        Ext.dispatch(
            controller: 'page'
            action: 'index'
            id: button.id
            historyUrl: 'page/index/'+button.id
        )
)
#cv.views.menu = new cv.Menu()
Ext.reg('cvMenu', cv.Menu)
