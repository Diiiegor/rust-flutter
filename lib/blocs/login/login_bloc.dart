import 'package:basicodiseno/api/account_api.dart';
import 'package:basicodiseno/pages/home_page.dart';
import 'package:basicodiseno/utils/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_events.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  AccountApi _accountApi = AccountApi();
  @override
  // TODO: implement initialState
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginByPassword) {
      yield* _submitByPassword(event);
    } else if (event is LoginByGoogle) {
    } else if (event is LoginByfacebook) {}
  }

  Stream<LoginState> _submitByPassword(LoginByPassword event) async*{
    yield this.state.copyWith(fetching: true);

      bool isok = await _accountApi.login(event.email, event.password);
      if (isok) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('wasLogin', true);
        Navigator.pushReplacementNamed(event.context, HomePage.routeName);
      } else {
        final intents=this.state.intents+1;
        yield this.state.copyWith(fetching: false,intents:intents==3?0:intents );
        await Dialogs.alert(event.context,
            title: 'Error', body: intents==3?"Se ha enviado una alerta al email ${event.email}" :'Email o contraseña incorrectos');
      }
  }

}
