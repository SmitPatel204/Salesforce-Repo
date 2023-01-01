public with sharing class newDragAndDrop {
    @AuraEnabled
    public static List<Contact> getContact1(String AccName1){            
        return [SELECT LastName FROM Contact WHERE Account.Name =: AccName1];      
    }

    @AuraEnabled
    public static List<Contact> getContact2(String AccName2){
        return [SELECT LastName FROM Contact WHERE Account.Name =: AccName2];             
    }

    @AuraEnabled
    public static Contact updateACcountName(Id conId, string AccName){
        List<Account> acc = [SELECT ID FROM Account WHERE Name =: AccName];
        Contact con = new Contact();
        con.Id = conId;
        con.AccountId = acc[0].ID;
        update con; 
        return con;            
    }

    @AuraEnabled
    public static Integer countCon1(String AccName){
       Integer  a = [SELECT COUNT() FROM Contact WHERE Account.Name =:AccName];
       return a;
    }
    @AuraEnabled
    public static Integer countCon2(String AccName){
       Integer  a = [SELECT COUNT() FROM Contact WHERE Account.Name =:AccName];
       return a;
    }





    



    @AuraEnabled
    public static String AccountName1(String AccName){
        String a = AccName;
       return a;
    }
    @AuraEnabled
    public static String AccountName2(String AccName){
        String a = AccName;
       return a;
    }
}
