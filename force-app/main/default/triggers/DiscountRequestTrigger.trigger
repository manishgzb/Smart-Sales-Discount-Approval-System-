trigger DiscountRequestTrigger on Discount_Request__c (before insert, before update, after insert, after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        DiscountRequestValidator.validate(Trigger.new);
    }
    //Run this code when Discount Request is approved
    if(Trigger.isBefore && Trigger.isUpdate){
        List<Discount_Request__c> changedDiscountRequests = new List<Discount_Request__c>();
        for(Discount_Request__c dr: Trigger.new){
            Discount_Request__c oldDr = Trigger.oldMap.get(dr.Id);
            if((dr.Status__c == 'Approved' && oldDr.Status__c != 'Approved') || (dr.Status__c == 'Rejected' && oldDr.Status__c != 'Rejected')){
                changedDiscountRequests.add(dr);
            }
        }
        if(changedDiscountRequests.size() > 0){
            DiscountRequestHandler.setApprovalField(changedDiscountRequests);
        }
      

    }
}