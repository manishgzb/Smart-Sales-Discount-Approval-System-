import { LightningElement,wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

const columns = [
    { label: 'Opportunity name', fieldName: 'Name', type: 'text' },
    {
     label:'Amount',
     fieldName:'Amount',
     type:'currency'
    },
    {
        label:'Stage Name',
        fieldName:'StageName',
        type:'text'
    },
    {
        label:'Close Date',
        fieldName:'CloseDate',
        type:'date',
    }
];
export default class MyOpportunities extends LightningElement {
    columns = columns;
    @wire(getOpportunities)
    opportunities;
}