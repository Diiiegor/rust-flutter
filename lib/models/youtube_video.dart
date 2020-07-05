import 'package:meta/meta.dart' show required;

class YoutubeVideo {
  final String videoId, title, description, banner;

  YoutubeVideo(
      {@required this.videoId,
      @required this.title,
      @required this.description,
      @required this.banner});

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnail =
        snippet['thumbnails']['standard'] ?? snippet['thumbnails']['high'];
    return YoutubeVideo(
        videoId: json['contentDetails']['upload']['videoId'],
        title: snippet['title'],
        description: snippet['description'],
        banner: thumbnail['url']);
  }
}
