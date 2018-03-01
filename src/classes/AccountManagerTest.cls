@isTest
public class AccountManagerTest {
  
    @isTest
    public static void getAccount(){
        Account acc=new Account();
        acc.name='Test Account';
        insert acc;
        List<contact> cons=new List<contact>();
        for(integer i=1;i<200;i++){
            Contact c=new Contact(FirstName='FirstName'+i,LastName='LastName'+i,accountId=acc.Id);
            cons.add(c);
        }
        insert cons;
        System.Test.startTest();
        // Set up a test request
        RestRequest request = new RestRequest();
        String recordId=[select id from Account LIMIT 1].Id;
        request.requestUri =
            'https://glightning-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            +recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Set up a test request
        AccountManager.getAccount();
        System.Test.stopTest(); 
    }
}