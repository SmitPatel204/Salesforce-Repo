trigger contextVariable on Account (before insert, before update, before delete, after insert, after update, after undelete, after delete) {
    if(Trigger.isBefore){
        if (Trigger.isInsert) {
            System.debug('Before Insert');
        }else if(Trigger.isUpdate){
            System.debug('Before Update');
        }else if(Trigger.isDelete){
            System.debug('Before Delete');
        }
        System.debug('Before events');
        System.debug('Trigger New'+Trigger.new);
        System.debug('Trigger old'+Trigger.old);
        System.debug('Trigger olMap'+Trigger.oldMap);
        System.debug('Trigger newMap'+Trigger.newMap);
    }else if(Trigger.isAfter){
        if(Trigger.isInsert){
            System.debug('After Insert');
        }else if(Trigger.isUpdate){
            System.debug('After Update');
        }else if(Trigger.isDelete){
            System.debug('After Delete');
        }else if(Trigger.isUndelete){
            System.debug('After unDelete');
        }
        System.debug('After events');
        System.debug('Trigger New'+Trigger.new);
        System.debug('Trigger old'+Trigger.old);
        System.debug('Trigger newMap'+Trigger.newMap);
        System.debug('Trigger oldMap'+Trigger.oldMap);
    }
}