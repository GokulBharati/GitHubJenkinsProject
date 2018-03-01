public class AnimalLocator {
    
    public static string getAnimalNameById(Integer ids){
        Map<string,string> keyValue=new Map<string,string>();
        keyValue.put('endpoint','https://th-apex-http-callout.herokuapp.com/animals/'+ids);
        keyValue.put('contentType','application/json;charset=UTF-8');
        keyValue.put('method','GET');
        HttpRequest req=new HttpRequest();
        req.setEndpoint(keyValue.get('endpoint'));
        req.setHeader('Content-Type',keyValue.get('contentType'));
        req.setMethod(keyValue.get('method'));
        Map<string,Object> keyVal=new Map<string,Object>(); 
        Map<string,Object> animal=new Map<string,Object>();
        if(req!=null){
            Http http=new Http();
            HttpResponse res=http.send(req);
            if(res.getStatusCode()==200){
                keyVal=(Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            }  
        } 
        animal=(Map<string,Object>)keyVal.get('animal');
        return (string)animal.get('name');
    }
}