import { LightningElement,wire } from 'lwc';
import getOppCounts from '@salesforce/apex/OpportunityController.getOppCounts';
import getWonOppCounts from '@salesforce/apex/OpportunityController.getWonOppCounts';
import getLostOppCounts from '@salesforce/apex/OpportunityController.getLostOppCounts';
import getPendingDiscountRequestCount from '@salesforce/apex/DiscountController.getPendingDiscountRequestCount';

export default class Dashboard extends LightningElement {
    @wire(getOppCounts)
    oppCounts;
    @wire(getWonOppCounts)
    wonOppCounts;
    @wire(getLostOppCounts)
    lostOppCounts;
    @wire(getPendingDiscountRequestCount)
    pendingDiscountRequestCounts;

}