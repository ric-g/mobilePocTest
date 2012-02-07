
Ext.application
 tabletStartupScreen: 'resources/images/tablet_startup.png'
 phoneStartupScreen: 'resources/images/phone_startup.png'
 icon: 'resources/images/icon.png'
 glossOnIcon: false
 requires: [
  'Ext.SegmentedButton',
   'Ext.Toolbar'
 ]
 launch: ->
  items = @getPhoneItems();
  Ext.Viewport.add
   items: items,
   html: 'Pick a button, any button. <br /><small>By using SASS, all of the buttons on this screen can be restyled dynamically. The only images used are masks.</small>',
   styleHtmlContent: true

 getPhoneItems: ->
  return [
           {
           xtype: 'toolbar',
           docked: 'top',
           items: [
                    { ui: 'back', text: 'Back' },
                    { text: 'Default' },
                    { ui: 'round', text: 'Round' }
           ]
           }
  ]