/** 
 * Copyright (c) 2017 Simranjeet Singh
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/
@isTest
private class RESTRequestParserTest {

    @isTest
    private static void testRequestParser(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/crm/v1/accounts/12345';
        String baseResource = '/crm/v1/accounts';
        
        Test.startTest();

        RESTRequestInfo reqInfo = RESTRequestParser.parseRequest(req, baseResource);
        System.assertEquals(baseResource, reqInfo.baseResource, 'Base Resource matches');
        System.assertEquals(0, reqInfo.requestParamsMap.size(), 'Request Parameters map size');
        System.assertEquals(1, reqInfo.resourceValueMap.size(), 'Resource value map size');
        System.assertEquals('12345', reqInfo.resourceValueMap.get(0), 'First Resource value matches');
        
        Test.stopTest();
    }

    @isTest
    private static void testRequestParser_DoubleBackslash(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/crm/v1/accounts//12345/';
        String baseResource = '/crm/v1/accounts';
        
        Test.startTest();

        RESTRequestInfo reqInfo = RESTRequestParser.parseRequest(req, baseResource);
        System.assertEquals(baseResource, reqInfo.baseResource, 'Base Resource matches');
        System.assertEquals(0, reqInfo.requestParamsMap.size(), 'Request Parameters map size');
        System.assertEquals(1, reqInfo.resourceValueMap.size(), 'Resource value map size');
        System.assertEquals('12345', reqInfo.resourceValueMap.get(0), 'First Resource value matches');
        
        Test.stopTest();
    }

}
