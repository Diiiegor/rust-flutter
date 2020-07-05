import 'package:basicodiseno/widgest/my_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesPageArgs {
  final String username;
  final bool isactive;

  ImagesPageArgs({@required this.username, @required this.isactive});
}

class ImagesPage extends StatefulWidget {
  static final routeName = 'images';

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/860/860790.svg',
                rightIcon:
                    'https://image.flaticon.com/icons/svg/2462/2462719.svg',
                onleftClick: () => Navigator.pop(context),
                onrightClick: () {},
              ),
              //El expanded debe tener el resto del contenido de la pnatalla
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,crossAxisSpacing: 10,mainAxisSpacing: 10),
                  itemCount: 100,
                  itemBuilder: (_, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.black12,
                      child: Text('${index + 1}'),
                    );
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
