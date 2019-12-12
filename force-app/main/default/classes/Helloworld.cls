public with sharing class HelloworldForRest {
    public static void main(){
        //Request creation
        HttpRequest req=new HttpRequest();
        req.setEndpoint('google.com/search?q=heelo');
        req.setHeader('Content-type','accept/json');
        req.setMethod('GET');
        //req.setMethod('POST');
        //req.setBody('{}');
        Http http=new Http();
        //sending request
        HttpResponse response=http.send(req);
        response.getStatusCode();
        String s='{grabi:ram,xy:1}';//response.getBody();
        response.getStatus();
        //parsing
        Map<String,object> c=(Map<String,object>) JSON.deserializeUntyped(s);
        wrap c1=(wrap)JSON.deserialize(s, wrap.class);
      
        
        
    }
    public class wrap{
        public string grabi{set;get;}
    }
}
