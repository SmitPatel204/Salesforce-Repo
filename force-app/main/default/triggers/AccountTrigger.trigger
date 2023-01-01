trigger AccountTrigger on Account (before insert,after insert) {
    // Task - 8 
    // if(Trigger.isBefore){
    //     if(Trigger.isInsert){
    //         AccountTriggerHandler.prefixToAccName(Trigger.New);
    //     }
    // }
    // Task - 10
    // if(Trigger.isAfter){
    //     if(Trigger.isInsert){
    //         System.debug('submitApp New : '+Trigger.New);
    //         AccountTriggerHandler.submitApproval(Trigger.New);
    //     }
    // }
    // Task - 12
    // if(Trigger.isAfter){
    //     if(Trigger.isInsert){
    //         System.debug('New Contact With account name : '+Trigger.New);
    //         AccountTriggerHandler.createContact(Trigger.New);
    //     }
    // }
    // Task - 14
    // if(Trigger.isBefore){
    //     if(Trigger.isInsert){
    //         System.debug('delete account : '+Trigger.New);
    //         AccountTriggerHandler.deleteExistingAccount(Trigger.New);
    //     }
    // }
    // if(Trigger.isBefore){
    //     if(Trigger.isInsert){
    //         System.debug('Insert account : '+Trigger.New);
    //         HandleCustomExceptionTest.CreateAccount(Trigger.New);
    //     }
    // }


}