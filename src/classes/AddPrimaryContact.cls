public class AddPrimaryContact implements Queueable {
    private Contact cons;
    private string state;
    
    public AddPrimaryContact(Contact cons,string state){
        this.cons=cons;
        this.state=state;
    }
    
    public void execute(QueueableContext context){
        List<Contact> conlist=new List<Contact>();
        for(Account acc:[select Id,billingState from Account where billingState=:state]){
            cons.AccountId=acc.Id;
            cons.FirstName='FirstName';
            cons.FirstName='LastName';
            cons.MailingState=acc.BillingState;   
            conlist.add(cons);              
        }       
        if(!conlist.isEmpty()){
          insert conlist;   
        }        
    }

}