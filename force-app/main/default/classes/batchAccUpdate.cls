global class batchAccUpdate implements Database.Batchable<sObject> {
    
    // Start 
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,Name FROM Account]);
    }
    // Execute 
    global void execute(Database.BatchableContext bc,List<Account> acc){
        for(Account a : acc){
            a.Name = a.Name + '- Batch Update';
        }
        update acc;
    }
    // Finish
    global void finish(Database.BatchableContext bc){
        batchOppoCreate bOppC = new batchOppoCreate();
        Database.executeBatch(bOppC);
    }

}
