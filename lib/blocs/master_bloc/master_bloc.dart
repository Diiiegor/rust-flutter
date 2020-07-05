import 'package:bloc/bloc.dart';
import 'master_events.dart';
import 'master_state.dart';

class MasterBloc extends Bloc<MasterEvents,MasterState>{





  @override
  // TODO: implement initialState
  MasterState get initialState => MasterState.initialState();

  @override
  Stream<MasterState> mapEventToState(MasterEvents event) async* {
    
      

  }
}