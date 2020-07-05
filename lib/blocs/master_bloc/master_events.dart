import 'package:basicodiseno/models/youtube_video.dart';

abstract class MasterEvents {}

class MasterSetTab extends MasterEvents{
  final int tab;

  MasterSetTab(this.tab);
}

class MasterAddHistory extends MasterEvents{
  final YoutubeVideo youtubeVideo;

  MasterAddHistory(this.youtubeVideo);
}