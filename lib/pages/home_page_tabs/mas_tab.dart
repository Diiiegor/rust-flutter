import 'package:basicodiseno/pages/login_page.dart';
import 'package:basicodiseno/utils/dialogs.dart';
import 'package:basicodiseno/widgest/avatar.dart';
import 'package:basicodiseno/widgest/left_right_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasTab extends StatefulWidget {
  @override
  _MasTabState createState() => _MasTabState();
}

class _MasTabState extends State<MasTab> {
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  _confirm() async {
   final isok= await Dialogs.confirm(context,body: 'Esta seguro de que desea salir de su cuenta?',title: 'Accion Requerida');
   print('Is ok $isok');
   if(isok){
     _logOut();
   }
  }

  _setEmail(){
    Dialogs.inputEmail(context, onOk: (String text){
      print('Input dialog: $text');
    },label: 'Ingrese un email',placeholder: 'example@domail.com');
  }

  @override
  Widget build(BuildContext context) {
    print('Mas tab');
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xfff8f8f8),
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Avatar(
                    size: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Bienvenido'),
                  Text(
                    'Juan oliveros',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            LeftRightIconButton(
              label: 'Email',
              leftIcon: 'assets/icons/email.svg',
              onPressed: _setEmail,
              rightContent: Text('Diiegooliveros@gmail.com',style: TextStyle(color: Color(0xffaaaaaa)),),
            ),
            LeftRightIconButton(
              label: 'Configuraciones de privacidad',
              leftIcon: 'assets/icons/security.svg',
              onPressed: _confirm,
              rightContent: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20,),
            ),
            LeftRightIconButton(
              label: 'Notificaciones Push',
              leftIcon: 'assets/icons/bell.svg',
              onPressed: _confirm,
              rightContent: Text('ACTIVADO',style: TextStyle(color: Color(0xffaaaaaa),letterSpacing: 0.5)),
            ),
            LeftRightIconButton(
              label: 'Cerrar Sesion',
              leftIcon: 'assets/icons/logout.svg',
              onPressed: _confirm,
            )
          ],
        ),
      ),
    );
  }
}
