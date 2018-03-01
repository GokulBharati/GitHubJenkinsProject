public class AccountTriggerHandler implements InterfaceTrigger{
    
     public AccountTriggerHandler(){}
    
     public void beforeInsertAndUpdate(List<sObject> TriggerNew,List<sObject> TriggerOld){
        List<Account> newAccounts=(List<Account>)TriggerNew;
        if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){  
          for(Account acc:newAccounts){
              if(acc.Match_Billing_Address__c==true && acc.BillingPostalCode!=null){
                  acc.ShippingPostalCode=acc.BillingPostalCode;  
              }
              else if(acc.Match_Billing_Address__c==false){
                  acc.ShippingPostalCode='';
              }
          }
      }        
         
    }
    
    public void beforeUpdate(List<sObject> TriggerNew,List<sObject> TriggerOld,Map<Id,sObject> TriggernewMap,Map<Id,sObject> TriggerOldMap){}
    
    public void beforeInsert(List<sObject> TriggerNew){}

}