trigger sendEmailToCon on Account (before update) {
    // if(Trigger.isBefore && Trigger.isUpdate){
    //     System.debug('New Val :'+Trigger.new);
    //     System.debug('OldMap Val :'+Trigger.oldMap);
    //     AccountTriggerHandler.sendEmailToContacts(Trigger.new,Trigger.oldMap);
    // }
}