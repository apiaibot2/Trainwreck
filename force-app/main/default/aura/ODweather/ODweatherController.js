({
    myaction : function(component, event, helper)    {
        console.log("in comp1 js");
        var pickval=component.find("statuspicklist").get("v.value");
        console.log("pickval="+pickval);
         var action=component.get("c.call");
        action.setParams({"picval":pickval});
        action.setCallback(this,function(b){ 
            var state = b.getState();
            console.log(state);
            if(state === 'SUCCESS')
            {
                console.log(b.getReturnValue())
                var Toast=$A.get("e.force:showToast");
                Toast.setParams({"title":"SUCCESS","type":'Success',"message":"Weather data displayed"});
                Toast.fire();
                component.set("v.getdetails",b.getReturnValue());
            }
        });
        $A.enqueueAction(action);  
    }
}) 