public with sharing class LeadTriggerHandler {
    // Task - 2
    public static void updateRating(List<Lead> newList){
        for(Lead nLead: newList){
            nLead.Rating = 'Hot';
        }
    }
}    
