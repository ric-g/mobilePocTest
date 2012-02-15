Ext.define('Cv.view.Portal'
 extend: 'Ext.Panel'
 xtype: 'cvPortal'
 config:
  style: "background-color:#ffffff"
  html: 'portal html'
 initialize: ->
  @callParent.apply(this,arguments)
  console.log @getId() + ' portal initialize'
)
