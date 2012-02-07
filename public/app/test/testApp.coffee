#namespace
Ext.ns('cv','cv.views','cv.controllers')

#seems most of properties are used for apple device
Ext.setup
		#statusBarStyle:Sets the status bar style for fullscreen iPhone OS web apps
    statusBarStyle: 'black-translucent'
    onReady: ->
        console.log 'test ready'

new Ext.Application
    name: 'cv'
    launch: ->
        console.log 'application test'

Ext.regApplication
    name: 'cv'
    defaultTarget: 'viewport'
    launch: ->
        console.log 'launch'
        @viewport = new cv.Viewport
        		application: this
        
        Ext.dispatch
            controller: 'page'
            action: 'index'
            id: 'M'
            historyUrl: 'page/index/M'
            
cv.Viewport = Ext.extend(
		Ext.Panel,
    id: 'viewport'
    fullscreen: true
    layout: 'card'
    dockedItems: [{
                   dock: 'top'
                   xtype: 'toolbar'
                   layout: 'card'
                   title: 'CitiVelocity'
                   items: [{
                   	xtype:'button'
                   	text: 'Return'
                   	dock: 'left'
                   	listeners:
                   	 click:
                   	  element: 'el'
                   	  fn: ->
                   	   console.log 'click'
                   	   console.log this
                   }]
                  }
                  {dock: 'top', items: [{xtype:'searchfield',name: 'searchfield',placeholder: 'Search...'}]}
                  {dock: 'bottom', xtype: 'cvMenu'}
                 ]
    initComponent: ->
        Ext.apply( this,
            
        )
        cv.Viewport.superclass.initComponent.apply(this, arguments)
        console.log 'viewport initcomponent'
)

cv.Menu = Ext.extend(Ext.Toolbar,
    height: 40
    itemId: 'cvMenu'
    layout: 'fix'
    scroll: 'horizontal'
    cls: 'testbutton'
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
        menus = ['M','N']
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
Ext.reg('cvMenu', cv.Menu)

#page cache
cv.pages = {}
cv.portlets = {}
renderPage = (pageId)->
		console.log 'render page'
    #render page here
cv.Page = Ext.extend(Ext.Panel,
    pageId: ''
    constructor: (config)->
        @pageId = config?.pageId
        console.log 'constructor pageid '+@pageId
        cv.Page.superclass.constructor.call(this, config)
    initComponent: ->
        console.log 'init component'
        if @pageId != 'M'
            @html = '<h1>this is '+@pageId+ ' Page.'
        else
            #read json and render the portlets
            portlets = @getPortlets()
            #portlets = []
            Ext.apply(this,
                items: portlets
            )

        cv.Page.superclass.initComponent.call(this)
    getPortlets: ->
        console.log('get portlets')
        #research for the moment
        result = []
        #p = new cv.ResearchPortlet({title: 'Daily Research'})
        #result.push p
        #result.push new cv.VideoPortlet({title: 'CitiVelocity Video' })
        return result
)

Ext.regController 'page',
    index: (options)->
        pageId = options.id
        console.log('page index id: '+options.id)
        #TODO render the page here.
        #1. get the page info from store
        #2. create Page panel and insert to viewport
        if not cv.pages[pageId]
            cv.pages[pageId] = new cv.Page({pageId: pageId})

        #make menu selected, and suppress the event to prevent loop call 
        Ext.getCmp('menuBarButtons').setPressed(Ext.getCmp(pageId), true, false)
        Ext.getCmp('viewport').setActiveItem(cv.pages[pageId], {type: 'slide', direction: 'right'})
        #sync up the menu button here 