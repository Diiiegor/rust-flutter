import 'package:basicodiseno/api/account_api.dart';
import 'package:basicodiseno/api/youtube_api.dart';
import 'package:basicodiseno/models/play_list.dart';
import 'package:basicodiseno/models/youtube_video.dart';
import 'package:basicodiseno/pages/home_page_widgets/home_tab_shimmer.dart';
import 'package:basicodiseno/pages/home_page_widgets/new_videos.dart';
import 'package:basicodiseno/pages/home_page_widgets/top_play_list.dart';
import 'package:basicodiseno/widgest/circle_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isEnabled = false;
  double _fontSize = 20;
  AccountApi _accountApi = AccountApi();
  List<dynamic> _users = [];
  bool _isLoading = true;
  YoutubeApi _youtubeApi=YoutubeApi(apikey: 'AIzaSyDdp_oNUraXB59nR8qRUWxSZ2gewwfPR8k');
  List<PlayList> _playLists=[];
  List<YoutubeVideo> _newVideos=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  _load() async {
    final users = await _accountApi.getUsers(1);
    final playLists= await _youtubeApi.getplayLists(chanelId: 'UCj-wTLj0p0YvTkS-9-ACm0A');
    final  newVideos = await _youtubeApi.getNewVideos(chanelId: 'UCj-wTLj0p0YvTkS-9-ACm0A');
    setState(() {
      _users.addAll(users);
      _playLists.addAll(playLists);
      _newVideos.addAll(newVideos);
      _isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _isLoading
            ? HomeTabShimmer()
            : Column(
              children: <Widget>[
                Container(
                height: 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final dynamic item = _users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 80),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ClipOval(
                                child: CachedNetworkImage(
                                    imageUrl: item['avatar'],
                                    placeholder: (_,__)=>Center(child: CupertinoActivityIndicator(radius: 15,),),
                                    ),
                              ),
                            ),
                            Text(item['first_name'])
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _users.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              TopPlayList(items: _playLists),
              SizedBox( height: 10,),
              NewVideos(items: _newVideos,)
              ],
            )
      ],
    );
  }
}
