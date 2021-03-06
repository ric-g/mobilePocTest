/**
 * @author Ed Spencer
 *
 * Simple class that represents a Request that will be made by any {@link Ext.data.proxy.Server} subclass.
 * All this class does is standardize the representation of a Request as used by any ServerProxy subclass,
 * it does not contain any actual logic or perform the request itself.
 */
Ext.define('Ext.data.Request', {
    config: {
        /**
         * @cfg {String} action
         * The name of the action this Request represents. Usually one of 'create', 'read', 'update' or 'destroy'.
         */
        action: null,

        /**
         * @cfg {Object} params
         * HTTP request params. The Proxy and its Writer have access to and can modify this object.
         */
        params: null,

        /**
         * @cfg {String} method
         * The HTTP method to use on this Request. Should be one of 'GET', 'POST', 'PUT' or 'DELETE'.
         */
        method: 'GET',

        /**
         * @cfg {String} url
         * The url to access on this Request.
         */
        url: null,

        /**
         * @cfg {Ext.data.Operation} operation
         * The operation this request belongs to.
         */
        operation: null,

        /**
         * @cfg {Ext.data.proxy.Proxy} proxy
         * The proxy this request belongs to.
         */
        proxy: null,

        /**
         * @cfg {Boolean} disableCaching
         * Wether or not to disable caching for this request.
         * Defaults to false.
         */
        disableCaching: false,

        /**
         * @cfg {Object} headers
         * Some requests (like XMLHttpRequests) want to send additional server headers.
         * This configuration can be set for those types of requests.
         */
        headers: {},

        /**
         * @cfg {String} callbackKey
         * Some requests (like JsonP) want to send an additional key that contains
         * the name of the callback function.
         */
        callbackKey: null,

        /**
         * @cfg {Ext.data.JsonP} jsonp
         * JsonP requests return a handle that might be useful in the callback function.
         */
        jsonP: null,

        /**
         * @cfg {Object} jsonData
         * This is used by some write actions to attach data to the request without encoding it
         * as a parameter.
         */
        jsonData: null,

        callback: null,
        scope: null,
        timeout: 30000,
        records: null
    },

    /**
     * Creates the Request object.
     * @param {Object} [config] Config object.
     */
    constructor: function(config) {
        this.initConfig(config);
    }
});