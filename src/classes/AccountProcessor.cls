public class AccountProcessor {
    @future
    public static void countContacts(List<Id> AccIds){
        List<Account> accList=new List<Account>();
        for(Account a:[select id,(select id from Contacts) from Account where Id in:AccIds]){
            a.Number_of_Contacts__c=(a.Contacts).size();   
            accList.add(a);
        }   
        if(!accList.isEmpty())  {
            update accList;
        }   
    }
}