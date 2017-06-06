/* 
 * Class   : RESTRequestParserTest
 * Purpose : Test Class for 
 *           (1) RESTRequestParser
 *           (2) RESTRequestInfo
 * Author  : Simran Singh
 */
@isTest
private class RESTRequestParserTest {

    @isTest
    private static void testRequestParser(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ans/v1/datarooms/12345/archivestatus';
        String baseResource = '/ans/v1/datarooms';
        
        Test.startTest();

        RESTRequestInfo reqInfo = RESTRequestParser.parseRequest(req, baseResource);
        System.assertEquals(baseResource, reqInfo.baseResource, 'Base Resource matches');
        System.assertEquals(0, reqInfo.requestParamsMap.size(), 'Request Parameters map size');
        System.assertEquals(2, reqInfo.resourceValueMap.size(), 'Resource value map size');
        System.assertEquals('12345', reqInfo.resourceValueMap.get(0), 'First Resource value matches');
        System.assertEquals('archivestatus', reqInfo.resourceValueMap.get(1), 'Second Resource value matches');
        
        Test.stopTest();
    }

    @isTest
    private static void testRequestParser_DoubleBackslash(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ans/v1/datarooms//12345/archivestatus/';
        String baseResource = '/ans/v1/datarooms';
        
        Test.startTest();

        RESTRequestInfo reqInfo = RESTRequestParser.parseRequest(req, baseResource);
        System.assertEquals(baseResource, reqInfo.baseResource, 'Base Resource matches');
        System.assertEquals(0, reqInfo.requestParamsMap.size(), 'Request Parameters map size');
        System.assertEquals(2, reqInfo.resourceValueMap.size(), 'Resource value map size');
        System.assertEquals('12345', reqInfo.resourceValueMap.get(0), 'First Resource value matches');
        System.assertEquals('archivestatus', reqInfo.resourceValueMap.get(1), 'Second Resource value matches');
        
        Test.stopTest();
    }

}