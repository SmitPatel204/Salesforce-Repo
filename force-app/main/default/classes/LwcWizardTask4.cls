public with sharing class LwcWizardTask4 {
    public LwcWizardTask4() {

    }

    @AuraEnabled
    public static List<Object> getRecords(String objName){
        List<Object> recList = new List<Object>();
         try {
            System.debug('Value is = '+objName);
            String query = '';
            if(objName.equals('Account'))
            {
                query = 'select id,name,email__c from ';
            }else {
                query = 'select id,name,firstname,lastname,email from ';
            }
            query = query + objName; 
            recList = Database.query(query);
            System.debug('List of Records = '+recList);
        } catch (Exception e) {
            // ErrorLogException.getError(e);
            throw new AuraHandledException(e.getMessage());
        }
        return recList;
    }

    @AuraEnabled
    public static void sendEmailController(List<String> emailDetailStr,List<String> nameDetailStr,String Subject,String Body) {
        System.debug(nameDetailStr);
        // System.debug(ccAddress); 
        // System.debug(Subject); 
        // System.debug(Body); 
        // Body += nameDetailStr;
        List<String> mailId;
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Integer i=0; i<emailDetailStr.size(); i++){
            mailId = new List<String>();
            messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
            mail.setSaveAsActivity(false);
            mailId.add(emailDetailStr[i]);
            mail.setToAddresses(mailId);
            // mail.setCcAddresses(ccAddress);
            mail.setReplyTo('test.k@xyz.com');
            mail.setSenderDisplayName('Test Email');
            mail.setSubject(subject);
            mail.setHtmlBody('Hi, '+nameDetailStr[i]+'<br/>'+body);
            // mail.setEntityAttachments(emailDetails.files);
            // System.debug('mail = '+mail);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
        // Messaging.reserveSingleEmailCapacity(1);
        // try {
        //     messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        //     mail.setToAddresses(emailDetailStr);
        //     mail.setCcAddresses(ccAddress);
        //     mail.setReplyTo('test.k@xyz.com');
        //     mail.setSenderDisplayName('Test Email');
        //     mail.setSubject(Subject);
        //     mail.setHtmlBody(Body);
        //     // mail.setEntityAttachments(emailDetails.files);
        //     Messaging.sendEmail(new List<messaging.SingleEmailMessage>{ mail });
        // } catch (exception e) {
        //     throw new AuraHandledException(e.getMessage());
        // }
    }

    // @AuraEnabled
    // public static List<Object> getRecords(String objName){
    //     List<Object> recList = new List<Object>();
    //      try {
    //         System.debug('Value is = '+objName);
    //         String query = '';
    //         if(objName.equals('Account'))
    //         {
    //             query = 'select id,name,email__c from ';
    //         }else {
    //             query = 'select id,name,email from ';
    //         }
    //         query = query + objName; 
    //         recList = Database.query(query);
    //         System.debug('List of Records = '+recList);
    //     } catch (Exception e) {
    //         // ErrorLogException.getError(e);
    //     }
    //     return recList;
    // }

    // @AuraEnabled
    // public static void sendEmailController(List<String> emailDetailStr,List<String> nameDetailStr, List<String> ccAddress,String Subject,String Body) {
        
    //     // List<String> mailId;
    //     List<String> mailId;
    //     List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    //     for(Integer i=0; i<emailDetailStr.size(); i++){
    //         mailId = new List<String>();
    //         messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
    //         mail.setSaveAsActivity(false);
    //         mailId.add(emailDetailStr[i]);
    //         mail.setToAddresses(mailId);
    //         mail.setCcAddresses(ccAddress);
    //         mail.setReplyTo('test.k@xyz.com');
    //         mail.setSenderDisplayName('Test Email');
    //         mail.setSubject(subject);
    //         mail.setHtmlBody('Hello, '+nameDetailStr[i]+'<br/>'+body);
    //         // mail.setEntityAttachments(emailDetails.files);
    //         // System.debug('mail = '+mail);
    //         mails.add(mail);
    //     }
    //     Messaging.sendEmail(mails);    
    //     // mails.add(mail);
    //     // System.debug('Hello Here is email');
    //     // System.debug(emailDetailStr);
    //     // System.debug(ccAddress); 
    //     // System.debug(Subject); 
    //     // System.debug(Body); 
    //     // Messaging.reserveSingleEmailCapacity(1);
    //     // try {
    //     //     messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
    //     //     mail.setToAddresses(emailDetailStr);
    //     //     mail.setCcAddresses(ccAddress);
    //     //     mail.setReplyTo('test.k@xyz.com');
    //     //     mail.setSenderDisplayName('Test Email');
    //     //     mail.setSubject(Subject);
    //     //     mail.setHtmlBody(Body);
    //     //     // mail.setEntityAttachments(emailDetails.files);
    //     //     Messaging.sendEmail(new List<messaging.SingleEmailMessage>{ mail });
    //     // } catch (exception e) {
    //     //     throw new AuraHandledException(e.getMessage());
    //     // }
    // }
}
