@isTest
public class AnimalLocatorMock implements HttpCalloutMock{
    
    public HttpResponse respond(HttpRequest req){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type','application/json;charset=UTF-8');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        return response;        
    }

}