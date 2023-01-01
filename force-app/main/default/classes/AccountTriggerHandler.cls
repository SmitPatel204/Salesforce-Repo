public with sharing class AccountTriggerHandler {
    // Task - 5
    public static void changeOwnerAsPublic(List<Account> newList){
        for(Account nAcc : newList){
            nAcc.Ownership = 'Public';
        }
    }
    // Task - 6
    public static void sendEmailToContacts(List<Account> newList,Map<Id,Account> accMap){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Set<Id> accId = new Set<Id>();
        for(Account acc : newList){
            if(acc.Name != accMap.get(acc.Id).Name){
                accId.add(acc.Id);
            }
        }

        if(accId.size() > 0){
            List<Contact> conList = new List<Contact>();
            conList = [SELECT Id,Email FROM Contact WHERE Email != null AND AccountId IN :accId];

            if(conList.size()>0){
                List<String> conEmail = new List<String>();
                for(Contact con : conList){
                    conEmail.add(con.Email);
                }

                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(conEmail);
                mail.setReplyTo(UserInfo.getUserEmail());
                mail.setSubject('Account Name Changed');
                String body = 'Hi,';
                body += 'Your Account Name has been changed to';
                mail.setHtmlBody(body);
                mails.add(mail);
            } 
        }
        Messaging.sendEmail(mails);
    }
    // Task - 8
    public static void prefixToAccName(List<Account> accList){
        for(Account acc : accList){
            acc.Name = 'Mr' + acc.Name;
        }
    }
    // Task - 10
    public static void submitApproval(List<Account> accList){
        
        for(Account acc1 : accList){
            Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
            approvalRequest.setComments('Submited for Approval');
            approvalRequest.setObjectId(acc1.Id);
            // approvalRequest.setSubmitterId(UserInfo.getUserId());
            // approvalRequest.setProcessDefinitionNameOrId('Approve_Account_Rating');
            // approvalRequest.setnextApproverIds(acc1.Id);
            // approvalRequest.setNextApproverIds(id[]);
            System.debug('test11111:::');
            Approval.ProcessResult approvalResult1 = Approval.process(approvalRequest);
            System.debug('Approval submited successfully : '+ approvalResult1.isSuccess());
        }
        
    }
    // Task - 12
    public static void createContact(List<Account> accList){
        List<Contact> conlist = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact(LastName = acc.Name, AccountId = acc.Id);
            conlist.add(con);   
        }
        insert conlist;
    }
    // Task - 14
    public static void deleteExistingAccount(List<Account> accList){
        List<Account> accDelete = new List<Account>();
        System.debug('First stage accDelete : '+accDelete);

        for(Account acc : accList){
            System.debug('acc : '+acc);
            for(Account accOld : [SELECT Name FROM Account WHERE Name =: acc.Name]){
                System.debug('accOld : '+accOld);
                accDelete.add(accOld);
                System.debug('Second stage accDelete : '+accDelete);
            }
        } 
        delete accDelete;    
    }
}
