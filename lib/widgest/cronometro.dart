import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:basicodiseno/widgest/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cronometro extends StatefulWidget {

  final double initTime,fontSize;

  Cronometro({Key key, this.initTime=0, this.fontSize=20}) : super(key: key);

  @override
  _CronometroState createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> with AfterLayoutMixin {

  double _time;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time=widget.initTime;


  }

  @override
  void dispose() {
    //cancel timer
    _stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _start(){
    _timer=Timer.periodic(Duration(seconds: 1), (Timer _ ){
      setState(() {
        _time=_time+1;
      });
    });
  }


  void _stop(){
    _timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text(_time.toString(),style: TextStyle(fontSize: widget.fontSize),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: CircleContainer(
                  child: Icon(Icons.play_arrow),
                  size: 55,
                ),
                onPressed:_start,
              ),
              CupertinoButton(
                child: CircleContainer(
                  child: Icon(Icons.stop),
                  size: 55,
                ),
                onPressed: _stop,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
//    showDialog(context: this.context,builder: (BuildContext context){
//      return AlertDialog(
//        title: Text('afterFirstLayout'),
//      );
//    });

  }

  @override
  void didUpdateWidget(Cronometro oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('old fontsized ${oldWidget.fontSize}' );
    print('new fontsized ${widget.fontSize}' );
  }

}