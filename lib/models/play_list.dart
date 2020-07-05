import 'package:meta/meta.dart' show required;

class PlayList {
  final String id, title, description, banner;
  final int itemCount;
  final DateTime publishedAt;

  PlayList(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.banner,
      @required this.itemCount,
      @required this.publishedAt});

  static PlayList fromjson(Map<String, dynamic> json) {

    final snippet=json['snippet'];
    final thumbnail = snippet['thumbnails']['standard']??snippet['thumbnails']['high'];
    return PlayList(
        id: json['id'],
        title: snippet['title'],
        description: snippet['description'],
        banner: thumbnail['url'],
        itemCount: json['contentDetails']['itemCount'],
        publishedAt: DateTime.parse(snippet['publishedAt']));
  }
}
