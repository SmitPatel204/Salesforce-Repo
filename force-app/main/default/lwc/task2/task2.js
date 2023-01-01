import { LightningElement, wire,api, track } from 'lwc';
import getRelatedFiles from "@salesforce/apex/newListFileClass.getRelatedFiles";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { refreshApex } from "@salesforce/apex";

export default class Task2PeriveandNext extends LightningElement {
    @api recordId;
    loaded = true;
    pageSizeOptions = [5];
    records = [];
    columns = []; 
    totalRecords = 0;
    pageSize;
    totalPages;
    pageNumber = 1;
    recordsToDisplay = [];
    
    connectedCallback() {
     this.columns = [
        { label: 'fileTitle', fieldName: 'Title' },
        { label: 'fileExtension', fieldName: 'FileExtension' },
        { label: 'fileContentDocumentId', fieldName: 'ContentDocumentId' },
        { label: 'fileContentDocument', fieldName: 'ContentDocument' },
        { label: 'fileCreatedDate', fieldName: 'CreatedDate' }
    ];
    getRelatedFiles(), { recordId: '$recordId' }
            .then((result) => {
                if (result != null) {
                    this.wiredActivities = result;
                    // console.log('RESULT--> ' + JSON.stringify(result));
                    this.records = result;
                    this.totalRecords = result.length; // update total records count                 
                    this.pageSize = this.pageSizeOptions[0]; 
                    console.log('2');//set pageSize with default value as first option
                    this.paginationHelper(); // call helper menthod to update pagination logic 
                }
            })
            .catch((error) => {
                console.log('error while fetch contacts--> ' + JSON.stringify(error));
            });
}
    
    
    get bDisableFirst() {
        return this.pageNumber == 1;
    }
    get bDisableLast() {
        return this.pageNumber == this.totalPages;
    }
    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }
    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }
    firstPage() {
        this.pageNumber = 1;
        this.paginationHelper();
    }
    lastPage() {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }
    // JS function to handel pagination logic 
    paginationHelper() {
        this.recordsToDisplay = [];
        // calculate total pages
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        // set page number 
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }
        // set records to display on current page 
        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.records[i]);
        }
    }
    handleFilesChange(event) {
        const uploadedFiles = event.detail.records;
        alert('1');
        this.connectedCallback();
        // alert('No. of files uploaded : ' + uploadedFiles.length);
    }
}