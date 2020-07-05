import 'package:basicodiseno/models/youtube_video.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class YoutubeVideoItem extends StatelessWidget {
  final YoutubeVideo item;
  const YoutubeVideoItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: AspectRatio(
          aspectRatio: 12 / 3,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: item.banner,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            item.description,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
          ),
        ),
        onPressed: () {
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: "AIzaSyDdp_oNUraXB59nR8qRUWxSZ2gewwfPR8k",
              videoUrl: "https://www.youtube.com/watch?v=${item.videoId}",
              autoPlay: true, //default falase
              fullScreen: true //default false
              );
        });
  }
}
