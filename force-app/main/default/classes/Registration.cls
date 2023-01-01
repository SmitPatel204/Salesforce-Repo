public with sharing class Registration {

    public Contact con {get;set;}
    // public Contact c {get;set;}
    // public String selectedAccId{get;set;}
    public Id selectedAccId{get;set;}
    // public String a {get;set;}
    // public list<Account> a{get;set;} 
    // public String selectedvalue {get;set;}
    // public String LastName{get;set;}
    // public String Email{get;set;}

    public Registration() {
        con = new Contact();
    }

    // For Select AccountName

    public List<SelectOption> getAccountName(){
        List<SelectOption> accList = new List<SelectOption>();
        
        accList.add(new SelectOption ('','Select Account'));

        for(Account acc : [SELECT Id,name FROM Account]){
            accList.add(new SelectOption(acc.Id,acc.name));
            // accList.add(new SelectOption(acc.name));
        }
        return accList;
    }

    public void SubmitAction(){
        // con.AccountId=selectedAccId;
        // if(!Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}[.]{0,1}[a-zA-Z]{0,2}',con.Email))
        // {
        //     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Email is not valid'));
        // }
        // else
        // {
        con.AccountId=selectedAccId;
        insert con;
        // }
        // Contact con = new Contact(lastname=LastName,AccountId=acc.Id);
        // c = new Contact();  
        // c.AccountId=acc.Id;
        // a = [SELECT Id,name FROM Account];
        // if(selectedAccId == a){   
        // Contact newCon = new Contact(AccountId=Id);   
        // con.AccountId=.id; 
        // insert con;
        // }
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Record Submit succesfully'));
    }


    // useful for customfield

    // public List<SelectOption> getacc(){
    //     List<SelectOption> listacc = new List<SelectOption>();
        
    //     List<Schema.PicklistEntry> getacclist = Contact.AccountId.getDescribe().getPicklistValues();

    //     for(Schema.PicklistEntry accountvalue: getacclist){
    //         listacc.add(new SelectOption(accountvalue.getValue(),accountvalue.getLabel()));
    //     }
    //     return listacc;
    // }
}
