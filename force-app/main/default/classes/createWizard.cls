public with sharing class createWizard {
    @AuraEnabled
    public static string save(Account accountData ,Contact contactData,Event eventData){
        try{
            // ownId =  [SELECT Id FROM User WHERE Owner.Id = :UserInfo.getUserId()];
            System.debug('accountData:'+accountData);
            System.debug('contactData:'+contactData);
            System.debug('eventData:'+eventData);
            
            insert accountData;
            contactData.AccountId = accountData.id;
            insert contactData;
            eventData.WhoId = contactData.id;
            insert eventData;
        }
        catch(Exception ex){
            // return ex.getMessage();
            HandleCustomException.LogException(e);
        }
        return 'Record Successfully Inserted';  
    }
}
