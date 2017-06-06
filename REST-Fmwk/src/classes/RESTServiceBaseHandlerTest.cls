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
private class RESTServiceBaseHandlerTest {

    @isTest
    private static void testBaseHandlerRequestAction(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/crm/v1/accounts/12345';
        
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        String baseResource = '/crm/v1/accounts';
        
        Test.startTest();
        RESTServiceBaseHandler baseHdlr = new RESTServiceBaseHandler(RESTConstants.VERSION_1);
        System.assertEquals(RESTConstants.VERSION_1, baseHdlr.getServiceVersion(), 'Service version match');

        baseHdlr.parseRequestURL(baseResource);
        System.assertEquals(baseResource, baseHdlr.mRequestURLInfo.baseResource, 'Base Resource match');
        
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
