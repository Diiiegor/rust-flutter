import 'dart:convert';

import 'package:basicodiseno/models/play_list.dart';
import 'package:basicodiseno/models/youtube_video.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
class YoutubeApi{

  final String apikey;

  YoutubeApi({@required this.apikey}):assert(apikey!=null);

  String _getUrl(String endpoint,Map<String,String> queryParameters){
    final uri=Uri(
      host: 'www.googleapis.com',
      scheme: 'https',
      path: '/youtube/v3/$endpoint',
      queryParameters: queryParameters
    );
    return uri.toString();
  }

  Future<List<PlayList>> getplayLists({String chanelId='UCj-wTLj0p0YvTkS-9-ACm0A'}) async {
    final String part='snippet';
    try{
      String url=_getUrl('playlists',{
        'part':'snippet,contentDetails',
        'channelId':chanelId,
        'key':this.apikey
      });
      final response= await http.get(url);
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body);
       final List<PlayList> items= (parsed['items'] as List).map<PlayList>((item)=>PlayList.fromjson(item)).toList();
       return items;
      }
      return [];
    }
    catch( e ){
      print(e);
      return [];
    }

  }

  Future<List<YoutubeVideo>> getNewVideos({String chanelId='UCj-wTLj0p0YvTkS-9-ACm0A'}) async {
    try{
      String url=_getUrl('activities',{
        'part':'snippet,contentDetails',
        'channelId':chanelId,
        'maxResults':'20',
        'key':this.apikey
      });
      final response= await http.get(url);
      if(response.statusCode==200){
        print(response.body);
        final parsed=jsonDecode(response.body);
        final List<YoutubeVideo> items=(parsed['items'] as List).map<YoutubeVideo>((item)=>YoutubeVideo.fromJson(item)).toList();
        return items;
      }
      return [];
    }
    catch( e ){
      print(e);
      return [];
    }

  }

}