/* 
 * Class   : RESTConstants
 * Purpose : Constants for REST Services
 * Author  : Simran Singh
 */
public class RESTConstants {
    //constants for service versions
    public static final String VERSION_1 = 'v1';
    
    //constants for HTTP Methods
    public static final String HTTP_GET = 'GET';
    public static final String HTTP_POST = 'POST';
    public static final String HTTP_PATCH = 'PATCH';
    public static final String HTTP_DELETE = 'DELETE';
    
    //constants for status codes
    public static final Integer HTTP_OK = 200;
    public static final Integer HTTP_CREATED = 201;
    public static final Integer HTTP_BAD_REQUEST = 400;
    public static final Integer HTTP_NOT_FOUND = 404;
    public static final Integer HTTP_INTERNAL_ERROR = 500;

    //constants for statuses
    public static final String STATUS_SUCCESS = 'Success';
    public static final String STATUS_ERROR = 'Error';

}