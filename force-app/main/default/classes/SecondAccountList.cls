public class SecondAccountList{


    public list<Account> getAccount{get;set;}
    
    public SecondAccountList(){
        getAccount = [SELECT Id, Name, Phone, Type FROM Account LIMIT 15];
        getcontact=null;
    }
    
    public List<Contact> getcontact{get; set;}
    public string recid{get;set;} 

    public void ContactList() {
        getcontact=[SELECT Id, LastName, Email, Phone FROM Contact WHERE AccountId=:recId];
    }

    
}



// public with sharing class AccountList{

//     public List<Account> getAccounts{get;set;}
//     public List<Contact> getContacts{get;set;}

//     public AccountList() {
//         getAccounts = [select Id,Name,AccountNumber from Account where Id = : Id];
//         getContacts = null;
//     }


//     public void contactlist(){
//         getContacts = [select Id,FirstName from Contact where AccountId = : recId];
//     }

    
    
// }


// public class AccountList {

//     public string recid{get;set;}    
//     public list<Account> Acclst{get;set;}
//     public List<Contact> contacts {get; set;}
    
//     public AccountList(){
//         Acclst = [SELECT Id, Name, Phone FROM Account LIMIT 20 ];
//         contacts=null;
//     }
    
//     public void contactlist() {
//         contacts=[SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId=:recId];
//     }
// }


