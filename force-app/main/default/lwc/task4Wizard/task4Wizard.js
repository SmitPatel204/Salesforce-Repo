import { LightningElement, track } from 'lwc';
import getRecords from '@salesforce/apex/LwcWizardTask4.getRecords';
import sendEmailController from '@salesforce/apex/LwcWizardTask4.sendEmailController';

export default class WizardTask4 extends LightningElement {

    @track value = '';
    @track options = [
        {label : 'Account' , value : 'Account'},
        {label : 'Contact' , value : 'Contact'},
        {label : 'Lead' , value : 'Lead'}
    ];
    @track isSection1 = true;
    @track isSection2 = false;
    @track isSection3 = false;
    @track data = [];
    @track isShow = false;
    @track isSend = false;
    @track isSet = true;

    @track columns = [];
    @track currentStep = '1';
    @track selectedRow = [];
    // @track ToCCAddress = '';
    @track Subject = '';
    @track Body = '';
    myVal = '';

    handleColumn()
    {
        if(this.value == 'Account')
        {
            this.columns = [
                {label : this.value+' Id' , fieldName : 'Id'},
                {label : this.value+' Name' , fieldName : 'Name'},
                {label : this.value+' Email' , fieldName : 'Email__c'}
            ];
        }
        else if(this.value == 'Contact' || this.value == 'Lead'){
            this.columns = [
                {label : this.value+' Id' , fieldName : 'Id'},
                {label : this.value+' Name' , fieldName : 'Name'},
                // {label : this.value+' First Name' , fieldName : 'FirstName'},
                // {label : this.value+' Last Name' , fieldName : 'LastName'},
                {label : this.value+' Email' , fieldName : 'Email'}
            ];
        }
    }

    handleChange(event){
        this.value = event.target.value;
        this.handleColumn();
        var rec = [];
        getRecords({objName : this.value})
        .then( result => {
            for(var i=0;i<result.length;i++)
            {
                if(this.value == 'Account')
                {
                    console.log('If = '+result[i].Email__c);
                    rec.push({Id : result[i].Id , Name : result[i].Name , Email : result[i].Email__c});
                }else if(this.value == 'Contact' || this.value == 'Lead'){
                    rec.push({Id : result[i].Id , Name : result[i].Name , Email : result[i].Email});
                }
            }
            this.data = rec;
            console.log('Records = '+ JSON.stringify(rec));
        });
        if(this.data!=null)
        {
            this.isShow = true;
        }
    }

    handleNext(){
        if(this.isSection1 == true){
            if(this.value!='' && this.selectedRow.length!=0)
            {
                this.isSection1 = false;
                this.isSection2 = true;
                this.isSection3 = false;
                this.isSet = true;
                this.isSend = false;
                this.currentStep = "2";
            }
        }else if(this.isSection2 == true){
            // console.log(this.ToCCAddress.length,this.Subject.length,this.Body.length);
            // if(this.ToCCAddress.split(' ').join('').length!=0 && this.Subject.split(' ').join('').length!=0 && this.Body.split(' ').join('').length!=0)
            if(this.Subject.split(' ').join('').length!=0 && this.Body.split(' ').join('').length!=0)
            {
                const value = this.template.querySelector('lightning-input-rich-text').value;
                this.myVal = value;
                this.isSection1 = false;
                this.isSection2 = false;
                this.isSection3 = true;
                this.isSet = true;
                this.isSend = false;
                this.currentStep = "3";
            }
        }
        // else if(this.isSection3 == true){
        //     this.isSet = false;
        //     this.isSend = true;
        //     var emailVal = [];
        //     var nameVal = [];
        //     for(var i=0;i<this.selectedRow.length;i++)
        //     {
        //         if(this.selectedRow[i].Email!=null)
        //         {
        //             emailVal.push(this.selectedRow[i].Email);
        //             nameVal.push(this.selectedRow[i].Name); 
        //         }
        //     }
        //     // sendEmailController({ emailDetailStr: emailVal , nameDetailStr: nameVal , ccAddress:  this.ToCCAddress , Subject: this.Subject , Body: this.Body});
        //     sendEmailController({ emailDetailStr: emailVal , nameDetailStr: nameVal , Subject: this.Subject , Body: this.Body});
        // }
    }

    handleFinish(){
        if(this.isSection3 == true){
            this.isSet = false;
            this.isSend = true;
            var emailVal = [];
            var nameVal = [];
            for(var i=0;i<this.selectedRow.length;i++)
            {
                if(this.selectedRow[i].Email!=null)
                {
                    emailVal.push(this.selectedRow[i].Email);
                    nameVal.push(this.selectedRow[i].Name); 
                }
            }
            // sendEmailController({ emailDetailStr: emailVal , nameDetailStr: nameVal , ccAddress:  this.ToCCAddress , Subject: this.Subject , Body: this.Body});
            sendEmailController({ emailDetailStr: emailVal , nameDetailStr: nameVal , Subject: this.Subject , Body: this.Body});
        }

    }

    handlePrevious(){
        if(this.isSection2 == true){
            this.isSection1 = true;
            this.isSection2 = false;
            this.isSection3 = false; 
        }else if(this.isSection3 == true){
            this.isSection1 = false;
            this.isSection2 = true;
            this.isSection3 = false;
        }
    }

    getSelectedRows(event){
        const selectedRows = event.detail.selectedRows;
        this.selectedRow = selectedRows;
    }

    // handleCcChange(event){
    //     this.ToCCAddress = event.target.value;
    // }

    handleSubChange(event){
        this.Subject = event.target.value;
    }

    handleBodyChange(event){
        this.Body = event.target.value;
    }

}