public with sharing class displayAccAndCon {
    @AuraEnabled
    public static List<Account> getshowAccAndCon(){
        
        // List<Account> accnList = [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id,Name FROM Account];
        // return accnList;
        return [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id,Name FROM Account ORDER BY Name];                
    }
    @AuraEnabled
    public static List<Account> getByName(String searchKey){    
        String name = '%' + searchKey + '%';
        // String name = searchKey;
        return [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id, Name FROM Account WHERE name LIKE :name ORDER BY Name];   
    }
    // public static ContactDataTableWrapper getshowAccAndCon(Integer pageNumber, Integer pageSize) {
         
    //     //Offset for SOQL
    //     Integer offset = (pageNumber - 1) * pageSize;
         
    //     //Total Records
    //     Integer totalRecords = [SELECT COUNT() FROM Account];
    //     Integer recordEnd = pageSize * pageNumber;
 
    //     //Instance of Contact DataTable Wrapper Class
    //     ContactDataTableWrapper objDT =  new ContactDataTableWrapper();  
    //     objDT.pageSize = pageSize;
    //     objDT.pageNumber = pageNumber;
    //     objDT.recordStart = offset + 1;
    //     objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
    //     objDT.totalRecords = totalRecords;
    //     objDT.accnList = [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id, Name FROM Account ORDER BY Name LIMIT :pageSize OFFSET :offset];
    //     return objDT;
    // }
    // public class ContactDataTableWrapper {
    //     @AuraEnabled
    //     public Integer pageSize {get;set;}
    //     @AuraEnabled
    //     public Integer pageNumber {get;set;}
    //     @AuraEnabled
    //     public Integer totalRecords {get;set;}
    //     @AuraEnabled
    //     public Integer recordStart {get;set;}
    //     @AuraEnabled
    //     public Integer recordEnd {get;set;}
    //     @AuraEnabled
    //     public List<Account> accnList {get;set;}
    // }
    
    // public static ContactDataTableWrapper findByName(Integer pageNumber, Integer pageSize,String searchKey) {
    //     Integer offset = (pageNumber - 1) * pageSize;
         
    //     //Total Records
    //     Integer totalRecords = [SELECT COUNT() FROM Account];
    //     Integer recordEnd = pageSize * pageNumber;
    //     String name = '%' + searchKey + '%';
 
    //     //Instance of Contact DataTable Wrapper Class
    //     ContactDataTableWrapper objDT1 =  new ContactDataTableWrapper();  
    //     objDT1.pageSize = pageSize;
    //     objDT1.pageNumber = 1;
    //     objDT1.recordStart = offset + 1;
    //     objDT1.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
    //     objDT1.totalRecords = totalRecords;  
    //     objDT1.accnList = [SELECT (SELECT Name,FirstName,LastName FROM contacts),Id, Name FROM Account WHERE Name LIKE :name ];
    //     return objDT1;
        
    //        if(var.isEmpty()){
    //            return getshowAccAndCon();
    //        }else{
    //             return var.findByName();
    //        }
    // }    
}
