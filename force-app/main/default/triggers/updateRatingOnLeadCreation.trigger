trigger updateRatingOnLeadCreation on Lead (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        // for(Lead nLead: Trigger.New){
        //     nLead.Rating = 'Hot';
        System.debug('New value : '+Trigger.New);
        LeadTriggerHandler.updateRating(Trigger.New);
    }
}
