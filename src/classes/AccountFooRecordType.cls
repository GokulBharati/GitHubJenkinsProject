/**********************Singleton Pattern(single instantiate in a single trasaction/lazy load)*******************/
public class AccountFooRecordType {
/********Lazy Initialization************ 
    // private static variable referencing the class
    private static AccountFooRecordType instance = null;
    public String id {get;private set;} // the id of the record type

    // The constructor is private and initializes the id of the record type
    private AccountFooRecordType(){
        id = Account.sObjectType.getDescribe()
            .getRecordTypeInfosByName().get('Foo').getRecordTypeId();
    }
    // a static method that returns the instance of the record type
    public static AccountFooRecordType getInstance(){
        // lazy load the record type - only initialize if it doesn't already exist
        if(instance == null) instance = new AccountFooRecordType();
        return instance;
    }
****/  
/********Eager Initialization*************/  
private static final AccountFooRecordType instance = new AccountFooRecordType();
    public String id {get;private set;}
    private AccountFooRecordType(){
        id = Account.sObjectType.getDescribe()
            .getRecordTypeInfosByName().get('Foo').getRecordTypeId();
    }
    public static AccountFooRecordType getInstance(){
        // eager load of the class
        return instance;
    }
}