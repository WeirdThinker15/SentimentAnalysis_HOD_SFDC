/*
 * Class Name 	: HttpClient
 * Description	: This class helps in making Http Callouts
 */ 
public class HttpClient
{
	private String authToken;
    public HttpClient(){authToken = '';}
    public HttpClient(String authToken){this.authToken = authToken;}
    
    /*
     * Function		: getResult
     * Description	: This will make the Http Callout and return the response
     */ 
    public String getResult(String inp)
    {
        String apiPath = 'https://api.havenondemand.com/1/api/sync/analyzesentiment/v1';
        String res = '';
        //Create the Http Request 
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setEndpoint(generateGetRequest(apiPath,inp).toExternalForm());
        HttpResponse resp = http.send(req);
        res = resp.getBody();
        return res;
    }
    
    /*
     * Function		: generateGetRequest
     * Description	: This creates a GET Request with all required Query Parameters populated
     */
    
    private URL generateGetRequest(String path,String inpText)
    {
        String endpoint = path;
        if(null != inpText)
        {
            endpoint += '?text=';
            endpoint += EncodingUtil.urlEncode(inpText,'UTF-8');
            endpoint += '&apikey=' + EncodingUtil.urlDecode(authToken,'UTF-8');
        }
        URL url;
        url = new URL(endpoint);
        return url;
    }
}