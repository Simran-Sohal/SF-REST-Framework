/* 
 * Class   : RESTRequestInfo
 * Purpose : This class is used a type to store the 
 *           details of RESTful service request
 * Author  : Simran Singh
 */
public virtual class RESTRequestInfo {

    public String baseResource {get; set;}
    public Map<Integer, String> resourceValueMap {get; set;}
    public Map<String, String> requestParamsMap {get; set;}
        
    public RESTRequestInfo(String pBaseResource) {
        baseResource = pBaseResource;
        resourceValueMap = new Map<Integer, String>();
        requestParamsMap = new Map<String, String>();
    }
    
}