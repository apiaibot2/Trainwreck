public class WeatherData 
{
    public class wrap
    {
        public string title;
        public string location_type;
        public integer woeid;
        public integer distance;
        public string latt_long;
    }
    @Auraenabled
    public static List<Weather__c> call(String picval)
    {
        List<WeatherData.wrap> weatherdetails=new List<WeatherData.wrap>();
        Weather__c weatherobj=new Weather__c();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.metaweather.com/api/location/search/?query='+picval);
        request.setHeader('Content-type','accept/json');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        String responseBody = response.getBody();
        System.debug('Response:' + responseBody);
        List<WeatherData.wrap> WeatherDatalist=(List<WeatherData.wrap>)JSON.deserialize(responseBody, List<WeatherData.wrap>.class);
        for(WeatherData.wrap wp:WeatherDatalist)
        {
            weatherdetails.add(wp);
            weatherobj.distance__c=wp.distance;
            weatherobj.latt_long__c=wp.latt_long;
            weatherobj.title__c=wp.title;
            weatherobj.woeid__c=wp.woeid;
            weatherobj.location_type__c=wp.location_type;
            insert weatherobj;
        }
        List<Weather__c> weadetail=[SELECT distance__c,woeid__c,location_type__c,latt_long__c,title__c FROM Weather__c WHERE title__c=:picval];
        return weadetail;
    }
    
}