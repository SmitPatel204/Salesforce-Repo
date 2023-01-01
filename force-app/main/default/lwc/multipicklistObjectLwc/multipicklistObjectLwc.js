import { LightningElement, track } from 'lwc';
import getAccountData from '@salesforce/apex/soslTaskFive.getAccountData';
import getAccount from '@salesforce/apex/soslTaskFive.getAccount';

export default class Task5copy extends LightningElement {
    @track value;
    @track options =
        [
            { label: 'Account', value: 'Account' },
            { label: 'Contact', value: 'Contact' },
            { label: 'Lead', value: 'Lead' },
            { label: 'Opportunity', value: 'Opportunity' },
        ];
    @track allValues = [];

    handleChange(event) {
        if (!this.allValues.includes(event.target.value)) { this.allValues.push(event.target.value); }
        console.log(JSON.stringify(this.allValues));
        this.serchrecode();
    }

    handleRemove(event) {
        const valueRemoved = event.target.name;
        this.allValues.splice(this.allValues.indexOf(valueRemoved), 1);
        console.log(JSON.stringify(this.allValues));
        this.serchrecode();

    }
    @track searchKey;
    @track accounts;
    @track Contacts;
    @track Leads;
    @track Opportunities;
    
    handelSearchKey(event) {
        this.searchKey = event.target.value;
        console.log('search input :' + this.searchKey);
    }

    SearchAccountHandler(event) {
        const a = {
            textkey: this.searchKey
        }
        console.log('function');
        getAccountData(a)
            .then(result => {
                // alert('1');
                for (let index = 0; index < JSON.stringify(this.allValues.length); index++) {
                    if (this.allValues[index] === 'Account') { this.accounts = result[0]; }
                    else if (this.allValues[index] === 'Contact') { this.Contacts = result[1]; }
                    else if (this.allValues[index] === 'Lead') { this.Leads = result[2]; }
                    else if (this.allValues[index] === 'Opportunity') { this.Opportunities = result[3]; }
                }
                console.log(JSON.stringify(result[0]));
            })
            .catch(error => {
                console.log(error);
            });

    }
    cols = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone' },
        { label: 'Rating', fieldName: 'Rating' },
        { label: 'Email', fieldName: 'Email__c' },
    ]
    cols1 = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'LastName', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' },
    ]
    cols2 = [
        { label: 'Lead Name', fieldName: 'Name' },
        { label: 'Lead Email', fieldName: 'Email' },
        { label: 'Lead Company', fieldName: 'Company' },
        { label: 'Lead Phone', fieldName: 'Phone' },
    ]

    cols3 = [
        { label: 'Opportunity Name', fieldName: 'Name' },
        { label: 'Opportunity stage', fieldName: 'StageName' },
        { label: 'Opportunity Close Date', fieldName: '	CloseDate' },
        { label: 'Opportunity Type', fieldName: 'Type' },
    ]

    serchrecode() {
        for (let index = 0; index < JSON.stringify(this.allValues.length); index++) {
            console.log('for loop' + JSON.stringify(this.allValues.length));
            if (this.allValues[index] === 'Account') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Phone',
                    filed4: 'Rating',
                    filed5: 'Email__c',
                    filed3: 'Account'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('Account');
                        if (result != null) {
                            this.accounts = result;
                        }
                       
                    })
                    .catch(error => {console.log("Account call error");
                    });
            } else if (this.allValues[index] === 'Contact') {
                const filed = {
                    filed1: 'FirstName',
                    filed2: 'LastName',
                    filed4: 'Email',
                    filed5: 'Phone',
                    filed3: 'Contact'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('cccconli');
                        if (result != null) {
                            this.Contacts = result;
                        }   
                    })
                    .catch(error => {
                    });


            } else if (this.allValues[index] === 'Lead') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Email',
                    filed4: 'Company',
                    filed5: 'Phone',
                    filed3: 'Lead'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('lead');
                        if (result != null) {
                            this.Leads = result;
                        }
                    })
                    .catch(error => {
                    });

            } else if (this.allValues[index] === 'Opportunity') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'StageName',
                    filed4: 'CloseDate',
                    filed5: 'Type',
                    filed3: 'Opportunity'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('Opportunity');
                        if (result != null) {
                            this.Opportunities = result;
                        }
                    })
                    .catch(error => {
                    });
            }
        }
    }
}




// import { LightningElement,track } from 'lwc';

// export default class MultipicklistObjectLwc extends LightningElement {
//     @track value;
//     @track options = [
//         {lable : 'Account', value: 'Account' },
//         {lable : 'Contact', value: 'Contact' },
//         {lable : 'Lead', value: 'Lead' },
//         {lable : 'Opportunity', value: 'Opportunity' },
//     ];
//     @track allValues = [];

//     handleChange(event){
//         if(!this.allValues.includes(event.target.value)){
//             this.allValues.push(event.target.value);
//         }
//     }

//     handleRemove(event){
//         const valueRemoved = event.target.value;
//         this.allValues.splice(this.allValues.indexOf(valueRemoved),1);
//     }
// }