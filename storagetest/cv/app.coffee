Ext.ns('Cv')
Ext.Loader.setConfig
    enabled: false
Ext.application
    name: 'Cv'
    #appFolder: 'cv'
    #defaultTarget: 'viewport'
    profiles: ['Tablet', 'Phone']
    launch: ->
     console.log Date.now()+' application launch ' +Ext.os.deviceType
     console.log "DetermineOrientation:"+Ext.Viewport.determineOrientation()+"; WindowWidth:"+Ext.Viewport.getWindowWidth()+"; WindowHeigh:"+Ext.Viewport.getWindowHeight()+"; WindowOuterHeight:"+Ext.Viewport.getWindowOuterHeight()
     console.log Ext.Viewport.determineOrientation()+"; width:"+Ext.Viewport.getSize().width+'; height'+Ext.Viewport.getSize().height
     ###
     mainModel = Ext.create('Cv.model.Main'
        userId: 'ba72658'
        menuId: 'main'
     )
     ###
     
     ###
     mainStore.setData(Ext.create('Cv.model.Main'
        userId: 'ba72658'
        menuId: 'main'
     ))
     ###
     #MainModel = Ext.ModelManager.getModel('Cv.model.Main');
     #console.log new MainModel()
     #mainModel.set('userId','1')
     if(CvDbUtil.cvdb)
       CvDbUtil.transaction( (tx)->
         tx.executeSql('DROP TABLE IF EXISTS Portal');
         CvDbUtil.createTable(tx, 'Portal','id unique, title, data');
         CvDbUtil.insert(tx, 'Portal', 'id, title, data', '1,"Canada Weekly Notes: Jan 30 - Feb 3","Industry-Based Output - Activity likely improved modestly in November. Industrial Product Prices - Producer price inflation probably slowed. Raw Materials Prices - Crude price inflation likely continued to decelerate. CFIB Small Business Survey - Capex and pricing plans probably softened. LFS Employment - Job gains likely narrowed keeping UR at recent high."')
         CvDbUtil.insert(tx, 'Portal', 'id, title, data', '2,"Colombia Macro View: What to Expect from Banrep in 2012?", "Colombia Minister of Finance Juan Carlos Echeverry announced new FX intervention measures last week after the central bank\'s monthly meeting. The communique stated the MOF would not bring any more USD from offshore accounts into the country in 2011, and that the MoF would purchase US1.2 bln in the local market to create a fund abroad to be used for future USD-denominated debt obligations. It also stated the MoF would support the CB, if needed, for curbing further COP appreciation.  We looked at possible scenarios for the MoF cash flow through 2011 to assess if the govt has enough resources to undertake the scheme."')
         CvDbUtil.insert(tx, 'Portal', 'id, title, data', '3,"Forecast Supplement: Week Ahead", "Private payrolls likely grew at a tepid pace in October, with service sector gains highlighted against a backdrop of declines in manufacturing and construction."')
       CvDbUtil.errorCB
       ->
         console.log 'Transcation Successfully.'
       )
     

doOnReady = (fn,scope,options) ->
 console.log Date.now()+' onready'

###
enum SQLErrorCode {
        UNKNOWN_ERR = 0,
        DATABASE_ERR = 1,
        VERSION_ERR = 2,
        TOO_LARGE_ERR = 3,
        QUOTA_ERR = 4,
        SYNTAX_ERR = 5,
        CONSTRAINT_ERR = 6,
        TIMEOUT_ERR = 7
    };
###
@CvDbUtil = 
  cvdb: undefined
  #cvdb.executeSql('CREATE TABLE IF NOT EXISTS DEMO (id unique, data)')
  transaction: (populateDB, errorCB, successCB)->
    if @cvdb
      @cvdb.transaction(populateDB, errorCB, successCB);
  createTable: (tx, tablename, fieldstr)->
    if tx
      tx.executeSql('CREATE TABLE IF NOT EXISTS ' + tablename + ' (' + fieldstr + ')')
  #cvdb.executeSql('INSERT INTO DEMO (id, data) VALUES (1, "First row")')
  #tx: SQLTransaction object
  insert: (tx,tablename, fieldstr, valuestr)->
    #console.log 'INSERT INTO ' + tablename + ' (' + fieldstr + ') VALUES (' + valuestr + ')'
    if tx
      tx.executeSql('INSERT INTO ' + tablename + ' (' + fieldstr + ') VALUES (' + valuestr + ')')
  #Transaction error callback
  errorCB: (err)->
    console.log "Error processing SQL: "+err.code;
  queryDB: (tx, tablename, condition, successCallback, errorCallback)->
    if tx
      tx.executeSql('SELECT * FROM '+tablename+' '+condition, [], successCallback, errorCallback)

try
  @CvDbUtil.cvdb = window.openDatabase("cvdb", "1.0", "Test DB", 5242880);
catch e
  console.log e
