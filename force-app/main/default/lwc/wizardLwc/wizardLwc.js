import { LightningElement,track } from 'lwc';
import getAccount from "@salesforce/apex/taskFourWizardLwc.getAccount";
import getContact from "@salesforce/apex/taskFourWizardLwc.getContact";
import getLead from "@salesforce/apex/taskFourWizardLwc.getLead";
import sendEmailToController from "@salesforce/apex/taskFourWizardLwc.sendEmailToController";
import Name from '@salesforce/schema/Account.Name';

 
export default class WizardLwc extends LightningElement {
 
    @track currentStep = '1';
    @track value = '';
    @track value1 = '';

    @track selectValue = [];
    // @track selectValue1 = [];
    columns = []; 
    recordsToDisplay1
    @track subject = '';
    @track body = '';
    @track body1 = '';
    myVal = '';
    @track Email1 = [];
    @track Name1 = [];


    //this.body= body.replaceAll('<p><br></p>','');

    handleclick(){
        var el = this.template.querySelector('lightning-datatable').getSelectedRows();
        console.log(JSON.stringify(el));
        this.value1 = el;
        // console.log(JSON.stringify(value1));
        const select = this.value;
        console.log('selected object :'+select);
       
        if(select === 'Account'){
        for (let index = 0; index < JSON.stringify(this.value1.length); index++) {
            // this.selectValue.push(JSON.stringify(this.value1[index].Account_Email__c));
            // this.selectValue.push({key:index,email:this.value1[index].Email__c,name:this.value1[index].Name});
            // this.selectValue.push({email:this.value1[index].Email__c,name:this.value1[index].Name});
            this.selectValue.push(JSON.stringify(this.value1[index].Email__c));
            // this.selectValue.push(JSON.stringify(this.value1[index].Name));
        }
        // console.log('Name :'+this.selectValue1);
        // console.log('recode1 :' + JSON.stringify(this.selectValue)); 
        // console.log(this.selectValue.length);
        // console.log(JSON.stringify(this.selectValue[0]));
        // console.log(this.selectValue[0].name);
        // for (let i = 0; i < this.selectValue.length; i++) {
        //     console.log('selval:'+this.selectvalue[i].name);
        //     // this.Name1[i] = this.selectvalue[i].name;
        //     this.Name1.push(this.selectValue[i].name);
        // }
        // console.log('Name :' + JSON.stringify(this.Name1));   
        for (let i = 0; i < this.selectValue.length; i++) {
            this.selectValue[i] = this.selectValue[i].replace(/"/g, "");
            // this.Email1[i] = this.selectValue[i].email.replace(/"/g, "");
        }
        // console.log('recode2 :' + this.selectValue);   
        console.log('Email :' + JSON.stringify(this.selectValue)); 
        }else{
            for (let index = 0; index <JSON.stringify(this.value1.length); index++) {
                // this.selectValue.push({email:this.value1[index].Email,name:this.value1[index].Name});
                this.selectValue.push(JSON.stringify(this.value1[index].Email));   
                // this.selectValue.push(JSON.stringify(this.value1[index].Name));  
            }
            console.log('recode :::' + JSON.stringify(this.selectValue)); 
            // for (let i = 0; i < this.selectValue.length; i++) {
            //     console.log('selval:'+this.selectValue[i].Name1);
            //     this.Name1[i] = this.selectValue[i].Name1;
            // }
            // console.log('Name 1 :' + this.Name1);
            // console.log('Name :'+this.selectValue1);
            for (let i = 0; i < this.selectValue.length; i++) {
                this.selectValue[i] = this.selectValue[i].replace(/"/g, "");
            }
            // console.log('recode:::::::' + this.selectValue);
            console.log('recode :' + JSON.stringify(this.selectValue)); 

            console.log(JSON.stringify(typeof this.selectValue[0])); 
        }
    }

    handleSubjectChange(event) {
        this.subject = event.target.value;
    }

    handleBodyChange(event) {
        this.body = event.target.value;
    }

    // step - 1 select object from dropdown
    get options() {
        return [
                 { label: 'Account', value: 'Account' },
                 { label: 'Contact', value: 'Contact' },
                 { label: 'Lead', value: 'Lead' },
               ];
    }
    
    // handleChange event for get records of selected object 

    handleChange(event) {
            this.value = event.detail.value;
            const select = event.detail.value;
            if (select === 'Account') {
                const columns1 = [
                    { label: 'AcountName', fieldName: 'Name' },
                    { label: 'Email', fieldName: 'Email__c' },
                    { label: 'Phone', fieldName: 'Phone' },
                    { label: 'Rating', fieldName: 'Rating' }            
                ];
                this.columns = columns1;
                getAccount()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })
            }
            else if(select === 'Contact'){
                const columns2 = [
                    { label: 'FirstName', fieldName: 'FirstName' },
                    { label: 'LastName', fieldName: 'LastName' },
                    { label: 'Email', fieldName: 'Email' },
                    { label: 'Phone', fieldName: 'Phone' }
                ];
                this.columns = columns2;

                getContact()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })

            }else if(select === 'Lead'){
                const columns3 = [
                    { label: 'Name', fieldName: 'Name' },
                    { label: 'Email', fieldName: 'Email' },
                    { label: 'Company', fieldName: 'Company' }
                ];
                this.columns = columns3;

                getLead()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })
            }
           
         }
 
    get isStepOne() {
        return this.currentStep === "1";
    }
 
    get isStepTwo() {
        return this.currentStep === "2";
    }
 
    get isStepThree() {
        return this.currentStep === "3";
    }
 
    get isEnableNext() {
        return this.currentStep != "3";
    }
 
    get isEnablePrev() {
        return this.currentStep != "1";
    }
 
    get isEnableFinish() {
        return this.currentStep === "3";
    }
 
    handleNext(){
        // if(this.currentStep == "1" && this.value != '' ){
        if(this.currentStep == "1" || this.value != '' ){    
            this.handleclick();
            this.currentStep = "2";
        }
        else if(this.currentStep = "2" && this.subject != ''){
            const value = this.template.querySelector('lightning-input-rich-text').value;
            this.myVal = value;
            this.currentStep = "3";
        }
    }
 
    handlePrev(){
        if(this.currentStep == "3"){
            this.currentStep = "2";
        }
        else if(this.currentStep = "2"){
            this.currentStep = "1";
        }
    }
 
    handleFinish(){
        const emailDetails = {
            body: this.body,
            toSend : this.selectValue,
            subject: this.subject
        };
        console.log(emailDetails);

        sendEmailToController(emailDetails)
            .then(() => {
                console.log("Email Sent");
            })
            .catch((error) => {
                console.log('error');
                console.error("Error in sendEmailController:", error);
            }); 
    }
}




            //  this.selectValue = JSON.parse("[" + this.selectValue.join() + "]");
        // console.log(JSON.stringify(this.value1));

        // let a = "jenishgangani238@gmail.com" ;
        // console.log('1');
        // for (let i = 0; i < JSON.stringify(this.selectValue.length); i++) {
        //     console.log('2');
        //     a = `${a}` +','+ `${this.selectValue[i]}`;
        // }
        // this.toP = a;
        // console.log('a:::' + JSON.stringify(a));

        // console.log('3');
        // a = a.replaceAll("\"(.+)\"", "$1");
        // // a = JSON.stringify(a).substring(1,  JSON.stringify(a.length()) - 1);
        // console.log('4');
        // console.log('a:::' + JSON.stringify(a));
        // console.log('5');


// import { LightningElement } from 'lwc';

// export default class WizardLwc extends LightningElement {
//     steps = [{label:"Object Records", value:"1"},{label:"Email Draft", value:"2"},{label:"Email Preview", value:"3"}]
//     current = "1";
//     currentIndex = 0;

//     get step1(){
//         return this.current == this.steps[0].value;
//     }

//     get step2(){
//         return this.current == this.steps[1].value;
//     }

//     get step3(){
//         return this.current == this.steps[2].value;
//     }
// }