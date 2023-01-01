trigger UpdateStagenameAndClosedate on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('New value : '+Trigger.New);
        System.debug('oldMap value : '+Trigger.oldMap);
        OppoTriggerHandler.updateStagename(Trigger.New,Trigger.oldMap);
    }    
}