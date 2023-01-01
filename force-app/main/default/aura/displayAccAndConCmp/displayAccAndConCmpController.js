({
    doInit : function(component, event, helper) {  
        // var pageNumber = component.get("v.PageNumber");  
        // var pageSize = component.find("pageSize").get("v.value");   
        // helper.getaccList(component, pageNumber, pageSize);
        
        // var pageSize = component.get('v.pageSize');
        // console.log(pageSize);
        var action = component.get('c.getshowAccAndCon');

        action.setCallback(this,function(response){
            
            var state = response.getState();
            console.log('State : '+state);

            // only display acclist with related con (OLD)
            if(component.isValid() && state === "SUCCESS"){
                component.set("v.accnList",response.getReturnValue());
                console.log("v.accnList", JSON.stringify(response.getReturnValue()));

                // component.set('v.accnList', response.getReturnValue());
                
                var pageSize = component.get("v.pageSize");
                var paginationList = [];
                for(var i=0; i< pageSize; i++)
                {
                    paginationList.push(response.getReturnValue()[i]);
                }
                component.set('v.paginationList', paginationList);
                component.set('v.totalSize', component.get('v.accnList').length);
                component.set('v.start',0);
                component.set('v.end',pageSize-1);
                
            }

        });
        $A.enqueueAction(action);
    },
    
    searchKeyChange: function(component, event, helper) {
        // var pageNumber = component.get("v.PageNumber");  
        // var pageSize = component.find("pageSize").get("v.value");
        // console.log('pageSize : '+pageSize);
        // var searchKey = component.find("searchKey").get("v.value");
        var start = component.get('v.start');
        console.log(start);
        var end = component.get('v.end');
        console.log(end); 
        var pageSize = component.get('v.pageSize');
        console.log(pageSize);
        var searchKey = component.find("searchKey").get("v.value");

        //Spinner

        // var isEnterKey = component.keyCode === 13;
        // var queryTerm = component.find('searchKey').get('v.value');
        // if (isEnterKey) {
        //     cmp.set('v.issearching', true);
        //     setTimeout(function() {
        //         alert('Searched for "' + queryTerm + '"!');
        //         cmp.set('v.issearching', false);
        //     }, 2000);
        // }
        console.log('searchKey:::::'+searchKey);
        
        // var keysize = component.get("v.totalSize");
        
            var action = component.get("c.getByName");
            console.log('action : '+action);
            
            action.setParams({
                "searchKey": searchKey
            });
        
            action.setCallback(this, function(response) {
                
                var state = response.getState();
                console.log('State : '+state);
    
                if(component.isValid() && state === "SUCCESS"){
                    component.set("v.accnList",response.getReturnValue());
                    console.log("v.accnList", JSON.stringify(response.getReturnValue()));

                    var pageSize = component.get("v.pageSize");
                    console.log('pageSize : '+pageSize);
                    // var pageSize = component.find("pageSize").get("v.value");
                    // console.log('pageSize : '+pageSize);
                    var paginationList = [];
                    for(var i=0; i< pageSize; i++)
                    {
                        if(response.getReturnValue()[i] != null){
                            paginationList.push(response.getReturnValue()[i]);
                        }    
                    }
                    component.set('v.paginationList', paginationList);
                    // component.set('v.paginationList', response.getReturnValue());
                    console.log('v.paginationList',JSON.stringify(response.getReturnValue()));
                    
                    component.set('v.totalSize', component.get('v.accnList').length);
                    component.set('v.start',0);
                    component.set('v.end',pageSize-1);    
                }   
            });   
        $A.enqueueAction(action);
    },
    next : function(component, event, helper){
        var aList = component.get('v.accnList');
        var start = component.get('v.start');
        console.log(start);
        var end = component.get('v.end');
        console.log(end); 
        var pageSize = component.get('v.pageSize');
        console.log(pageSize);
        var paginationList = [];
        var counter = 0;
        
        for(var i=end+1; i<end+pageSize+1; i++){
            if(aList.length > i)     //end
            {
                paginationList.push(aList[i]);
                console.log(paginationList);
                // counter++ ;
            }
            counter++ ;
        }
        console.log(counter);
        start = start + counter;
        end = end + counter;
        component.set('v.start',start);
        component.set('v.end',end);
        component.set('v.paginationList', paginationList);
    },
    previous : function(component, event, helper){
        var aList = component.get('v.accnList');
        var end = component.get('v.end');
        var start = component.get('v.start');
        var pageSize = component.get('v.pageSize');
        var paginationList = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                paginationList.push(aList[i]);
                console.log(paginationList);
                counter++;
            }
            else {
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        component.set('v.start',start);
        component.set('v.end',end);
        component.set('v.paginationList', paginationList);
    },








    // onSelectChange : function(component, event, helper) {
    //     var selected = component.find('records').get('v.value'); 
    //     console.log(selected);   
    //     var paginationList = [];     
    //     var aList = component.get('v.accnList');        
    //     for(var i=0; i< selected; i++)
    //     {
    //         paginationList.push(aList[i]);
    //     }
    //     component.set('v.paginationList', paginationList);
    //     console.log(paginationList);
    // },






    // first : function(component, event, helper){
    //     var aList = component.get('v.accnList');
    //     var pageSize = component.get('v.pageSize');
    //     console.log(pageSize)
    //     var paginationList = [];
    //     for(var i=0; i< pageSize; i++)
    //     {
    //         paginationList.push(aList[i]);
    //         console.log(paginationList);
    //     }
    //     component.set('v.paginationList', paginationList);
    // },
    // last : function(component, event, helper){
    //     var aList = component.get('v.accnList');
    //     console.log(aList);
    //     var pageSize = component.get('v.pageSize');
    //     console.log(pageSize);
    //     var totalSize = component.get('v.totalSize');
    //     console.log(totalSize);
    //     var paginationList = [];
    //     for(var i=totalSize-pageSize+1; i < totalSize; i++)
    //     {
    //         console.log(aList);
    //         paginationList.push(aList[i]);
    //         console.log(paginationList);
    //     }
    //     component.set('v.paginationList', paginationList);
    // },
    
    // handleNext: function(component, event, helper) {
    //     var pageNumber = component.get("v.PageNumber");  
    //     var pageSize = component.find("pageSize").get("v.value");
    //     pageNumber++;
    //     helper.getaccList(component, pageNumber, pageSize);
    // },
     
    // handlePrev: function(component, event, helper) {
    //     var pageNumber = component.get("v.PageNumber");  
    //     var pageSize = component.find("pageSize").get("v.value");
    //     pageNumber--;
    //     helper.getaccList(component, pageNumber, pageSize);
    // },
     
    // onSelectChange: function(component, event, helper) {
    //     var page = 1
    //     var pageSize = component.find("pageSize").get("v.value");
    //     helper.getaccList(component, page, pageSize);
    // },
})
