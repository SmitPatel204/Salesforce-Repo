({
    // getaccList: function(component, pageNumber, pageSize) {
    // var action = component.get('c.getshowAccAndCon');
    //     // for account count on page 
    //     action.setParams({
    //         "pageNumber": pageNumber,
    //         "pageSize": pageSize
    //     });

    //     action.setCallback(this,function(response){
            
    //         var state = response.getState();
    //         console.log('State : '+state);

    //         // display account list with pagination 
    //         if (component.isValid() && state === "SUCCESS"){
    //             var resultData = response.getReturnValue();
    //             component.set("v.accnList", resultData.accnList);
    //             component.set("v.PageNumber", resultData.pageNumber);
    //             component.set("v.TotalRecords", resultData.totalRecords);
    //             component.set("v.RecordStart", resultData.recordStart);
    //             component.set("v.RecordEnd", resultData.recordEnd);
    //             component.set("v.TotalPages", Math.ceil(resultData.totalRecords / pageSize));
    //         }
    //     });
    //     $A.enqueueAction(action);
    // }    
})
