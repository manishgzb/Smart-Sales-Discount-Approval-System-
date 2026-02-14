public with sharing class DiscountController{
    public class DiscountWrapper {
        @AuraEnabled public Id Id;
        @AuraEnabled public String Name;
        @AuraEnabled public Decimal DiscountPercentage;
        @AuraEnabled public String Status;
        @AuraEnabled public String OpportunityName;
        @AuraEnabled public String recordURL;
        @AuraEnabled public String OpportunityURL;
    }
    @AuraEnabled
    public static void createDiscountRequest(String DiscountName, String DiscountPercentage, String OpportunityId){
        Discount_Request__c discountRequest = new Discount_Request__c();
        discountRequest.Name = DiscountName;
        discountRequest.Discount_Percentage__c = Integer.valueOf(DiscountPercentage);
        discountRequest.Opportunity__c = OpportunityId;
        try{
        insert discountRequest;
        }catch(DMLException e){
            throw new AuraHandledException(e.getDMLMessage(0));
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<DiscountWrapper> getDiscountRequests() {

        List<DiscountWrapper> result = new List<DiscountWrapper>();

        for (Discount_Request__c dr : [
            SELECT Id, Name, Discount_Percentage__c, Status__c, Opportunity__r.Name
            FROM Discount_Request__c
        ]) {
            DiscountWrapper dw = new DiscountWrapper();
            dw.Id = dr.Id;
            dw.Name = dr.Name;
            dw.DiscountPercentage = dr.Discount_Percentage__c;
            dw.Status = dr.Status__c;
            dw.OpportunityName = dr.Opportunity__r != null 
                ? dr.Opportunity__r.Name 
                : '';
            dw.recordURL = '/'+dr.Id;
            dw.OpportunityURL = '/'+dr.Opportunity__c;

            result.add(dw);
        }

        return result;
    }
    @AuraEnabled(cacheable=true)
    public static Integer getPendingDiscountRequestCount(){
        return [
            SELECT COUNT() FROM Discount_Request__c WHERE Status__c = 'Draft' OR Status__c = 'Submit'
        ];
    }
}