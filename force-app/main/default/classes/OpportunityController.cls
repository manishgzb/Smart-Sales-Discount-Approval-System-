public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id, Name, Amount, StageName, CloseDate FROM Opportunity WHERE OwnerId = :UserInfo.getUserId()];
    }
    @AuraEnabled(cacheable=true)
    public static Integer getOppCounts(){
        return [
            SELECT COUNT() FROM Opportunity WHERE OwnerId = :UserInfo.getUserId()];
    }
    @AuraEnabled(cacheable=true)
    public static Integer getWonOppCounts(){
        return [
            SELECT COUNT() FROM Opportunity WHERE OwnerId = :UserInfo.getUserId() AND IsWon = true];
    }
    @AuraEnabled(cacheable=true)
    public static Integer getLostOppCounts(){
        return[
            SELECT COUNT() FROM Opportunity WHERE OwnerId = :UserInfo.getUserId() AND IsClosed = false AND IsWon = false
        ];
    }
}