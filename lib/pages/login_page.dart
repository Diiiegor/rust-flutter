import 'package:basicodiseno/widgest/login_text_form_field.dart';
import 'package:basicodiseno/widgest/my_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/login/bloc.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc = LoginBloc();
  
  FocusNode _focusNodePassword = FocusNode();
  String _email = '', _password = '';
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _loginBloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  _submit() async {
    final bool isvalid = _formKey.currentState.validate();
    if (isvalid) {
      _loginBloc.add(LoginByPassword(context: context, email: _email, password: _password));
    }
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains('@')) {
      _email = email;
      return null;
    }
    return 'Invalid Email';
  }

  _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 4) {
      _password = password;
      return null;
    }
    return 'Invalid Password';
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final size = media.size;
    final EdgeInsets padding = media.padding;

    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height - padding.top - padding.bottom,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 60, bottom: 10),
                              child: Image.network(
                                'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
                                width: 280,
                                color: Color(0xff304ff3),
                              ),
                            ),
                            Text(
                              'Flutter UI & UX',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 330, minWidth: 200),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                LoginTextFormField(
                                  iconPath: 'assets/icons/email.svg',
                                  hintText:'example@example.com' ,
                                  labelText:'E-mail' ,
                                  initialValue:'eve.holt@reqres.in' ,
                                  onfieldSubmited: (String texto) => _focusNodePassword.nextFocus(),
                                  validator: (text) => _validateEmail(text),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                LoginTextFormField(
                                  iconPath: 'assets/icons/password.svg',
                                  hintText:'********' ,
                                  labelText:'Password' ,
                                  initialValue:'cityslicka' ,
                                  onfieldSubmited: (String pass) => _submit(),
                                  validator: (text) => _validatePassword(text),
                                  focusNode: _focusNodePassword,
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          'Olvide Mi Contraseña',
                                          style: TextStyle(
                                              color: Color(0xff304ff3)),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff304ff3)))),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                MyBtn(
                                  label: 'INGRESAR',
                                  onPresed: _submit,
                                  fullwidth: true,
                                  backgroundColor: Color(0xff304ff3),
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Text('O inicia con'),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: MyBtn(
                                        label: 'FACEBOOK',
                                        onPresed: () {},
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                        fullwidth: true,
                                        backgroundColor: Color(0xff0D47A1),
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MyBtn(
                                        label: 'GOOGLE',
                                        onPresed: () {},
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                        fullwidth: true,
                                        backgroundColor: Color(0xffC2185B),
                                        textColor: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if(state.fetching==true){
                    return Positioned.fill(
                      child: Container(
                    color: Colors.white70,
                    child: Center(
                      child: CupertinoActivityIndicator(
                        radius: 15,
                      ),
                    ),
                  ));
                  }
                  return Container();
                },
                condition: (prevState,newState)=>prevState.fetching!=newState.fetching,
              )
            ],
          ),
        ),
      ),
    );
  }
}
