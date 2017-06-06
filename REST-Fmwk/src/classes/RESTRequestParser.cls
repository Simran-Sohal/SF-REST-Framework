/* 
 * Class   : RESTRequestParser
 * Purpose : This class is used to parser the REST request URL
 * Author  : Simran Singh
 * 
 * !!! IMPORTANT !!!
 * Always use the names of base resources and the extended recourses in lower case
 * 
 */
public class RESTRequestParser {

    public static RESTRequestInfo parseRequest(RestRequest pRequest, String pBaseResource) {
        System.debug(loggingLevel.ERROR, '--- REST Request URI : ' + pRequest.requestURI);
        System.debug(loggingLevel.ERROR, '--- Base Resource : ' + pBaseResource);
        
        if(String.isBlank(pRequest.requestURI) || String.isBlank(pBaseResource)) return null; 

        RESTRequestInfo requestInfo = new RESTRequestInfo(pBaseResource);
        requestInfo.requestParamsMap = pRequest.params;
        requestInfo.resourceValueMap = getResourceValueMap(pRequest.requestURI, pBaseResource);
        System.debug(loggingLevel.ERROR, '--- <<OUTPUT>> Request Info : ' + requestInfo);
        return requestInfo;
    }
    
    public static Map<Integer, String> getResourceValueMap(String pRequestURI, String pBaseResource){
        String extendedResource = pRequestURI.toLowerCase().substringAfter(pBaseResource.toLowerCase());
        System.debug(loggingLevel.ERROR, '--- Extended Resource : ' + extendedResource);

        Map<Integer, String> resourceValueMap = new Map<Integer, String>();
        
        if (String.isNotBlank(extendedResource) && extendedResource.startsWith('/')){
            Integer resourceIdx = 0;
            while(extendedResource.length() > 0){
                extendedResource = extendedResource.substringAfter('/');
                String resourceVal = extendedResource.substringBefore('/');
                    
                if (String.isNotBlank(resourceVal)){
                    System.debug(loggingLevel.ERROR, '--- Resource Index : ' + resourceIdx);
                    System.debug(loggingLevel.ERROR, '--- Resource Value : ' + resourceVal);
                    resourceValueMap.put(resourceIdx, resourceVal);
                    resourceIdx++;
                }
                    
                extendedResource = extendedResource.substringAfter(resourceVal);
                System.debug(loggingLevel.ERROR, '--- Remaining Extended Resource : ' + extendedResource);
            }
        } 
        
        return resourceValueMap;
    }
    
}