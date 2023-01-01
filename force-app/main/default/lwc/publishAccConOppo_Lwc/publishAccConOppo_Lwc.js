import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccConOppClassLWC.getAccounts';
import { createMessageContext, releaseMessageContext, publish, MessageContext } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c';
// import recordSelected from '@salesforce/messageChannel/Record_Selected__c';

export default class PublishAccConOppo_Lwc extends LightningElement {
    // context = createMessageContext();
    accountList = [];

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        console.log('Entry:');
        getAccounts()
            .then(result => {
                this.accountList = result;
                console.log('accountList:'+ JSON.stringify(this.accountList));    
            })
            .catch(error => {
                this.accountList = error;
            });   
    }

    handleChange(event){
        console.log('trigger handle event');
        // var x = document.getElementById("select-01").value;
        // document.getElementById("demo").innerHTML = "You selected: " + x;
        // console.log('value of x : '+x);
        // event.preventDefault();
        const message = {
            recordId : event.target.value,
            // recordDate : { value : "message from lwc"}
        };
        console.log('published message : '+JSON.stringify(message));
        // console.log('published message : '+typeof(message));
        publish(this.messageContext, SAMPLEMC, message);
    }

}