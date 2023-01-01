import { LightningElement,api } from 'lwc';

export default class ProgressBarForWizard extends LightningElement {

    @api steps;
    @api type;
    @api currentStep;

    get isIndicator(){
        return this.type == 'indicator';
    }

    get progress(){
        let position = 0;
        let i = 1;
        this.steps.forEach((step) =>{
            if(step.value == this.currentStep) {
                position = i;
            }
            i++;
        });
        return 100*position/(this.steps.length - 1);
    }


}