public with sharing class DiscountRequestValidator {
    public static void validate(List<Discount_Request__c> discountRequests){
        List<Id> opportunityIds = new List<Id>();
        for(Discount_Request__c discountRequest : discountRequests){
            opportunityIds.add(discountRequest.Opportunity__c);
        }
        Map<Id,Opportunity> opportunities = new Map<Id,Opportunity>([SELECT Id, Amount FROM Opportunity WHERE Id IN :opportunityIds]);
        for(Discount_Request__c discountRequest : discountRequests){
            if(discountRequest.Discount_Percentage__c > 40){
                discountRequest.addError('Discount Percentage cannot be greater than 40%');
            }
            if(opportunities.get(discountRequest.Opportunity__c).Amount > 100000 && discountRequest.Discount_Percentage__c> 20){
                discountRequest.addError('Discount Percentage cannot be greater than 20% for opportunities with amount greater than 100000');
            }
        }
    }
}