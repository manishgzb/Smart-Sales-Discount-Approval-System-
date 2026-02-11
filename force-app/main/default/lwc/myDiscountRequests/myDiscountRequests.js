import { LightningElement,wire } from 'lwc';
import getDiscountRequests from '@salesforce/apex/DiscountController.getDiscountRequests';

const columns = [
    {
        label: 'Name',
        fieldName: 'recordURL',
        type: 'url',
        typeAttributes: {
            label: { fieldName: 'Name' },
            target: '_self'
        }
    },

    {
        label: 'Discount Percentage',
        fieldName: 'DiscountPercentage',
        type:'text'
    },
    {
        label: 'Opportunity',
        fieldName: 'OpportunityURL',
        type: 'url',
        typeAttributes: {
            label: { fieldName: 'OpportunityName' },
            target: '_self'
        }
    },
    {
        label:'Status',
        fieldName:'Status',
        type:'text'
    }
]

export default class MyDiscountRequests extends LightningElement {
    columns = columns;
    @wire(getDiscountRequests)discountRequests;

}