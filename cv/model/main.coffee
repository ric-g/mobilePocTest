Ext.define('Cv.model.Main'
 extend: 'Ext.data.Model'
 config:
  fields:[
   {name:'userId', type: 'string'}
   {name:'menuId', type: 'string'}
  ]
 changeMenu: (id)->
  @set('menuId', id)
 getMenuId: ->
  return @get('menuId');
 setUserId: (id)->
  @set('userId',id)
 getUserId: ->
  return @get('userId')
)