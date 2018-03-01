@isTest(seeAllData=true)
private class AccountProcessorTest {
  @isTest
    public static void countContacts(){
        Map<Id,Account> accIds=new Map<Id,Account>([select id from Account LIMIT 100]);
        System.Test.startTest();
        AccountProcessor.countContacts(new List<Id>(accIds.keySet())); 
        System.Test.stopTest();
    }
}