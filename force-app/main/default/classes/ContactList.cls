public class ContactList{

    // public List<Contact> getContact{get;set;}
    
    public Integer Blocksize = 10;
    public Integer Index = 0;
    public Integer Count;
    // string searchKey;    
    
    // public INTEGER count;
    // public string contactId {get;set;}

    // Constructor for count contact 

    public ContactList(){
        Count = [SELECT COUNT() FROM Contact];
        // searchKey == null;
        // string searchKey;    
        // return null;
        // ctlist();
    }

    // public void count(){
    //     Count = [SELECT COUNT() FROM Contact];
    // }

    // Constructor for search and display     

    // public list<Contact> con{get;set;} 
    // public string searchkey{get;set;}   

    // public void ctlist(){
    //     if(searchkey == null){
    //             con = [SELECT Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT : Blocksize OFFSET : Index];
    //         }
    //     else    
    //         {
    //             con = [SELECT Lastname,Phone FROM Contact WHERE name LIKE : '%'+searchKey+'%' LIMIT : Blocksize OFFSET : Index];
    //         }
    // }
    // || searchKey == ' ' || searchKey == ''

    // Show Contact 

    list<Contact> getContact = new List<Contact>();    
    public list<Contact> getconrecords(){
        getContact = [SELECT Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT : Blocksize OFFSET : Index];
        return getContact; 
    }

    // Search contact 

    public list<Contact> con{get;set;} 
    public string searchkey{get;set;}

    public pagereference search(){
        con = [SELECT Lastname,Phone FROM Contact WHERE name LIKE : '%'+searchKey+'%' LIMIT : Blocksize];
        return null;
    }    

    // Clear search, First Page , Prev Page , Next Page , Last Page 

    public void clear(){
        con.clear();    
    }

    public void FirstPage(){ 
        Index = 0;
    }

    public void NextPage(){
        Index = Index + Blocksize;
    }

    public void PreviousPage(){
        Index = Index - Blocksize;
    }

    public void LastPage(){
        Index =  Count - Blocksize;
    }

    public BOOLEAN getPrev(){
        if(Index == 0)
            return true;
        else
            return false;    
    }

    // public BOOLEAN getNext(){
    //     if(Index == Count - Blocksize)
    //         return false;
    //     else
    //         return true;    
    // }

    // Public pagereference NextPage(){
    //     Index = Index + Blocksize;
    //     return null;
    // }
    
    // Public pagereference PreviousPage(){
    //     if(Index > 0)
    //         Index = Index - Blocksize;
    //     return null;
    // }



    // Consreutor for get contact and total of contact 

    // public ContactList(){

    //     getContact = [SELECT Id, LastName, Email FROM Contact ORDER BY LastName LIMIT 10];
    //     // count = [SELECT COUNT() FROM Contact];
    //     // return null;
    // }



    // Total Contact 

    // private final Account acct;
    // public Integer sum {get; set;}

    //     public TotalContcat(ApexPages.StandardController stdController) {
    //     this.acct = (Account)stdController.getRecord();
    //     sum = [SELECT count() FROM Contact WHERE AccountId =:acct.Id];            
    // }



    // public PageReference gotoContactDetailPage()
	// {
	// 	return new PageReference('/apex/ContactDetailPage?id=' + contactId);
	// }


    // Merge pageblocktable 

    // list<Contact> results;
    // public list<Contact> getResults(){
    //     if(searchKey == null || searchKey == ' ' || searchKey == ''){
    //         con = [SELECT Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT 10];
    //     }
    //     return results;
    // }

    // public list<Contact> con{get;set;} 
    // public string searchkey{get;set;}
    
}

// public void search(){
    //     if(searchKey == null || searchKey == ' ' || searchKey == ''){
    //         con = [SELECT Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT : Blocksize OFFSET : Index];
    //     }
    //     else    
    //     {
    //         con = [SELECT Lastname,Phone FROM Contact WHERE name LIKE : '%'+searchKey+'%' LIMIT : Blocksize OFFSET : Index];
    //     }
    //         // return null;
    // }




// public class ContactList{

//     public List<Contact> getContact(){
//         List<Contact> getContact = [select ID, LastName from Contact];
//         return getContact;
//     }
// }


// public with sharing class ContactList {
//     // public ContactList() {

//     // }
//     public ApexPages.StandardSetController setCon {
//         get {
//             if(setCon == null) {
//                 setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
//                     [SELECT Firstname, Lastname, Email FROM Contact]));
//             }
//             return setCon;
//         }
//         set;
//     }

//     public List<Contact> getContacts() {
//         return (List<Contact>) setCon.getRecords();
//     }
// }
