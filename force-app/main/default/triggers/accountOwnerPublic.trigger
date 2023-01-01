trigger accountOwnerPublic on Account (before insert,before update) {
    // if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
    //     System.debug('New Value : '+Trigger.new);
    //     System.debug('Old Value : '+Trigger.old);
    //     System.debug('NewMap Value : '+Trigger.newMap);
    //     System.debug('OldMap Value : '+Trigger.oldMap);
    //     AccountTriggerHandler.changeOwnerAsPublic(Trigger.New);
    // }
}