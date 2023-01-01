public with sharing class Dashboard {

    // public String accoid{get;set;}
    // public Id page{get;set;}
    public list<contact> conlist{get;set;}
    public list<Opportunity> opplist{get;set;}
    public Account account{get;set;}
    public Integer countCon;
    public Integer Blocksize = 10;
    public Integer Index = 0;
    public Integer Blocksize1 = 10;
    public Integer Index1 = 0;
    // public Id AcId;

    public Dashboard(){
        Id id = ApexPages.currentpage().getParameters().get('Id');
        system.debug('AccountId : '+id);
        account = [SELECT Id,Name FROM Account WHERE Id =: id];
        system.debug('AccountName : '+account);

        // conlist=[SELECT AccountId,Name,Email FROM contact WHERE AccountId =: id];
        // system.debug('Con List : '+conlist);

        countCon = [SELECT COUNT() FROM contact WHERE AccountId =:id];
        system.debug('Count of conlist : '+countCon);

        showlist();
        // opplist=[SELECT AccountId,Name,stageName FROM opportunity WHERE AccountId =: id];
        // system.debug('oppo list : '+opplist);
    }

    public void showlist(){

        conlist=[SELECT AccountId,Name,Email FROM contact WHERE AccountId =: account.id LIMIT : Blocksize OFFSET : Index];
        system.debug('Con List : '+conlist);

        opplist=[SELECT AccountId,Name,stageName FROM opportunity WHERE AccountId =: account.id LIMIT : Blocksize1 OFFSET : Index1];
        system.debug('oppo list : '+opplist);
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
        Index =  countCon - Blocksize;
    }

    public BOOLEAN getPrev(){
        if(Index == 0)
            return true;
        else
            return false;    
    }

    // for oppo 
    public void FirstPage1(){ 
        Index1 = 0;
    }

    public void NextPage1(){
        Index1 = Index1 + Blocksize1;
    }

    public void PreviousPage1(){
        Index1 = Index1 - Blocksize1;
    }

    public void LastPage1(){
        Index1 =  countCon - Blocksize1;
    }

    public BOOLEAN getPrev1(){
        if(Index1 == 0)
            return true;
        else
            return false;    
    }

    // public List<SelectOption> getAccountNames()
    // {
    //     List<SelectOption> accOptions= new List<SelectOption>();
    //     accOptions.add( new SelectOption('','--Select Account--'));
    //     for( Account acc : [SELECT Id,name FROM Account] )
    //     {
    //         accOptions.add( new SelectOption(acc.Id,acc.name));
    //     }
    //     return accOptions;
    // }
    // public pageReference showContact()

    // public void showContact()
    // {
    //     // accoid = page;
    //     // system.debug('accountId :'+accoid);

    //     // conlist=[SELECT Name,Email FROM contact WHERE accountid =:AccId];
    //     conlist=[SELECT AccountId,Name,Email FROM contact WHERE AccountId =: accoid];
    //     // system.debug('con list'+conlist);
    //     opplist=[SELECT AccountId,Name,stageName FROM opportunity WHERE AccountId =: accoid];
    //     // system.debug('oppo list'+opplist);
    //     // return null;
    // }
}

