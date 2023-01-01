public with sharing class newListFileClass {
    @AuraEnabled(cacheable=true)
    public static Map<ID, String> getRelatedFiles(String recordId) {
        // Get record file IDs        
        List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
        List<ID> fileIDs = new List<ID>();
        for (ContentDocumentLink docLink : files) {
            fileIDs.add(docLink.ContentDocumentId);
        }
 
        List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title 
            FROM ContentVersion WHERE ContentDocumentId IN : fileIDs];
        Map<ID, String> mapIdTitle = new Map<ID, String>();
        for (ContentVersion docLink : docs) {
            mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
        }
        return mapIdTitle;
    }
    // @AuraEnabled(cacheable=true)
    // public static List<file> getRelatedFiles(String recordId){
    //     List<File> files = new List<File>();

    //     for(ContentDocumentLink conLink : [SELECT ContentDocument.Id, ContentDocument.Title,
    //                                        ContentDocument.CreatedDate, ContentDocument.FileType 
    //                                        FROM ContentDocumentLink WHERE LinkedEntityId =: recordId]){
    //         File file = new File();
    //         file.Title = conLink.ContentDocument.Title;
    //         file.Id = conLink.ContentDocument.Id;
    //         file.CreatedDate = conLink.ContentDocument.CreatedDate;
    //         file.Type = conLink.ContentDocument.FileType;
    //         files.add(file);
    //     }
    //     return files;
    // }

    // public class File{
    //     @AuraEnabled public String Title;
    //     @AuraEnabled public String Type;
    //     @AuraEnabled public Id Id;
    //     @AuraEnabled public Datetime CreatedDate;
    // }
}
