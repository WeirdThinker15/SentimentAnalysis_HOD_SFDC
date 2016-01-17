/*
 * Class Name 	: HODClient
 * Description	: This class helps in invoking the required HOD APIs 
 */ 

public class HODClient 
{
	private String apiKey;
    private HttpClient http;
    
    public HODClient()
    {
        HOD_Configurations__c  hod = HOD_Configurations__c.getValues('Default');
        this.apiKey = hod.API_Key__c;
        this.http = new HttpClient(apiKey);
    }
    public HODClient(String apiKey)
    {
        this.apiKey = apiKey;
        this.http = new HttpClient(apiKey);
    }
    
    public String getSentiment(String inp)
    {
        return http.getResult(inp);
    }
    
    
}