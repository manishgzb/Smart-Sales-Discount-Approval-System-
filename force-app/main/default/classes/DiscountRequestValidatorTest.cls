@IsTest
public with sharing class DiscountRequestValidatorTest {
    @TestSetup
    static void setup(){
        // Opportunity with amount less then 100000
        Opportunity opportunity1 = new Opportunity();
        opportunity1.Name = 'Test Opportunity 1';
        opportunity1.StageName = 'Prospecting';
        opportunity1.CloseDate = Date.today();
        opportunity1.Amount = 50000;
        insert opportunity1;
        // Opportunity with amount greater then 100000
        Opportunity opportunity2 = new Opportunity();
        opportunity2.Name = 'Test Opportunity 2';
        opportunity2.StageName = 'Prospecting';
        opportunity2.CloseDate = Date.today();
        opportunity2.Amount = 200000;
        insert opportunity2;
    }
    @IsTest
    static void testValidDiscountRequest(){
        // case 1: When discount percentage is less than 40% and opportunty amount < 100000
// Query opportunity with amount less then 100000
        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name = 'Test Opportunity 1' LIMIT 1 ];
        Discount_Request__c discountRequest = new Discount_Request__c();
        discountRequest.Opportunity__c = opportunity.Id;
        discountRequest.Discount_Percentage__c = 30;
        Test.startTest();
        DMLException error = null;
        try {
            insert discountRequest;
        } catch (DMLException e) {
            error=e;
        }
        Test.stopTest();
        System.Assert.areEqual(null,error);
    }
    @IsTest
    static void testInvalidDiscountRequest1(){
        // case 2: When discount percentage is greater than 40% and opportunty amount < 100000
        // Query opportunity with amount less then 100000
        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name = 'Test Opportunity 1' LIMIT 1 ];
        Discount_Request__c discountRequest = new Discount_Request__c();
        discountRequest.Opportunity__c = opportunity.Id;
        discountRequest.Discount_Percentage__c = 45;
        Test.startTest();
        DMLException error = null;
        try {
            insert discountRequest;
        } catch (DMLException e) {
            error=e;
        }
        Test.stopTest();
        System.Assert.areEqual('Discount Percentage cannot be greater than 40%',error.getDMLMessage(0));
    }
    @IsTest
    static void testInvalidDiscountRequest2(){
        //case 3: When discount percentage is greater than 20% and opportunty amount > 100000
        // Query opportunity with amount greater then 100000
        Opportunity opportunity = [SELECT Id FROM Opportunity WHERE Name = 'Test Opportunity 2' LIMIT 1 ];
        Discount_Request__c discountRequest = new Discount_Request__c();
        discountRequest.Opportunity__c = opportunity.Id;
        discountRequest.Discount_Percentage__c = 25;
        Test.startTest();
        DMLException error = null;
        try {
            insert discountRequest;
        }catch(DMLException e){
            error=e;
        }
        Test.stopTest();
        System.Assert.areEqual('Discount Percentage cannot be greater than 20% for opportunities with amount greater than 100000',error.getDMLMessage(0));
    }
}