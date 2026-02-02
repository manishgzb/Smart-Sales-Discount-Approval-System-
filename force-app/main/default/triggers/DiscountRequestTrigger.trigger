trigger DiscountRequestTrigger on Discount_Request__c (before insert, before update, after insert, after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        DiscountRequestValidator.validate(Trigger.new);
    }
}