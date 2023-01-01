public with sharing class soslTaskFive {
    @AuraEnabled(Cacheable = true)
    public static List<List<SObject>> getAccountData(String textkey) {
        try {
            textkey = '%' + textkey + '%';
            System.debug('search name'+ textkey);
            List<List<SObject>> searchList = [FIND : textkey IN ALL FIELDS RETURNING Account(Name,Phone,Rating,Email__c), Contact(FirstName,LastName,Email,Phone) ,Lead(Name,Email,Company,Phone),Opportunity(Name,StageName,CloseDate,Type)];
            System.debug('serch List' + searchList);
            return searchList; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable = true)
    public static list<SObject> getAccount(String filed1, String filed2, String filed3,String filed4,String filed5 ) {
        try {
            list<SObject> accLst = Database.query('SELECT '+ filed1 + ','+ filed2 + ','+ filed4 + ','+ filed5 + ' FROM ' + filed3 + ' LIMIT 10');
            System.debug(accLst);
            return accLst;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
