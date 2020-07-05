import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show required;

abstract class LoginEvents{}

class LoginByPassword extends LoginEvents{
  final String email,password;
  final BuildContext context;

  LoginByPassword( {@required this.context,@required this.email,@required this.password});
}

class LoginByfacebook extends LoginEvents{}
class LoginByGoogle extends LoginEvents{}