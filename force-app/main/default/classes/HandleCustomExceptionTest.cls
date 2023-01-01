public with sharing class HandleCustomExceptionTest {
    public static void CreateAccount(List<Account> accList) {
        try {
            Account m;
            insert m;
        } catch (Exception e) {
            HandleCustomException.LogException(e);
        }    
    } 
}
