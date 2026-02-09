public with sharing class DiscountController{
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
}