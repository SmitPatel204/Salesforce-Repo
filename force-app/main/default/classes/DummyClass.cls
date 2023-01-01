public with sharing class DummyClass {
    public void insertAcc()
    {
        List<Account> accts = new List<Account>();
        System.debug('Before insert : '+accts);
        for (Integer a = 0; a <5; a++) {
            accts.add(new Account(Name = 'Test ' + a));
        }	
        if(accts.size()>0)
        {
            Insert accts;
        }
    }
}
