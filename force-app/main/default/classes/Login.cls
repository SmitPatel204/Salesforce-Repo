public with sharing class Login {
    
    public Contact con{get;set;}
    public Id accountid{get;set;}
    public String cEmail{get;set;}
    // public list<contact> conlist{get;set;}
    // public list<Opportunity> opplist{get;set;}
    // public String email{get;set;}
    // public String password{get;set;}
    // public list<Account> acc{get;set;}

    public Login(){
        con = new Contact();
        // con = [SELECT Id,Email,Password__c FROM Contact];
    }

    public pageReference login(){
        // if((con.Email == null) || (con.Password__c == null)){
        //     return null;
        // }
        cEmail = con.Email;    
        List<Contact> cons = [SELECT Id,AccountId, Email, Password__c FROM Contact WHERE Email =: cEmail];
        system.debug('user email : '+cons);

        for(Contact loginCon:cons){
            if((loginCon.Email == con.Email) && (loginCon.Password__c == con.Password__c)){
                accountid = loginCon.AccountId;
                system.debug('accId of selected contact'+accountid);
                // showContact(); 
                pageReference page = new pageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Dashboard?Id='+accountid);
                // page.getParameters().put('AccountId',accountid);
                // page.getParameters().put('Email',loginCon.Email);
                // page.setRedirect(true);
                // accountid = loginCon.AccountId;
                // system.debug('accId of selected contact'+accountid);
                return page;
            }
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Email and Password are not valid'));
        return null;
    }

    // public void showContact(){
    //     conlist=[SELECT Id,Name,Email FROM Contact WHERE AccountId =: accountid];
    //     system.debug('con list'+conlist);
    //     opplist=[SELECT Id,Name,stageName FROM Opportunity WHERE AccountId =: accountid];
    //     system.debug('oppo list'+opplist);
    //     // return null;
    // }
}
// if((loginCon.Email == email) && (loginCon.Password__c == password)){
            //     showContact();
            //     pageReference page = new pageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Dashboard');
            //     page.getParameters().put('Email',loginCon.Email);
            //     // page.setRedirect(true);
            //     // accountid = loginCon2.AccountId;
            //     return page;
            // }
 // public Id getAccountId(){
    //     Id accountid = null;

    //     List<Contact> cons = [SELECT Id,AccountId, Email, Password__c FROM Contact];
    //     for(Contact loginCon:cons){
    //         if((loginCon.Email == con.Email) && (loginCon.Password__c == con.Password__c)){
    //             accountid = loginCon.AccountId;
    //             system.debug('accId of selected contact'+accountid);
    //         }
    //     }
    //     return accountid;
    // }


// Select id,lastname from contact where accountid :





// public String userName {get; set;}
//     public List<Contact> con {get; set;}
//     public Boolean getInput {get;set;}
//     public Login() {
//         getInput = True;
//         con = new List<Contact>();
//     }
//     public void searchUserName() {
//         getInput = False;
//         con = [SELECT Id, Email, Password__c FROM Contact WHERE Email =: userName];
//     }