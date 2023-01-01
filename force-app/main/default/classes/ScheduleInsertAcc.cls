global with sharing class ScheduleInsertAcc Implements Schedulable{
    global static void execute(SchedulableContext sc)
    {
        List<Account> accts = new List<Account>();
        System.debug('Before insert : '+accts);
        for (Integer a = 0; a <10; a++) {
            accts.add(new Account(Name = 'Test ' + a));
        }	
        if(accts.size()>0)
        {
            Insert accts;
        }
    }
}
