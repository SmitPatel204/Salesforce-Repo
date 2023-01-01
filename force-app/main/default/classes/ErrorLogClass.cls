public with sharing class ErrorLogClass {
    private static List<Error_Log__c> exceptionList = new List<Error_Log__c>();  

    public void addException (String className,String exceptionMessage,String exceptionType,Integer lineNumber,String methodName,String moreDetails){
        
        Error_Log__c errorLog = new Error_Log__c(
            Class_Name__c = className,
            Exception_Message__c = exceptionMessage,
            Exception_Type__c = exceptionType,
            Line_Number__c = lineNumber,
            Method_Name__c = methodName,
            More_Details__c = moreDetails
        );
        exceptionList.add(errorLog);
        insert exceptionList;
    }
}

