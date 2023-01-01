import { LightningElement, track, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
// import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getRelatedFiles from '@salesforce/apex/FileUploadViewController.getRelatedFiles';
const columns =[
    {
        lable:"Name",
        fieldName:"ContentDocument.Id"
    },
    {
        lable:"Type",
        fieldName:"ContentDocument.FileType"
    }
]
export default class FilesList extends NavigationMixin(LightningElement) {

    @api files;
    @track originalMessage;
    @track isDialogVisible = false;

    @track columns = columns;
    // @track file; //data store for display
    // @track files; //contains all records
    // @track startingRecord = 1;
    // @track page = 1;
    // @track endingRecord = 0;
    // @track totalRecordCount; // total records count
    // @track totalpage; //divded to how many pages
    // @track pageSize = 5;
    

    filePreview(event) {
        // Naviagation to the show preview
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state: {
                // assigning ContentDocumentId to show the preview of file
                selectedRecordId: event.currentTarget.dataset.id
            }
        })
    }

    // @wire(getRelatedFiles, { recordId: '$recordId' }) //apexMethod and apexMethodParams
    // files; 

    // @wire(getRelatedFiles, { recordId: '$recordId' }) fetchFiles(result){
    //     if(result.file){
    //         //files store all file
    //         this.files = result.file; 
    //         console.log(this.files);
    //         //total record count
    //         this.totalRecordCount = result.file.length;
    //         console.log(this.totalRecordCount);
    //         //total page count
    //         this.totalpage = Math.ceil(this.totalRecordCount/this.pageSize)
    //         console.log(this.totalpage);
    //         //
    //         this.file = this.files.slice(0,this.pageSize);
    //         console.log(this.file);
    //         this.endingRecord = this.pageSize;
    //     }
    // }
    // //onclick of previous method
    // prevHandler(event){
    //     if(this.page > 1){
    //         this.page = this.page - 1;
    //         this.displayRecordPerPage(this.page);
    //     }
    // }
    // //onclick of next method
    // nextHandler(event){
    //     if(this.page < this.totalpage && this.page !== this.totalpage){
    //         this.page = this.page + 1;
    //         this.displayRecordPerPage(this.page);
    //     }
    // }
    // displayRecordPerPage(page){
    //     this.startingRecord = (page - 1)*this.pageSize;
    //     this.endingRecord = page*this.pageSize;
    //     this.endingRecord = (this.endingRecord > this.totalRecordCount)?this.totalRecordCount:this.endingRecord;
    //     this.file = this.files.slice(this.startingRecord,this.endingRecord);
    //     this.startingRecord = this.startingRecord+1;
    // }    

}