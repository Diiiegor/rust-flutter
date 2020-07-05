import 'package:basicodiseno/models/youtube_video.dart';
import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart';

class MasterState extends Equatable{

  final int currentTab;
  final List<YoutubeVideo> history;

  MasterState({@required this.currentTab,@required  this.history});

  static MasterState initialState()=>MasterState(currentTab: 0,history: []);

  @override
  // TODO: implement props
  List<Object> get props => [currentTab,history];

}