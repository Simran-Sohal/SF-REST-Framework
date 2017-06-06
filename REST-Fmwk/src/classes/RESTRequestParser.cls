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
