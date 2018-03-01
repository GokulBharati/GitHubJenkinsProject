@RestResource(urlMapping='/Accounts/*')
global class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        List<string> accId= request.requestURI.split('/');
        Account acc=[select id,Name,(Select id,Name from Contacts) from Account where Id=:accId[accId.size()-2]]; 
        return acc;
    } 
}