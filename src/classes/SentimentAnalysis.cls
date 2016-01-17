/*
 * Class Name 	: SentimentAnalysis
 * Description	: This class implements the Email Services to process the email contents and it will invoke the 
 * 				  Sentiment Analysis API of Haven On Demand and does the required processing on API result.
 */ 
global class SentimentAnalysis implements Messaging.InboundEmailHandler
{
	 global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
		 //Get the Email Body 
		 String emailBody = email.plainTextBody; 
         String res = invokeSentimentAPI(emailBody);
         Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
         result.success = true;
         result.message = res;
         return result;
      }
    
    /*
     * Function		: invokeSentimentAPI
     * Description	: This will invoke the Sentiment Analysis API of HOD
     * @params		: String
     * @returns 	: String
     */ 
    
    public String invokeSentimentAPI(String inpText)
    {
        String res;
        HODClient hod = new HODClient();
        res = hod.getSentiment(inpText);
      //  System.debug('Sentiment is ');
        res = processResult(res);
        return res;
    }
    
	/*
     * Function		: processResult
     * Description	: This will process the result of the Sentiment Analysis API of HOD
     * @params		: String
     * @returns 	: String
     */     
    
    private String processResult(String inp)
    {
        String res = '';
        Map<String,Object> jsResult = (Map<String,Object>)json.deserializeUntyped(inp);
        Map<String,Object> sentiment = (Map<String,Object>)jsResult.get('aggregate');
        res = (String)sentiment.get('sentiment');
        return prepareResponse(res);
    }
    
    /*
     * Function		: prepareResponse
     * Description	: This will prepare the response depending on the Sentiment analysed
     * @params		: String
     * @returns		: String
     */
    
    private String prepareResponse(String sentiment)
    {
        if(sentiment.equalsIgnoreCase('positive'))
            return 'Thank You for a positive feedback . We will continue to strive to provide a better customer experience and we also hope that you continue to enjoy the services.';
        else
           return 'Thank You for your feedback. We are extremely sorry that our service did not meet your expectations. We will continue to improve our services and hope it does not affect you in future'; 
    }
    
}