({
    updateDraggedCon : function(component,helper,event,contactId,AccName) {
        var action = component.get("c.updateCon");
        console.log('action : '+action);
        action.setParams({
            conId : contactId,    
            accName : AccName                                                               //(first contactsId is apex sec is parameter)
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
    },
    updateDraggedCon1 : function(component,helper,event,contactId,AccName1) {
        var action = component.get("c.updateCon");
        console.log('action : '+action);
        action.setParams({
            conId : contactId,    
            accName : AccName1                                                               //(first contactsId is apex sec is parameter)
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('State : '+state);
    
            if(component.isValid() && state === "SUCCESS"){
                component.set("v.accounts", response.getReturnValue());
                console.log("v.accounts", JSON.stringify(response.getReturnValue()));    
            }    
        });
        $A.enqueueAction(action);
    },
    // getAccountList: function(component) {
    //     var action = component.get('c.getAccounts');
    //     var self = this;
    //     action.setCallback(this, function(actionResult) {
    //         component.set('v.accounts', actionResult.getReturnValue());
    //     });
    //     $A.enqueueAction(action);
    // }
})
