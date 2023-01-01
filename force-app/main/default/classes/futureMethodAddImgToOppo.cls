global with sharing class futureMethodAddImgToOppo {
    // ApexPages.StandardController Sc;
    public blob image {get;set;}
    private String opportunityId;
    // public string code {get;set;}
    // public string values {get;set;}
    // private Id oppId;
    // public Opportunity oppList{get;set;}

    public futureMethodAddImgToOppo() {
        // this.oppId = ApexPages.currentPage().getParameters().get('id');
        // oppList = [SELECT Id FROM Opportunity where id=:oppId];
        this.opportunityId = ApexPages.CurrentPage().getparameters().get('thisOppId'); 
        System.debug('oppo Id : '+opportunityId);
        //custom parameter name, make sure this is used in the custom button
        if(opportunityId != null) //don't queue the job unless we have the id to pass in
        {
            addImgToOppo(opportunityId); //call the future method and let it know the id of the opty you want it to work with
        }
    }
    @future(callout=true)
    public static void addImgToOppo(String opportunityId){
        
        Opportunity theOppRecord;
        List<Opportunity> lo = new List<Opportunity>([select id from Opportunity where Id = :opportunityId]); 
        if(lo.size() > 0){
            theOppRecord = lo[0];
        }

        HTTP http1 = new HTTP();
        HTTPRequest req = new HTTPRequest();

        req.setEndpoint('https://unsplash.com/collections/466685/interior');
        req.setMethod('GET');
        System.debug('request'+req);
        req.setTimeout(11000);

        HTTPResponse res = http1.send(req);              //1
        System.debug('GET -- : '+res);

        string responseValue = '';                       //2
        responseValue = res.getBody();
        System.debug('Response val : '+responseValue);

        // code = res.getStatus();
        // System.debug('Get code var : '+code);
        // values = res.getBody();
        // System.debug('Get res val : '+values);


        // Blob strtoblob = Blob.valueOf(responseValue);                                //STR TO BLOB
        blob image = res.getBodyAsBlob();                                            //IMG IN BLOB(FIRST)

        // image = EncodingUtil.base64encode(res.getBodyAsBlob());                    //TRY TO GET IMG 
        System.debug('Response Image : '+image);
        // image1 = EncodingUtil.base64Decode(image);
        // System.debug('Response Image1'+image1);
        
        
        Attachment img = new Attachment(Name='Img', Body = image, ContentType = 'image/jpeg', ParentId = theOppRecord.id);
        // Attachment att = new Attachment(Name='Img', Body = img.getBodyAsBlob(), ContentType = 'image/jpeg', ParentId='0065g00000U3XsnAA3');
        insert img;
    }
}
// theOppRecord.id
