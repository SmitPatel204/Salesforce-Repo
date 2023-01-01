global with sharing class addImageToOpp {
    public addImageToOpp(ApexPages.StandardController stdController) {

    }
    @future
    webservice static void futureMethod(Id oppoId){
        Http http1=new Http();
        HttpRequest req1=new HttpRequest();
        req1.setendpoint('https://api.unsplash.com/photos/random/?q:low&client_id=XAqouOKS7-jPZ9YDIJbkrMCIFrIlUF582syrJ_HVKXE');
        //req1.Setheader('String','String');
        req1.setmethod('GET'); 
        HttpResponse res1;
        res1 = http1.send(req1);
        string responseValue = '';
        responseValue = res1.getBody();
        system.debug('Response Body : ' + responseValue);
        blob image = res1.getBodyAsBlob();

        // String href_link = responseValue.substring(responseValue.indexof('4.0.3')+5);
        String href_link = responseValue.substring(responseValue.indexof('https://'), responseValue.indexof('4.0.3')+5);
        System.debug(href_link);
        HttpRequest http2 = new HttpRequest();
        http2.setEndpoint(href_link);
        http2.setMethod('GET');
        Http httpObject1 = new Http();
        HttpResponse img = httpObject1.send(http2);
        System.debug('Random Img : '+img);
                
        Attachment randomImg = new Attachment(Name = 'Img', Body = img.getBodyAsBlob(), ContentType = 'image/jpeg',ParentId=oppoId);
        insert randomImg; 
    }
}
