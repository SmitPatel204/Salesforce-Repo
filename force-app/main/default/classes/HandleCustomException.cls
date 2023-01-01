public with sharing class HandleCustomException extends Exception{
    // public static void LogException(Exception e)
    // {
    //     LogException(e,'');
    // }
    public static void LogException(Exception e){
        
            System.debug('Value of e : '+e);
            Error_Log__c exc = new Error_Log__c();
            String stackTrace = e.getStackTraceString().substringBefore('\n');
            System.debug('stackTrace : '+stackTrace);
            String className = stackTrace.substringAfter('.').substringBefore('.');	
            String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');

            exc.Exception_Message__c = e.getMessage();
            exc.Exception_Type__c = e.getTypeName();
            exc.Line_Number__c = e.getLineNumber();
            exc.Method_Name__c=methodName;
            exc.Class_Name__c=className;
            insert(exc);
        
    }    
}
