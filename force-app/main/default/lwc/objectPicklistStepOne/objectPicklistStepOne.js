// import { LightningElement } from 'lwc';

// export default class ObjectPicklistStepOne extends LightningElement {}
import { LightningElement,track } from 'lwc';
// import getfields from "@salesforce/apex/taskFourWizardLwc.getfields";
import getfields from "@salesforce/apex/taskFourWizardLwc.getfields";
export default class Test extends LightningElement {
    @track value = 'inProgress';
    @track data1 = [];
    get options() {
        return [
                { label: ' Account', value: 'Account' },
                { label: 'Contact', value: 'Contact' },
                { label: 'Lead', value: 'Lead' }
            ];
    }
    get Options() {
        console.log(data1);
        return this.data1;
    }
    

    handleChange(event) {
            this.value = event.detail.value;
            const select = event.detail.value;
        getfields({
        objectname: select
        })
        .then((result) => {
            let data = JSON.parse(JSON.stringify(result));
            let lstOption = [];
        for (var i = 0;i < data.length;i++) {
            lstOption.push({value: data[i].QualifiedApiName,label: data[i].DeveloperName
            });
        }
            console.log(lstOption);
            this.data1 = lstOption;
            this.showLoadingSpinner = false;
        })
        .catch((error) => {
            error;
        });
    }
}