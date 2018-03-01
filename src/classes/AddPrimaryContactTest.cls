@isTest
public class AddPrimaryContactTest {
   @testSetUp
    public static void SetUpData(){
        List<Account> acclist=new List<Account>();
        for(Integer i=1;i<101;i++){
            if(i<51){
            Account acc=new Account(Name='Test Account'+i,BillingState='NY');    
            acclist.add(acc);
            }
            else if(i>50 && i<101){
            Account acc=new Account(Name='Test Account'+i,BillingState='CA');    
            acclist.add(acc);    
            }
        }
        if(!acclist.isEmpty()){
            insert acclist;
        } 
    }
    
    @isTest
    public static void AddPrimaryContact(){
        System.Test.startTest();
        AddPrimaryContact acc1=new AddPrimaryContact(new Contact(),'NY');
        system.enqueueJob(acc1);
        AddPrimaryContact acc2=new AddPrimaryContact(new Contact(),'CA');
        system.enqueueJob(acc2);
        System.Test.stopTest();
        for(Account a:[select id,(select id from Contacts LIMIT 1) from Account where BillingState='CA' LIMIT 50]){
          system.assert(a.contacts[0].mailingState=='CA');  
        }
    }
}