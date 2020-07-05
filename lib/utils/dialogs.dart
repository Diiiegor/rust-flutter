import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String title,
    String body,
    String okText = 'Aceptar',
  }) async {
    Completer<void> c = Completer();
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: body != null ? Text(body) : null,
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(okText),
                onPressed: () {
                  Navigator.pop(context);
                  c.complete();
                },
              )
            ],
          );
        });
    return c.future;
  }

  static Future<bool> confirm(
    BuildContext context, {
    String title,
    String body,
    String confirmText = 'Aceptar',
    String canceltext = 'Cancelar',
  }) async {
    final Completer<bool> c = Completer();

    showCupertinoModalPopup(
        context: context,

        builder: (_) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            child: CupertinoActionSheet(
              title: title != null ? Text(title,style: TextStyle(color: Colors.black,fontSize: 20),) : null,
              message: body != null ? Text(body,style: TextStyle(fontSize: 16),) : null,
              cancelButton: CupertinoActionSheetAction(
                  child: Text(
                    canceltext,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    c.complete(false);
                  }),
              actions: <Widget>[
                CupertinoActionSheetAction(
                    child: Text(
                      confirmText,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      c.complete(true);
                    }),
              ],
            ),
          );
        });

    return c.future;
  }


  static void input( BuildContext context,{String label,String placeholder,@required Function(String) onOk}){

    String text='';

    showCupertinoDialog(context: context, builder: ( _ ){
      return CupertinoAlertDialog(
        title: label!=null?Text(label):null,
        content: CupertinoTextField(
          placeholder: placeholder,
          onChanged: (_texto){
            text=_texto;
          },
        ),
        actions: <Widget>[
          CupertinoButton(
            child: Text('Aceptar'),
            onPressed:(){
               onOk( text );
               Navigator.pop(context);
            },
          )
        ],
      );
    });

  }


  static void inputEmail( BuildContext context,{String label,String placeholder,@required Function(String) onOk}){

    //String text='';

    showCupertinoDialog(context: context, builder: ( _ ){
      return CupertinoAlertDialog(
        title: label!=null?Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(label),
        ):null,
        content: InputEmail( placeholder: placeholder,onOk: (texto){
          if( onOk!=null){
            onOk(texto);
          }
        },),
      );
    });

  }

}

class InputEmail extends StatefulWidget {
  final String placeholder;
  void Function(String) onOk;
  InputEmail({Key key, this.placeholder,@required this.onOk}) : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {

  String _email='';

  bool _validate(){
    return _email.contains('@');
  }

  @override
  Widget build(BuildContext context) {

    final isvalid=_validate();

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          
          CupertinoTextField(
            placeholder: widget.placeholder,
            onChanged: (String text){
              _email=text;
              _validate();
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: FlatButton(onPressed:()=>Navigator.pop(context), child: Text('Cancelar',style: TextStyle(color: Colors.red),))),
              Expanded(child: FlatButton(onPressed: isvalid?(){
                Navigator.pop(context);
                widget.onOk(_email);
              }:null, child: Text('Aceptar',style: TextStyle(color: isvalid? Colors.blue:Colors.black45),)))
            ],
          )
        ],
      ),
    );
  }
}
