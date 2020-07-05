import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final double size;

  const CircleContainer(
      {Key key,
      @required this.child,
      @required this.size,})
      : assert(child != null),
        assert(size != null && size >= 50),
        super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Center(child: this.child),
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          color: Color(0xfff0f0f0f0),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(5, 5)),
          ]),
    );
  }
}
