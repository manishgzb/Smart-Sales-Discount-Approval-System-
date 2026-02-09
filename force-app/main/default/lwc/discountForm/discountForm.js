import { LightningElement } from 'lwc';

export default class DiscountForm extends LightningElement {
    showForm = true;
    handleDiscountCreated(e){
        this.showForm = false;
    }
}