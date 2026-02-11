public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id, Name, Amount, StageName, CloseDate FROM Opportunity WHERE OwnerId = :UserInfo.getUserId()];
    }
}