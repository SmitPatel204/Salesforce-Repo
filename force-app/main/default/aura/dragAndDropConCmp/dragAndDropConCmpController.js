({
    doInit: function(component, event, helper) {
        
    },
    searchKeyChange: function(component, event,helper) {
        console.log('test ');
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.getByName");
        console.log('action : '+action);
        action.setParams({
            "searchKey": searchKey,
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('State : '+state);
    
                if(component.isValid() && state === "SUCCESS"){
                    component.set("v.accounts", response.getReturnValue());
                    component.set("v.accId", response.getReturnValue());
                    console.log("v.accounts", JSON.stringify(response.getReturnValue()));    
                }    
        });
        $A.enqueueAction(action);
        // helper.getAccountList(component);
    },
    searchKeyChange1: function(component, event,helper) {
        console.log('test ');
        var searchKey1 = component.find("searchKey1").get("v.value");
        console.log('searchKey:::::'+searchKey1);
        var action = component.get("c.getByName1");
        console.log('action : '+action);
        action.setParams({
            "searchKey1": searchKey1
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('State : '+state);  
                if(component.isValid() && state === "SUCCESS"){
                    component.set("v.accounts1", response.getReturnValue());
                    console.log("v.accounts1", JSON.stringify(response.getReturnValue()));
                }
        });
        $A.enqueueAction(action);
        // helper.getAccountList(component);
    },
    dragStart: function(component, event, helper) {
        console.log(event.target.id);
        event.dataTransfer.setData('Text',event.target.id);
    }, 
    allowDrop: function(component, event, helper) {
        event.preventDefault();
    },
    onDropFirstBox: function(component, event, helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        var searchKey  = component.find("searchKey").get("v.value");
        console.log(searchKey);
        helper.updateDraggedCon1(component,helper,event.dataTransfer.getData('Text',event.target.id),searchKey);
        $A.enqueueAction(component.get('c.searchKeyChange'));
        // $A.enqueueAction(component.get('c.searchKeyChange1'));
    },
    onDropSecBox: function(component, event, helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        var searchKey = component.find("searchKey1").get("v.value");
        console.log(searchKey);
        helper.updateDraggedCon(component,helper,event.dataTransfer.getData('Text',event.target.id),searchKey);
        // $A.enqueueAction(component.get('c.searchKeyChange'));
        $A.enqueueAction(component.get('c.searchKeyChange1'));
    },
})
