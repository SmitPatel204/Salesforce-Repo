public with sharing class dragAndDropCon {
    @AuraEnabled
    public static List <Account> getByName(String searchKey){    
        String name = searchKey;
        return [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id, Name FROM Account WHERE Name LIKE :name];  
    }
    // @AuraEnabled
    // public static List <Account> getByName1(String searchKey1){    
    //     String name1 = searchKey1;
    //     return [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id, Name FROM Account WHERE Name LIKE :name1]; 
    // }
    @AuraEnabled
    public static Contact updateCon(Id conId, String accName){
        List<Account> acc = [SELECT ID FROM Account WHERE Name =: accName];
        Contact con = new Contact();
        con.Id = conId;
        con.AccountId = acc[0].Id;
        update con; 
        return con;            
    }
    @AuraEnabled
    public static Integer conCount1(String searchKey){    
        String name = searchKey;
        return [SELECT COUNT() FROM Contact WHERE Account.Name LIKE :name]; 
    }
    @AuraEnabled
    public static Integer conCount2(String searchKey1){    
        String name1 = searchKey1;
        return [SELECT COUNT() FROM Contact WHERE Account.Name LIKE :name1]; 
    }
}   
// Set<Id> accId = new Set<Id>();
//         accId.add(conId);

//         List<Object> conList = [SELECT Id,Name,AccountId FROM Contact WHERE AccountId = accId];