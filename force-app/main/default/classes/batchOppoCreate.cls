global class batchOppoCreate implements Database.Batchable<sObject> {
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,Name FROM Account]);
    }
    // Execute 
    global void execute(Database.BatchableContext bc,List<Account> acc){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account a : acc){
            Opportunity opp = new Opportunity();
            opp.AccountId = a.Id;
            opp.Name = 'Opp -' + a.Name;
            opp.StageName = 'Qulification';
            opp.CloseDate = Date.Today()+5;
            oppList.add(opp);
            // insert oppList;
        }
        
        if(oppList.size()>0){
            insert oppList;
        }
    }
    // Finish
    global void finish(Database.BatchableContext bc){
        
    }
}
