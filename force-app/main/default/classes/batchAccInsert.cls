global with sharing class batchAccInsert implements Database.Batchable<sObject>,Schedulable{
    // Start 
    global List<Account> start (Database.BatchableContext bc){
        List<Account> AccList= new List<Account>();
        for(Integer i=0;i<10;i++)
        {
            account ac= new account();
            ac.Name='Batch'+i;
            AccList.add(ac);
        }
        String query = 'SELECT Id, Name FROM Account';
        return AccList;
    }
    // Execute 
    global void execute(Database.BatchableContext bc,List<Account> acc){
        if(acc.size()>0)
        {
            Insert acc;
        }
    }
    // Finish
    global void finish(Database.BatchableContext bc){
       
    }
    // Schedule apex 
    global void execute(SchedulableContext sc){
        batchAccInsert bai = new batchAccInsert();
        Database.executeBatch(bai);
    }
}
