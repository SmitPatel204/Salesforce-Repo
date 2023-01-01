({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        var var1 = component.get("v.steps");
        console.log(var1);
        var count = parseInt(var1);
        console.log(count);
        count = count + 1;
        console.log(count);
        component.set("v.steps",''+count);
        
        if(showAccount == true){
            var accountName = component.find("Name").get("v.value");
            // var sA = component.get("v.showAccount");
            console.log('accountName:::'+accountName);
            if(accountName =='' || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showContact",false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", true);
                component.set("v.showEvent", false); 
                component.set("v.showError", false);
                component.set("v.showData", false);
                
            }
            // component.set("v.steps",showAccount);
        }    
        if(showContact == true){
            var lastName = component.find("LastName").get("v.value");
            // var sC = component.get("v.showContact");
            console.log('lastName:::'+lastName);
            if(lastName =='' || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showEvent", true);
                component.set("v.showError", false);
                component.set("v.showData", false);
                 
            }
            // component.set("v.steps",showContact); 
        }   
        
        if(showEvent == true){
            // var OwnerId = component.find("OwnerId").get("v.value");
            // console.log('Assigned To :::'+OwnerId);
            var Subject = component.find("Subject").get("v.value");
            console.log('Subject :::'+Subject);
            var StartDateTime = component.find("StartDateTime").get("v.value");
            console.log('StartDateTime :::'+StartDateTime);
            var EndDateTime = component.find("EndDateTime").get("v.value");
            console.log('EndDateTime :::'+EndDateTime);
            if((Subject =='' || Subject == null) || (StartDateTime =='' || StartDateTime == null) || (EndDateTime =='' || EndDateTime == null)){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showEvent", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false)
                component.set("v.showError", false);
                component.set("v.showData", true);
            }
        }   
        
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        var var2 = component.get("v.steps");
        console.log(var2);
        var count = parseInt(var2);
        console.log(count);
        count = count - 1;
        console.log(count);
        component.set("v.steps",''+count);
        // alert(steps);
        
        if(showContact == true){
            component.set("v.showAccount", true);
            component.set("v.showContact", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
        }    
        if(showEvent == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", true);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
        } 
        if(showData == true){
            component.set("v.showAccount", false);
            component.set("v.showContact", false);
            component.set("v.showEvent", true);
            component.set("v.showError", false);
            component.set("v.showData", false);
        }  
    },
    
    onSelectChange : function(component, event, helper) {
        var selected = component.find("Subject").get("v.value");
        component.set("v.eventData.Subject",selected);
        console.log('subject ::::'+JSON.stringify(selected));
    },
    
    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    },

    // progress : function(component, event, helper) {
    //     var var1 = component.get("v.steps");
    //     var count = parseInt(var1);
    //     count = count + 1;
    //     component.set("v.steps",''+count);
    //     alert(steps);
    // },
    // progress1 : function(component, event, helper) {
    //     var var2 = component.get("v.steps");
    //     var count = parseInt(var2);
    //     count = count - 1;
    //     component.set("v.steps",''+count);
    //     alert(steps);
    // }
})