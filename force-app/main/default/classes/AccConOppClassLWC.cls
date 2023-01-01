public with sharing class AccConOppClassLWC {
    // public String accountId{get;set;}
    // public Account actObj{get;set;}
    // public AccConOppClassLWC() {
    //     actObj = new Account();
    // }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return[SELECT Id,Name,Phone FROM Account limit 15];
    }
    // public pageReference retriveAccountDetails(){
    //     if(accountId != null){
    //         actObj = [SELECT Id,Name,Phone FROM Account WHERE id =: accountId];
    //     }
    //     return null;
    // }
}
