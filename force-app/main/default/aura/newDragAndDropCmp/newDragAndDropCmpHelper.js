({
    UpdateRecode1 : function(component, event,helper,conId1,conAccountName) {
        component.set('v.spinner',true);
        var action = component.get("c.updateACcountName");
        action.setParams({
            conId: conId1,
            AccName:conAccountName
        });
        action.setCallback(this, function(a) {
            component.set("v.contact2", a.getReturnValue());
            component.set('v.spinner',false);
            console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action); 
    },
    UpdateRecode2 : function(component, event,helper,conId1,conAccountName) {
        component.set('v.spinner',true);
        var action = component.get("c.updateACcountName");
        action.setParams({
            conId: conId1,
            AccName:conAccountName
        });
        action.setCallback(this, function(a) {
            component.set("v.contact1", a.getReturnValue());
            component.set('v.spinner',false);
            console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action); 
    }})
