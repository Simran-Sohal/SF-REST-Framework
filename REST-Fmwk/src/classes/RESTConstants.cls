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
