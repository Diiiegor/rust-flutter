import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool fetching; //estado de consumo del api para iniciar sesion
  final int
      intents; //Estado de la cantidad de intentos fallidos para iniciar sesion

  LoginState({this.fetching=false, this.intents=0});

  @override
  // TODO: implement props
  List<Object> get props => [fetching, intents];

  LoginState copyWith({bool fetching, int intents}) {
    return LoginState(
        fetching: fetching ?? this.fetching, intents: intents ?? this.intents);
  }
}
