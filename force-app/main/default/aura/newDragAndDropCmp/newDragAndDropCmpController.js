({
    doInit : function(component, event, helper) {

    },

    searchKeyChange1: function(component, event) {
        var searchKey = component.find("searchKey1").get("v.value");
        console.log('serchKey :::::::::'+ searchKey);
       if (searchKey == '') {
        console.log('string Null');
       } else {
        component.set("v.nameSet",searchKey);
            var action = component.get("c.getContact1");
            var action1 = component.get("c.countCon1");
            var action2 = component.get("c.AccountName1");


            action.setParams({	
                AccName1 : searchKey
            });
            action1.setParams({
                AccName : searchKey
            });
            action2.setParams({
                AccName : searchKey
            });
            action.setCallback(this, function(a) {
                component.set("v.contact1", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });
            action1.setCallback(this, function(a) {
                component.set("v.con1Name", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });
            action2.setCallback(this, function(a) {
                component.set("v.AccountName11", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });
            $A.enqueueAction(action); 
            $A.enqueueAction(action1); 
            $A.enqueueAction(action2);  
 
 
            
            
       }     
    },

    searchKeyChange2: function(component, event,helper) {
        var searchKey = component.find("searchKey2").get("v.value");
        console.log('serchKey :::::::::'+ searchKey);
        if (searchKey == '') {
            console.log('string Null');
        } else{
            var action = component.get("c.getContact2");
            var action1 = component.get("c.countCon2");
            var action2 = component.get("c.AccountName2");


            action.setParams({
                AccName2: searchKey
            });
            action1.setParams({
                AccName: searchKey
            });
            action2.setParams({
                AccName: searchKey
            });
            action.setCallback(this, function(a) {
                component.set("v.contact2", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });
            action1.setCallback(this, function(a) {
                component.set("v.con2Name", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });
            action2.setCallback(this, function(a) {
                component.set("v.AccountName12", a.getReturnValue());
                console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
            });

            $A.enqueueAction(action);
            $A.enqueueAction(action1);
            $A.enqueueAction(action2);


            
            }    
    },
    dragstart: function(component, event,helper) {
        event.dataTransfer.setData('Text',event.target.id);
    },
    dragover: function(component, event,helper) {
        event.preventDefault();
    }, 
    dropcon1: function(component, event,helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        var searchKey = component.find("searchKey1").get("v.value");
        helper.UpdateRecode2(component, event,helper,event.dataTransfer.getData('Text',event.target.id),searchKey);
        $A.enqueueAction(component.get('c.searchKeyChange1'));
        $A.enqueueAction(component.get('c.searchKeyChange2'));
    },
    dropcon2: function(component, event,helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        var searchKey = component.find("searchKey2").get("v.value");
        helper.UpdateRecode1(component, event,helper,event.dataTransfer.getData('Text',event.target.id),searchKey);
        $A.enqueueAction(component.get('c.searchKeyChange2'));
        $A.enqueueAction(component.get('c.searchKeyChange1'));

    }
})
