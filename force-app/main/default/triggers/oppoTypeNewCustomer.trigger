trigger oppoTypeNewCustomer on Opportunity (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('New Value : '+Trigger.New);
        OppoTriggerHandler.oppoType(Trigger.New);
    }
}