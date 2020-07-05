import 'package:basicodiseno/blocs/master_bloc/master_bloc.dart';
import 'package:basicodiseno/pages/home_page.dart';
import 'package:basicodiseno/pages/images_page.dart';
import 'package:basicodiseno/pages/login_page.dart';
import 'package:basicodiseno/pages/post_page.dart';
import 'package:basicodiseno/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    // TODO: implement build
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>MasterBloc())
    ], child: GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: GestureDetector(
        onTap: (){
          final FocusScopeNode currentFocus= FocusScope.of(context);
          currentFocus.unfocus();
        },
        child: MaterialApp(
          home: SplashPage(),
          debugShowCheckedModeBanner: false,
          routes: {
            ImagesPage.routeName: (BuildContext context) => ImagesPage(),
            HomePage.routeName: (BuildContext context) => HomePage(),
            PostPage.routeName: (BuildContext context) => PostPage(),
            LoginPage.routeName: (BuildContext context) => LoginPage(),
          },
          theme: ThemeData(fontFamily: 'Roboto'),
        ),
      ),
    ));
  }
}
