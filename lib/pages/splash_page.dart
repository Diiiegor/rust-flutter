import 'package:after_layout/after_layout.dart';
import 'package:basicodiseno/pages/home_page.dart';
import 'package:basicodiseno/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {


  _checkLogin() async {
      SharedPreferences prefs = await  SharedPreferences.getInstance();
      final bool wasLogin=prefs.getBool('wasLogin');
      print(wasLogin);
      if(wasLogin == null || wasLogin == false){
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
      child: CupertinoActivityIndicator( radius: 15,),
    ),);
  }

  @override
  void afterFirstLayout(BuildContext context) {
  Future.delayed(Duration(seconds: 2)).then((_){
      _checkLogin();
    });
  }

}