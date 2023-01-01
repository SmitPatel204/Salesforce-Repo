public with sharing class taskFourWizardLwc {
    // List<Account> accList = new List<Account>();
    // List<Contact> conList = new List<Contact>();
    // List<Lead> leadList = new List<Lead>();
    public taskFourWizardLwc() {

    }
    // @AuraEnabled(cacheable=true)
    // public static List<FieldDefinition> getfields(string objectname){
    //     string query = 'select DeveloperName,QualifiedApiName from FieldDefinition where EntityDefinition.QualifiedApiName = :objectname ORDER BY DeveloperName ASC';
    //     list<FieldDefinition> lstObject = Database.query(query);
    //     system.debug('lstObject==> '+lstObject);
    //     return lstObject;
    // }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return [SELECT Id,Name,Email__c,Phone,Rating FROM Account WHERE Email__c != NULL];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        return [SELECT Id,Name,LastName,FirstName,Email,Phone FROM Contact WHERE Email != NULL];
    }
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLead(){
        return [SELECT Id,Name,Email,Company FROM Lead WHERE Email != NULL Limit : 5];
    }
    @AuraEnabled(cacheable=true)
    public static void sendEmailToController(String body, list<String> toSend, String subject){
        try{
          for (String  a : toSend) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a};
            System.debug('toAddresses:::::' + toAddresses);
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setHtmlBody(body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });    
        }
           
        }catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
}
