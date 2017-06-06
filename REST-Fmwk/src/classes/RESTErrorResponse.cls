/* 
 * Class   : RESTBaseResponse
 * Purpose : This class is to be returned as Response in case 
 *           something goes wrong in the RESTful service.
 * Author  : Simran Singh
 */
public class RESTErrorResponse{
    public String requestStatus {get; set;}
    public Datetime responseDateTime {get; set;}
    public List<ErrorInfo> errorInfoList {get; set;}
    public Integer errorCount {get; set;}
    
    // Wraps the details of error.
    public class ErrorInfo {
        public String errorMessage {get; set;}
        public String errorDetails {get; set;}
    }
    
    public RESTErrorResponse() {
        requestStatus = RESTConstants.STATUS_ERROR;
        errorInfoList = new List<ErrorInfo>();
        errorCount = 0;
    }
}