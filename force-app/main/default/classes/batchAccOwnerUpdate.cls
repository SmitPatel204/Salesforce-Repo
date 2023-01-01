global class batchAccOwnerUpdate implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        Id userId = UserInfo.getUserId();                   
        System.debug('userId in start method :'+userId);    //current user
        return Database.getQueryLocator([SELECT Id,Name,OwnerId FROM Account WHERE OwnerId=:userId]);
    }
    global void execute(Database.BatchableContext bc,List<Account> acc){
        System.debug('this is EXECUTE method ');
        System.debug('size ---- '+acc.size());
        User newOwner = [SELECT id, name FROM User WHERE name='Bob John'];
        System.debug('new user owner id :'+newOwner.id);
        for(Account a : acc){
            a.ownerId = newOwner.id;
        }
        System.debug('new list of acc to be update : '+acc);
        update acc;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {'harsh.s@mvclouds.com'};
        mail.setToAddresses(toAddress);
        mail.setSubject('Update account owner');   
        mail.setPlainTextBody('Hii, You have assign new accounts.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}










// global Database.QueryLocator start(Database.BatchableContext bc){
//     return Database.QueryLocator([SELECT Id,Name,OwnerId FROM Account]);
// }
// global void execute(Database.BatchableContext bc,List<Account> acc){
//     for(Account a : acc){
//         a.OwnerId =     
//     }
// }
// global void finish(Database.BatchableContext bc){
//     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//     String[] toAddress = new String[] {};
//     mail.setToAddress (toAddress);
//     mail.setSubject('Update your account owner');
//     mail.setPlainTextBody('Hii, Account has updated.');
//     Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
// }