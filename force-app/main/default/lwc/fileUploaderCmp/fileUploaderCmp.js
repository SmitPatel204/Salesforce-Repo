import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import uploadFile from '@salesforce/apex/FileUploaderClass.uploadFile'
export default class FileUploaderCmp extends LightningElement {

    @api recordId;                                                                    //accountId  
    fileData
    openfileupload(event){
        const file = event.target.files[0]                                            //1. fetch the file content
        var reader = new FileReader()                                                //2. file reader from constructor   
        reader.onload =()=>{                                                        //4. once file loading done execute this method    
            var base64 = reader.result.split(',')[1]                                 //5. once reading of data completed come to this line and store converted base64 data in variable 
            console.log('base64 val : '+base64);
            this.fileData = {                                                        //6. create obj which store file name and base64 content       
                'filename':file.name,
                'base64':base64,
                'recordId':this.recordId
            }
            console.log(this.fileData)
        }
        reader.readAsDataURL(file)                                                  //3. This read binaray data and code it as base64   
    }

    // button click method
    handleClick(){
        const{base64, filename, recordId} = this.fileData
        uploadFile({base64, filename, recordId}).then(result=>{                     //passing the data 
            this.fileData = null                                                    //clear file data 
            console.log(`${result} uploaded successfully!!`)                        
            let title = `${filename} uploaded successfully!!`                       
            this.toast(title)                                                       //show succes message using toast message    
            console.log('title name : '+title)
        })
    }

    toast(title){                                                                   //create toast for show succes message 
        const toastEvent = new ShowToastEvent({
            title,
            variant:"success"
        })
        this.dispatchEvent(toastEvent)
    }
}

