import { LightningElement, api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getRelatedFiles from '@salesforce/apex/FileUploadViewController.getRelatedFiles';

export default class FileUploadView extends LightningElement{
    @api label;
    @api formats = '.png, .jpg';
    @api recordId;

    get acceptedFormats() {
        console.log(this.formats.split(','));
        return this.formats.split(',');
    }

    // @wire : To read Salesforce data, Lightning web components use a reactive wire service.
    @wire(getRelatedFiles, { recordId: '$recordId' }) //apexMethod and apexMethodParams
    files;                                            //propertyOrFunction                                              

    // handleActionFinished(event) {
    //     //refresh the list of files
    //     refreshApex(this.files);
    // }
}