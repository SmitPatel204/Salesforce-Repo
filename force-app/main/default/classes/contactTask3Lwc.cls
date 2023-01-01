public with sharing class contactTask3Lwc {
    public contactTask3Lwc() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accId){
        return[SELECT Id,LastName,FirstName,Phone FROM Contact WHERE AccountId =: accId];
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunity(Id accId){
        return[SELECT Id,Name,StageName FROM Opportunity WHERE AccountId =: accId];
    }
    // @AuraEnabled(cacheable=true)
    // public static void getContacts(Id accId){
    //     List<Contact> conList  = [SELECT Id,LastName,FirstName FROM Contact WHERE AccountId =: accId];
    //     System.debug('con list : '+conList);
    // }
}
