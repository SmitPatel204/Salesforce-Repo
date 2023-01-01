import { LightningElement,track,wire } from 'lwc';
import { createMessageContext, releaseMessageContext, APPLICATION_SCOPE, subscribe,MessageContext, unsubscribe } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c';
import getContacts from '@salesforce/apex/contactTask3Lwc.getContacts';
import getOpportunity from '@salesforce/apex/contactTask3Lwc.getOpportunity';

export default class SubAccConOpp_Lwc extends LightningElement {
    // objectApiName = 'Account';
    // @track data;
    // @track contacts;
    subscription = null;
    recordId = null;
    // recordNotNull = false;

    @wire(getContacts, {accId : '$recordId'})
    contacts;

    @wire(getOpportunity, {accId : '$recordId'})
    oppos;

    @wire(MessageContext)
    messageContext;

    // contactColumns = [
    //     // { label: 'Contact Id', fieldName: 'employeeId' },
    //     { label: 'First Name', fieldName: 'FirstName' },
    //     { label: 'Last Name', fieldName: 'LastName' },
    // ];

    // @wire(getContacts) contactRec({error,data}){
    //     if(data){
    //         this.data = data;
    //         console.log('data : '+this.data);
    //     }else if(error){
    //         this.data = undefined;
    //     }
    // }

    connectedCallback(){
        this.subscribeMC();
    }

    subscribeMC(){
        if(this.subscription !== null){
            return this.subscription;
        }
        this.subscription = subscribe(this.messageContext, SAMPLEMC, (message) => {
            console.log('subscribed message : '+ JSON.stringify(message));
            this.recordId = message.recordId,
            {scope: APPLICATION_SCOPE}
        });
    }
}