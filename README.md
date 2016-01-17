# SentimentAnalysis using Haven On Demand in Salesforce

What is it ? 
------------
This is a small POC in Salesforce which uses the Sentiment Analysis API of Haven On Demand to send an appropriate mail to the sender whenever a mail is recevied at a specified email address.

Installation 
------------
The Source Code Package is provided with all the required components . Deploy it to your development org using Ant or Force.com IDE.

Post-Deployment Steps 
---------------------

1. Create a new Email Service and configure it to use the SentimentAnalysis Apex Class for its processing.
2. Create a new Email Address for the Email Service created in Step 1.
3. Create a new record for the Custom Setting HOD_Configurations__c. Provide the name as 'Default' and also provide the API Key for using the Haven On Demand APIs.

Detailed Walkthrough
--------------------
The Blog Post at <> throws light on the POC in detail. 



