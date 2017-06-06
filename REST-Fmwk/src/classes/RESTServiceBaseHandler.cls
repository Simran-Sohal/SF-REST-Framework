/* 
 * Class   : RESTServiceBaseHandler
 * Purpose : Base class for all REST Service handler classes
 *           and has default implementation of the relevant 
 *           methods for the REST actions
 * Author  : Simran Singh
 */
public virtual with sharing class RESTServiceBaseHandler{

    private String mServiceVersion;
    
    public RestRequest mRequest {get; set;}
    public RESTRequestInfo mRequestInfo {get; set;}

    public RestResponse mResponse {get; set;}

    public Boolean mHasError {get; set;}
    public List<RESTErrorResponse.ErrorInfo> mErrorList {get; set;}
    public RESTErrorResponse mErrorResponse {get; set;}
    
    /*
     * !!! IMPORTANT !!!
     * The derived class of this base class should pass the 
     * base resource to the super() constructor.
     * The base resource should not have '/' at the end of 
     * the resource URL
     * e.g. /ans/v1/dataRooms   is a valid base resource
     *      /ans/v1/dataRooms/  is not a valid base resource
     */
    public RESTServiceBaseHandler(String pBaseResource, String pServiceVersion) {
        mRequest = RestContext.request;
        mRequestInfo = RESTRequestParser.parseRequest(mRequest, pBaseResource);
            
        mResponse = RestContext.response;
        mResponse.addHeader('Content-Type', 'application/json');
        
        mServiceVersion = pServiceVersion;
        
        mErrorList = new List<RESTErrorResponse.ErrorInfo>();
        mHasError = false;
    }

    public String getServiceVersion(){
        return mServiceVersion;
    }

    /* Interface Methods */
    public virtual void fetchRecords(){
        invalidRequest();
    }
    public virtual void createRecords(){
        invalidRequest();
    }
    public virtual void updateRecords(){
        invalidRequest();
    }
    public virtual void deleteRecords(){
        invalidRequest();
    }
    
    private void invalidRequest(){
        addError(Label.Invalid_Rest_Action);
        setErrorResponse(RESTConstants.HTTP_BAD_REQUEST);
    }
    
    public void clearErrorStack(){
        mHasError = false;
        mErrorList = new List<RESTErrorResponse.ErrorInfo>();
        mErrorResponse = new RESTErrorResponse();
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

    public void setErrorResponse(Integer errorCode){
        mErrorResponse = new RESTErrorResponse();
        mErrorResponse.errorInfoList = mErrorList;
        mErrorResponse.errorCount = mErrorResponse.errorInfoList.size();
        mErrorResponse.responseDateTime = DateTime.now();

        mResponse.statusCode = errorCode;
        mResponse.responseBody = Blob.valueOf(JSON.serialize(mErrorResponse));
    }
    
}