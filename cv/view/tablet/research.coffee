Ext.define('Cv.view.tablet.Research'
 extend: 'Ext.Panel'
 config:
  id: 'cvResearchPage'
  width: "100%"
  style: "background-color:#ffffff"
  layout: 
   type: "hbox"
  listeners: [
    {
      event: 'doOrientationChange'
      fn: (obj)->
       console.log 'page research doOrientationChange'
       console.log obj
       orientation = Ext.Viewport.determineOrientation()
       console.log orientation
       newPageItems = obj.getPageItems(orientation)
       ##remove first
       obj.removeAll(false, true);
       obj.setItems(newPageItems);
      buffer: 500
      scope: this,
    }
  ]
  ###
  items: [
   {
    xtype: 'panel'
    flex: 2
    layout:
     type: "vbox"
    items: [
     {xtype: 'cvPortal',id: 'cvResearchPortal1',html: "It's research portal 1",flex: 1,style: "background-color:#eeddee"}
     {xtype: 'cvPortal',id: 'cvResearchPortal2',html: "It's research portal 2",flex: 1,style: "background-color:#acdeef"}
    ]
    style: "background-color:#000000"
   }
   {xtype: 'cvPortal',id: 'cvResearchPortal3',html: "It's research portal 3",flex: 1,style: "background-color:#ddaee"}
   {xtype: 'cvPortal',id: 'cvResearchPortal4',html: "It's research portal 4",flex: 1,style: "background-color:#efddff"}
  ]
  ###
 getLandscapeItems: ()->
  console.log 'research getLandscapeItems'
  cvResearchPortal1 = Ext.getCmp('cvResearchPortal1')
  if cvResearchPortal1
    Ext.layout.AbstractBox(cvResearchPortal1,1)
  else
    cvResearchPortal1 = {xtype: 'cvPortal',id: 'cvResearchPortal1',html: "It's research portal 1",flex: 1,style: "background-color:#eeddee"}
  
  cvResearchPortal2 = Ext.getCmp('cvResearchPortal2')
  if cvResearchPortal2
    Ext.layout.AbstractBox(cvResearchPortal2,1)
  else
    cvResearchPortal2 = {xtype: 'cvPortal',id: 'cvResearchPortal2',html: "It's research portal 2",flex: 1,style: "background-color:#acdeef"}
  
  cvResearchPortal3 = Ext.getCmp('cvResearchPortal3')
  if cvResearchPortal3
    Ext.layout.AbstractBox(cvResearchPortal3,1)
  else
    cvResearchPortal3 = {xtype: 'cvPortal',id: 'cvResearchPortal3',html: "It's research portal 3",flex: 1,style: "background-color:#ddaee"}
  
  cvResearchPortal4 = Ext.getCmp('cvResearchPortal4')
  if cvResearchPortal4
    Ext.layout.AbstractBox(cvResearchPortal4,1)
  else
    cvResearchPortal4 = {xtype: 'cvPortal',id: 'cvResearchPortal4',html: "It's research portal 4",flex: 1,style: "background-color:#efddff"}
  
  return [
          {
           xtype: 'panel'
           flex: 2
           layout:
            type: "vbox"
           items: [
            cvResearchPortal1
            cvResearchPortal2
           ]
           style: "background-color:#000000"
          }
          cvResearchPortal3
          cvResearchPortal4
  ]
  
 getPortraitItems: ()->
  console.log 'research getLandscapeItems'
  cvResearchPortal1 = Ext.getCmp('cvResearchPortal1')
  if cvResearchPortal1
    Ext.layout.AbstractBox(cvResearchPortal1,1)
  else
    cvResearchPortal1 = {xtype: 'cvPortal',id: 'cvResearchPortal1',html: "It's research portal 1",flex: 1,style: "background-color:#eeddee"}
  
  cvResearchPortal2 = Ext.getCmp('cvResearchPortal2')
  if cvResearchPortal2
    Ext.layout.AbstractBox(cvResearchPortal2,1)
  else
    cvResearchPortal2 = {xtype: 'cvPortal',id: 'cvResearchPortal2',html: "It's research portal 2",flex: 1,style: "background-color:#acdeef"}
  
  cvResearchPortal3 = Ext.getCmp('cvResearchPortal3')
  if cvResearchPortal3
    Ext.layout.AbstractBox(cvResearchPortal3,1)
  else
    cvResearchPortal3 = {xtype: 'cvPortal',id: 'cvResearchPortal3',html: "It's research portal 3",flex: 1,style: "background-color:#ddaee"}
  
  cvResearchPortal4 = Ext.getCmp('cvResearchPortal4')
  if cvResearchPortal4
    Ext.layout.AbstractBox(cvResearchPortal4,1)
  else
    cvResearchPortal4 = {xtype: 'cvPortal',id: 'cvResearchPortal4',html: "It's research portal 4",flex: 1,style: "background-color:#efddff"}
  
  return [
          {
           xtype: 'panel'
           flex: 2
           layout:
            type: "vbox"
           items: [
            cvResearchPortal1
            cvResearchPortal2
           ]
           style: "background-color:#000000"
          }
          {
           xtype: 'panel'
           flex: 2
           layout:
            type: "vbox"
           items: [
            cvResearchPortal3
            cvResearchPortal4
           ]
           style: "background-color:#00dd00"
          }
  ]
  
 getPageItems: (orientation)->
  console.log 'research getItems'
  if orientation is 'landscape'
   return @getLandscapeItems()
  return @getPortraitItems()
 initialize: ->
  #orientation = Ext.Viewport.determineOrientation()
  orientation = getOrientation()
  @setItems(@getPageItems(orientation));
  @callParent.apply(this,arguments)
  console.log 'page research initialize'
)
