trigger OpportunityTrigger on Opportunity (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            OppoTriggerHandler.assignTaskToRecordOwner(Trigger.New,Trigger.oldMap);
        }
    }
}