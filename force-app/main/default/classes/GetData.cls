public   class GetData 
{
    @AuraEnabled
    public static void main()
    {
        
    }
    @AuraEnabled public static List<Weather__c> call(String picval)
    {
        List<GetData.wrap> weatherdetails=new List<GetData.wrap>();
        Weather__c weaobj=new Weather__c();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.oceandrivers.com/v1.0/getEventStations/'+picval+'/');
        request.setHeader('Content-type','accept/json');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        String responseBody = response.getBody();
        System.debug('Response:' + responseBody);
        String s=responseBody;
        Map<String,object> c=(Map<String,object>) JSON.deserializeUntyped(s);
        wrap c1=(wrap)JSON.deserialize(s, wrap.class);
        System.debug(c1);
        weaobj.Title__c=picval;
        weaobj.status__c=c1.status;
        weaobj.message__c=c1.message;
        insert weaobj;
        List<Weather__c> w = [SELECT Title__c,status__c,message__c FROM Weather__c where Title__c=:picval]; 
        System.debug(w);
        return w;
        
    }
    class wrap{
        public string message;
        public integer status;
    }
}