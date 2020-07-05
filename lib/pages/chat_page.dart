import 'package:basicodiseno/widgest/my_appbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  final String userName;

  const ChatPage({Key key, @required this.userName}) :assert(userName!=null), super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/860/860790.svg',
                rightIcon: 'https://image.flaticon.com/icons/svg/2462/2462719.svg',
                onleftClick: () =>Navigator.pop(context),
                onrightClick: () {},
              ),
             //El expanded debe tener el resto del contenido de la pnatalla
              Expanded( child: Center( child: Text(widget.userName),),)
            ],
          ),
        ),
      ),
    );
  }
}
