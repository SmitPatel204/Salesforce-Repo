public with sharing class ContactTriggerHandler {
    // Task - 9
    public static void accDeleted(List<Contact> conList){
        Set<Id> accId = new Set<Id>();

        for(Contact con : conList){
            accId.add(con.AccountId);
        }
        List<Account> listacc = [SELECT Id,Name FROM Account WHERE id IN:accId];
        if(listacc != null && listacc.size()>0){
            delete listacc;
        }
    }
    // Task - 13
    public static void createEventForContact(List<Contact> conList){
        List<Task> taskList = new List<Task>();

        for(Contact con : conList){
            Task tk = new Task();
            // tk.whatId = con.Id;
            tk.whoId = con.Id;
            tk.Subject = 'Call';
            tk.Priority = 'High';
            tk.Status = 'Not Started';
            tk.OwnerId = con.OwnerId;
            taskList.add(tk);
        }
        insert tasklist;
        // if(!tasklist.isEmpty()){
        //     insert tasklist;
        // }
    }
    // Roll up Summary 
    public static List<Account> calculateTotalAmount(Set<Id> accId){
        List<Account> accToBeUpdated = new List<Account>();
        // System.debug('First accToUpdated(calculateTotalAmount) : '+accToBeUpdated);
        Map<Id, Decimal> accIdAndTotalAmount = new Map<Id, Decimal>();
        // System.debug('First accIdAndTotalAmount(calculateTotalAmount)'+accIdAndTotalAmount);

        for (Contact con : [SELECT Id,Amount__c,AccountId FROM Contact WHERE AccountId IN : accId]){
            // System.debug('First con(calculateTotalAmount)'+con);
            Decimal total =  0;
            // System.debug('First total(calculateTotalAmount)'+total);
            if(accIdAndTotalAmount.containsKey(con.AccountId)){
                total = accIdAndTotalAmount.get(con.AccountId);
                // System.debug('Second total(calculateTotalAmount)'+total);
            }
            if(con.Amount__c != null || con.Amount__c >= 0){
                total = total + con.Amount__c;
                // con.Amount__c != null || 
                // System.debug('Third total(calculateTotalAmount)'+total);
            }
            accIdAndTotalAmount.put(con.AccountId, total);
            // System.debug('second accIdAndTotalAmount(calculateTotalAmount)'+accIdAndTotalAmount);
        }
        // System.debug('Second accIdAndTotalAmount(calculateTotalAmount)'+accIdAndTotalAmount);
        if(!accIdAndTotalAmount.isEmpty()){
            for(Id i : accIdAndTotalAmount.keySet()){                
                Account acc = new Account();               
                acc.id = i;
                acc.Total_Amount__c = accIdAndTotalAmount.get(i);               
                accToBeUpdated.add(acc);
                // System.debug('Second accToBeUpdated(calculateTotalAmount)'+accToBeUpdated);
            }
        }
        return accToBeUpdated;
    }
    // onInsert 
    public static void onInsertAmount(List<Contact> conList){
        System.debug('First stage conList : '+conList);

        Set<Id> accId = new Set<Id>();
        System.debug('First stage accIds : '+accId);
        List<Account> accToBeUpdated = new List<Account>();
        System.debug('First stage accToBeUpdated : '+accToBeUpdated);

        for(Contact con : conList){
            System.debug('First stage con : '+con);
            if(con.AccountId != null){
                accId.add(con.AccountId);
                System.debug('Second stage AccountId : '+accId);
            }
        }
        accToBeUpdated = calculateTotalAmount(accId);
        System.debug('Second stage accToBeUpdated : '+accToBeUpdated);
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
            System.debug('Third stage accToBeUpdated : '+accToBeUpdated);
        }
    }
    // onUpdate 
    public static void onUpdateAmount(List<Contact> conList,Map<Id,Contact> oldMap){
        System.debug('First stage conList : '+conList);
        System.debug('First stage oldMap : '+oldMap);

        Set<Id> accId = new Set<Id>();
        System.debug('First stage accIds : '+accId);
        List<Account> accToBeUpdated = new List<Account>();
        System.debug('First stage accToBeUpdated : '+accToBeUpdated);

        for(Contact con : conList){
            System.debug('First stage con : '+con);
            if(con.AccountId != null && con.Amount__c != oldMap.get(con.Id).Amount__c){
                accId.add(con.AccountId);
                System.debug('Second stage AccountId : '+accId);
            }
        }
        accToBeUpdated = calculateTotalAmount(accId);
        System.debug('Second stage accToBeUpdated : '+accToBeUpdated);

        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
            System.debug('Third stage accToBeUpdated : '+accToBeUpdated);
        }
    }
    // onDelete 
    public static void onDeleteContact(List<Contact> oldList){
        System.debug('First stage oldList'+oldList);

        Set<Id> accId = new Set<Id>();
        System.debug('First stage accId'+accId);
        List<Account> accToBeUpdated = new List<Account>();
        System.debug('First stage accToBeUpdated'+accToBeUpdated);

        for(Contact con : oldList){
            System.debug('First stage con'+con);
            if(con.AccountId != null){
                accId.add(con.AccountId);
            }    
        }
        accToBeUpdated = calculateTotalAmount(accId);
        System.debug('Second stage accToBeUpdated : '+accToBeUpdated);

        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
            System.debug('Third stage accToBeUpdated : '+accToBeUpdated);
        }
    }
    // Sheep Problem 
    public static void onUpdateCon(List<Contact> conList,List<Contact> oldList){
        System.debug('First conList : '+conList);

        String accId;
        String accId1;
        // List<Id> accId = new List<Id>();
        System.debug('First accId : '+accId);
        System.debug('First accId1 : '+accId1);

        List<Contact> conToBeUpdated = new List<Contact>();
        System.debug('First stage conToBeUpdated : '+conToBeUpdated);
        
        for(Contact con : oldList){
            System.debug('First con for oldlist : '+con);
            if(con.AccountId != null){
                // accId1.add(con.AccountId);
                accId1 = con.AccountId;
                System.debug('Second(Old Account) accId1 : '+accId1);
            }
        }

        for(Contact con : conList){
            System.debug('First con for conlist : '+con);
            if(con.AccountId != null){
                // accId.add(con.AccountId);
                accId = con.AccountId;
                System.debug('Second(New Account) accId : '+accId);
            }
        }    

        List<Contact> conToUpdate = [SELECT Id,AccountId,LastName FROM Contact WHERE AccountId = :accId1];
        System.debug('First conToUpate : '+conToUpdate);
        for(Contact con : conToUpdate){
            if(con.AccountId != null){
                con.AccountId = accId;
                conToBeUpdated.add(con);
                
            }
        }
        update conToBeUpdated;
        System.debug('Second conToBeUpated : '+conToBeUpdated);
    }
    // The Greate Problem 
    public static void conInsert(List<Contact> conList){
        Set<Id> accId = new Set<Id>();
        System.debug('First accId : '+accId);                           //null
        List<Contact> conUpdate = new List<Contact>();
        System.debug('First conUpdate : '+conUpdate);                   //null

        for(Contact con : conList){
            System.debug('First con : '+con);                           //Test G 1 
            System.debug('First Amount : '+con.Amount__c);              //55
            if(Trigger.isInsert){
                accId.add(con.AccountId);
                System.debug('Second accId : '+accId);                  //account id of Test G 1 contact
            }
        }

        List<Account> accountToUpdate = [SELECT Id,Name,Max_Amount__c FROM Account WHERE Id IN : accId];
        System.debug('First accountToUpdate : '+accountToUpdate);       //fetch accountId,Name,Amount of Test G 1 contact

        for(Contact con1 : conList){
            System.debug('First con1 : '+con1);                         //Test G 1
            System.debug('Second Amount : '+con1.Amount__c);            //55
            if(con1.Amount__c != null && con1.Amount__c >=accountToUpdate[0].Max_Amount__c && con1.AccountId != null){
                System.debug('if If condition true');
                // Decimal total = con1.Amount__c;                       
                Contact con2 = new Contact();                           //New Trigger
                con2.LastName = con1.LastName;
                con2.AccountId = accountToUpdate[0].Id;
                con2.Amount__c = con1.Amount__c - accountToUpdate[0].Max_Amount__c;
                System.debug('Insert con amount : '+con2.Amount__c);
                conUpdate.add(con2);
                insert conUpdate;
                System.debug('Second ConUpdate : '+conUpdate);          
                con1.Amount__c = accountToUpdate[0].Max_Amount__c;
            }
            System.debug('Third ConUpdate : '+conUpdate);
            // conUpdate.clear();
            // System.debug('Fourth ConUpdate : '+conUpdate);
        }
    }

    // public static void conUpda(List<Contact> conList){

    // }
}

