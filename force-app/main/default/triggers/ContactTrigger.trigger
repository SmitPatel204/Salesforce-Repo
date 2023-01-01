trigger ContactTrigger on Contact (before insert ,before update ,after insert,after update,after delete) {
    // Task - 9
    // if(Trigger.isAfter){
    //     if(Trigger.isDelete){
    //         ContactTriggerHandler.accDeleted(Trigger.old);
    //     }
    // }
    // Task - 13
    // if(Trigger.isAfter){
    //     if(Trigger.isInsert){
    //         ContactTriggerHandler.createEventForContact(Trigger.new);
    //     }
    // }
    // Roll Up Summary 
    // if(Trigger.isAfter){
    //     if(Trigger.isInsert){
    //         System.debug('onInsert New trigger : '+Trigger.new);
    //         ContactTriggerHandler.onInsertAmount(Trigger.new);
    //     }else if(Trigger.isUpdate){
    //         System.debug('onUpdate New trigger : '+Trigger.new);
    //         System.debug('onUpdate oldMap trigger : '+Trigger.oldMap);
    //         ContactTriggerHandler.onUpdateAmount(Trigger.new,Trigger.oldMap); 
    //     }else if(Trigger.isDelete){
    //         System.debug('onContactDelete old trigger : '+Trigger.old);
    //         ContactTriggerHandler.onDeleteContact(Trigger.old);
    //     }
    // }
    // Sheep Problem 
    // if(Trigger.isAfter){
    //     if(Trigger.isUpdate){
    //         System.debug('onUpdateCon new trigger : '+Trigger.new);
    //         System.debug('onUpdateCon oldList trigger : '+Trigger.old);
    //         ContactTriggerHandler.onUpdateCon(Trigger.new,Trigger.old);
    //     }    
    // }
    // The greate problem 
    if(Trigger.isBefore){
        if(Trigger.isInsert ){
            System.debug('Trigger New : ');
            ContactTriggerHandler.conInsert(Trigger.new);
        }
        else if (Trigger.isUpdate){
            System.debug('Trigger New : ');
            ContactTriggerHandler.conInsert(Trigger.new);
        }
    }
}