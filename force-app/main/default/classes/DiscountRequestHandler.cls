public with sharing class DiscountRequestHandler {
    public static void setApprovalField(List<Discount_Request__c> discountRequests){
        Map<Id,ProcessInstance> processInstancesMap = new Map<Id,ProcessInstance>();
        for(ProcessInstance pi : [SELECT Id,TargetObjectId,Status,LastActorId FROM ProcessInstance WHERE TargetObjectId IN : discountRequests ORDER BY CreatedDate DESC]){
            if(!processInstancesMap.containsKey(pi.TargetObjectId)){
                processInstancesMap.put(pi.TargetObjectId,pi);
            }
        }
        for(Discount_Request__c dr: discountRequests){
            ProcessInstance pi = processInstancesMap.get(dr.Id);
            if(pi == null){
                continue;
            }
           if(dr.Status__c == 'Approved'){
            dr.Approved_by__c = pi.LastActorId;
           }
           if(dr.Status__c == 'Rejected'){
               dr.Rejected_by__c = pi.LastActorId;
           }
        }
    }

}