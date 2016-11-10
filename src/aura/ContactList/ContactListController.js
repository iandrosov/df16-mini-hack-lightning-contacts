({
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    searchKeyChange: function(component, event) {
        var myEvent = $A.get("e.c:SearchKeyChange");
        //myEvent.setParams({"searchKey": event.target.value});
        var searchKey = event.target.value;
    	//var searchKey = event.getParams("searchKey");
    	var action = component.get("c.findByName");
    	action.setParams({
      		"searchKey": searchKey
    	});
    	action.setCallback(this, function(a) {
        	component.set("v.contacts", a.getReturnValue());
    	});
    	$A.enqueueAction(action);
    }

})