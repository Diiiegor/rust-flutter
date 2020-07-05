import 'package:basicodiseno/widgest/my_appbar.dart';
import 'package:flutter/material.dart';
import '../utils/fake_list.dart';

class PostPage extends StatefulWidget {
  static final routeName = 'post';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<String> _data=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                onrightClick: (){
                  setState(() {
                    _data.length>0? _data.insert(_data.length-1,'Item insert ${DateTime.now().toString()}'):_data.add('Item add ${DateTime.now().toString()}');
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      final String item = _data[index];
                      return ListTile(
                        title: Text(item),
                        subtitle: Text('Subtitulo'),
                        leading: Icon( Icons.watch),
                        onTap: (){},
                        onLongPress: (){
                          _data.removeAt(index);
                          setState(() {

                          });
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
