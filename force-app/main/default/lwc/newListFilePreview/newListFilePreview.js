import { LightningElement, api, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import getRelatedFiles from '@salesforce/apex/newListFileClass.getRelatedFiles';

// const columns =[
//     {
//         lable:"Name",
//         fieldName:"ContentDocument.Id"
//     },
//     {
//         lable:"Type",
//         fieldName:"ContentDocument.FileType"
//     }
// ]
export default class newListFilePreview extends NavigationMixin(LightningElement){
    @api label;
    @api formats = '.png, .jpg';
    @api recordId;
    filesList =[]
    totalfile
    visiblefile

    //for pagination
    // @track columns = columns;
    // @track files; //data store for display
    // @track items; //contains all records
    // @track startingRecord = 1;
    // @track page = 1;
    // @track endingRecord = 0;
    // @track totalRecordCount; // total records count
    // @track totalpage; //divded to how many pages
    // @track pageSize = 5;

    get acceptedFormats() {
        console.log(this.formats.split(','));
        return this.formats.split(',');
    }

    // @wire : To read Salesforce data, Lightning web components use a reactive wire service.
    // @wire(getRelatedFiles, { recordId: '$recordId' }) //apexMethod and apexMethodParams
    // files;                                            //propertyOrFunction                                              
    @wire(getRelatedFiles, {recordId: '$recordId'})
    wiredResult({data, error}){ 
        if(data){ 
            console.log(data)
            this.filesList = Object.keys(data).map(item=>({"label":data[item],
             "value": item,
             "url":`/sfc/servlet.shepherd/document/download/${item}`
            }))
            console.log(this.filesList)
            this.totalfile = this.filesList
            console.log('total con :- ' + this.filesList.length)
        }
        if(error){ 
            console.log(error)
        }
    }

    handleActionFinished(event) {
        //refresh the list of files
        refreshApex(this.files);
    }

    filePreview(event) {
        // Naviagation Service to the show preview
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

    updateContactHandler(event){
        this.visiblefile=[...event.detail.records]
        console.log(event.detail.records)
    }
    // @wire(getRelatedFiles, { recordId: '$recordId' }) fetchFiles(result){
    //     if(result.files){
    //         //files store all file
    //         this.items = result.files; 
    //         console.log(this.items);
    //         //total record count
    //         this.totalRecordCount = result.files.length;
    //         console.log(this.totalRecordCount);
    //         //total page count
    //         this.totalpage = Math.ceil(this.totalRecordCount/this.pageSize)
    //         console.log(this.totalpage);
    //         //
    //         this.files = this.items.slice(0,this.pageSize);
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
    //     this.files = this.items.slice(this.startingRecord,this.endingRecord);
    //     this.startingRecord = this.startingRecord+1;
    // }
}