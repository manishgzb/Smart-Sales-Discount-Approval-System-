import { LightningElement } from 'lwc';
import createDiscountRequest from '@salesforce/apex/DiscountController.createDiscountRequest';
import Toast from 'lightning/toast'

export default class DiscountCreator extends LightningElement {
    discountName;
    discountPercentage;
    opportunityId;
    handleNameChange(e){
        this.discountName = e.target.value;
    }
    handlePercentChange(e){
        this.discountPercentage = e.target.value;

    }
    handleOppChange(e){
        this.opportunityId = e.detail.recordId;
    }
    handleBtnClick(){
        createDiscountRequest({
            DiscountName: this.discountName,
            DiscountPercentage: this.discountPercentage,
            OpportunityId: this.opportunityId
        })
        .then(result => {
            Toast.show({
                label: 'Success',
                title: 'Success',
                message: 'Discount Created Successfully',
                variant: 'success'
            },this);
            this.dispatchEvent(new CustomEvent('discountcreated',{
                detail: result
            }));
        })
        .catch(error => {
            Toast.show({
                label: 'Error',
                title: 'Error',
                message: error.body.message,
                variant: 'error'
            },this);
        });
    }
}