import 'package:basicodiseno/models/youtube_video.dart';
import 'package:basicodiseno/widgest/youtube_video_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewVideos extends StatelessWidget {
  final List<YoutubeVideo> items;

  const NewVideos({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return YoutubeVideoItem(item:item);
      }),
    );
  }
}
