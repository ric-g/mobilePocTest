Ext.define('Cv.model.Main'
 extend: 'Ext.data.Model'
 config:
  fields:[
   {name:'userId', type: 'string'}
   {name:'menu', type: 'string'}
  ]
  proxy:
    type: 'localstorage'
    id: 'mainModelId'
 ###
 changeMenu: (id)->
  @set('menuId', id)
 getMenuId: ->
  return @get('menuId');
 setUserId: (id)->
  @set('userId',id)
 getUserId: ->
  return @get('userId')
 ###
)

