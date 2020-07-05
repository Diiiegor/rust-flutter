import 'dart:io';

import 'package:basicodiseno/widgest/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  final double size;

  const Avatar({Key key, this.size=150}) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  File _file;
  _pickImage() async {
   final File file=await  ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     _file=file;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: <Widget>[
          _file==null?
          SvgPicture.asset(
              'assets/icons/avatar.svg'):ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.file(_file,width: 200,height: 200,fit: BoxFit.cover,),
          ),
          Positioned(
            child: CupertinoButton(
              child: CircleContainer(
                child: Icon(Icons.edit),
                size: 60,
              ),
              padding: EdgeInsets.zero,
              onPressed: _pickImage,
              minSize: 30,
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
