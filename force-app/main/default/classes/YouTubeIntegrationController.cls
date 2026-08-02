public with sharing class YouTubeIntegrationController {

    @AuraEnabled
    public static List<VideoWrapper> searchVideos(String keyword){

        YouTube_Config__mdt config =
    YouTube_Config__mdt.getInstance('Default');

if(config == null || String.isBlank(config.Api_Key__c)){
    throw new AuraHandledException('YouTube API Key is not configured.');
}

String apiKey = config.Api_Key__c;

        HttpRequest req = new HttpRequest();

        req.setMethod('GET');

        

       req.setEndpoint(
    'callout:YouTube_API/youtube/v3/search'
    + '?part=snippet'
    + '&type=video'
    + '&maxResults=10'
    + '&q=' + EncodingUtil.urlEncode(keyword,'UTF-8')
    + '&key=' + EncodingUtil.urlEncode(apiKey,'UTF-8')
);

        Http http = new Http();

        HttpResponse res = http.send(req);
        System.debug('Response Body = ' + res.getBody());

        List<VideoWrapper> videos = new List<VideoWrapper>();

        if(res.getStatusCode()==200){

            Map<String,Object> response =
                (Map<String,Object>)JSON.deserializeUntyped(res.getBody());

            List<Object> items =
                (List<Object>)response.get('items');

            for(Object obj : items){

                Map<String,Object> item =
                    (Map<String,Object>)obj;

                Map<String,Object> id =
                    (Map<String,Object>)item.get('id');

                Map<String,Object> snippet =
                    (Map<String,Object>)item.get('snippet');
                Map<String,Object> thumbnails =
                    (Map<String,Object>)snippet.get('thumbnails');
                     System.debug('Thumbnail Object: ' + thumbnails);
                   

                Map<String,Object> medium =
                    (Map<String,Object>)thumbnails.get('medium');


    // ===========================
    // ADD THESE DEBUG STATEMENTS
    // ===========================

    System.debug('Thumbnails = ' + thumbnails);
    System.debug('Medium = ' + medium);
    System.debug('Thumbnail URL = ' + medium.get('url'));

    // ===========================

                VideoWrapper v = new VideoWrapper();

                v.videoId = (String)id.get('videoId');
                v.title = (String)snippet.get('title');
                v.description = (String)snippet.get('description');
                v.channelTitle = (String)snippet.get('channelTitle');
                v.thumbnail = (String)medium.get('url');
                System.debug('Assigned Thumbnail = ' + v.thumbnail);
                v.publishedDate = (String)snippet.get('publishedAt');

                videos.add(v);
            }

        }

        return videos;
    }


    public class VideoWrapper{

        @AuraEnabled public String videoId;
        @AuraEnabled public String title;
        @AuraEnabled public String description;
        @AuraEnabled public String thumbnail;
        @AuraEnabled public String channelTitle;
        @AuraEnabled public String publishedDate;
        
    }
}