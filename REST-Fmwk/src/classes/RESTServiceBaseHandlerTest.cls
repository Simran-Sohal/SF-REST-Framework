/* 
 * Class   : RESTRequestParserTest
 * Purpose : Test Class for 
 *           (1) RESTServiceBaseHandler
 *           (2) RESTErrorResponse
 * Author  : Simran Singh
 */
@isTest
private class RESTServiceBaseHandlerTest {

    @isTest
    private static void testBaseHandlerRequestAction(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ans/v1/datarooms/12345';
        
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        String baseResource = '/ans/v1/datarooms';
        
        Test.startTest();
        RESTServiceBaseHandler baseHdlr = new RESTServiceBaseHandler(baseResource);

        baseHdlr.fetchRecords();
        System.assertEquals(true, baseHdlr.mHasError, 'Fetch not supported for base handler');

        baseHdlr.clearErrorStack();
        System.assertEquals(false, baseHdlr.mHasError, 'Error stack reset');

        baseHdlr.createRecords();
        System.assertEquals(true, baseHdlr.mHasError, 'Create not supported for base handler');

        baseHdlr.clearErrorStack();
        baseHdlr.updateRecords();
        System.assertEquals(true, baseHdlr.mHasError, 'Update not supported for base handler');

        baseHdlr.clearErrorStack();
        baseHdlr.deleteRecords();
        System.assertEquals(true, baseHdlr.mHasError, 'Delete not supported for base handler');
        
        Test.stopTest();        
    }

}