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
public virtual with sharing class RESTServiceBaseHandler{

    private String mServiceVersion;
    
    public RestRequest mRequest {get; set;}
    public RESTRequestURLInfo mRequestURLInfo {get; set;}

    public RestResponse mResponse {get; set;}

    public Boolean mHasError {get; set;}
    public List<RESTErrorResponse.ErrorInfo> mErrorList {get; set;}
    
    public RESTServiceBaseHandler(String pServiceVersion) {
        mRequest = RestContext.request;
        mResponse = RestContext.response;
        mResponse.addHeader('Content-Type', 'application/json');
        
        mServiceVersion = pServiceVersion;
        
        mErrorList = new List<RESTErrorResponse.ErrorInfo>();
        mHasError = false;
    }

    public String getServiceVersion(){
        return mServiceVersion;
    }
    
    /*
     * !!! IMPORTANT !!!
     * The derived class should call this method to parse the 
     * RestRequest as per the base resource of the service and
     * populate RESTRequestInfo.
     *
     * The base resource should not have '/' at the end of 
     * the resource URL
     * e.g. /crm/v1/accounts   is a valid base resource
     *      /crm/v1/accounts/  is not a valid base resource
     */
    public void parseRequestURL(String pBaseResource){
        mRequestURLInfo = RESTRequestURLParser.parse(mRequest, pBaseResource);
    }

    /* Methods for Http Requests - to be defined in derived classes */
    //GET
    public virtual void fetchRecords(){
        invalidRequest();
    }
    //POST
    public virtual void createRecords(){
        invalidRequest();
    }
    //PATCH
    public virtual void updateRecords(){
        invalidRequest();
    }
    //DELETE
    public virtual void deleteRecords(){
        invalidRequest();
    }
    
    private void invalidRequest(){
        addError(RESTConstants.REQUEST_ACTION_NOT_SUPPORTED);
        setErrorResponse(RESTConstants.HTTP_BAD_REQUEST);
    }
    
    public void clearErrorStack(){
        mHasError = false;
        mErrorList = new List<RESTErrorResponse.ErrorInfo>();
    }
    
    public void addError(String errorMessage) {
        addError(errorMessage, null);
    }
    
    public void addError(String errorMessage, String errorDetails) {
        mHasError = true;
    
        RESTErrorResponse.ErrorInfo errorInfo = new RESTErrorResponse.ErrorInfo();
        errorInfo.errorMessage = errorMessage;
        errorInfo.errorDetails = errorDetails;
        
        mErrorList.add(errorInfo);
    }

    public void setErrorResponse(Integer pErrorCode){
        RESTErrorResponse errorResponse = new RESTErrorResponse();
        errorResponse.errorInfoList = mErrorList;
        errorResponse.errorCount = errorResponse.errorInfoList.size();
        errorResponse.responseDateTime = DateTime.now();
        
        setResponse(pErrorCode, errorResponse);
    }
    
    public void setResponse(Integer pStatusCode, Object pResponse){
        String responseJSON = JSON.serialize(pResponse);
        logMessage('--- Response : ' + responseJSON);
        
        mResponse.responseBody = Blob.valueOf(responseJSON);
        mResponse.statusCode = pStatusCode;
    }
    
    public void logMessage(String pMsg){
        System.debug(loggingLevel.DEBUG, pMsg);
    }
    
}
