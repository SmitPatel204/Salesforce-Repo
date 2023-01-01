public with sharing class OppoTriggerHandler {
    // Task - 3
    public static void updateStagename(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        for(Opportunity nOppo : newList){
            if(oldMap != null){
                nOppo.StageName = 'Prospecting';
                nOppo.CloseDate = Date.Today()+15;
            }
        }
    }
    // Task - 4
    public static void oppoType(List<Opportunity> newList){
        for(Opportunity nOppo1 : newList){
            nOppo1.Type ='New Customer';
        }
    }

    // Task - 7
    public static void assignTaskToRecordOwner(List<Opportunity> oppList,Map<Id,Opportunity> oldMap){
        List<Task> tasklist = new List<Task>();

        for(Opportunity nOppo2 : oppList){
            if(nOppo2.Name != oldMap.get(nOppo2.Id).Name){
                Task tk = new Task();
                tk.whatId = nOppo2.Id;          //related to oppo
                tk.Subject = nOppo2.name;
                tk.Priority = 'High';
                tk.Status = 'Not Started';
                tk.OwnerId = nOppo2.OwnerId;    // Or UserInfo.getUserId, assign task to loged in user
                tasklist.add(tk);            // add task into tasklist
            }
        }
        if(!tasklist.isEmpty()){
            insert tasklist;
        }
    }
}
