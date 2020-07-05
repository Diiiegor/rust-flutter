import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFormField extends StatelessWidget {
  final String iconPath,initialValue,hintText,labelText;
  final String Function(String) validator;
  final bool obscureText;
  final FocusNode focusNode;
  final void Function(String) onfieldSubmited;
  const LoginTextFormField(
      {Key key, @required this.iconPath, this.validator, this.onfieldSubmited, this.initialValue='', this.hintText='', this.labelText='', this.focusNode, this.obscureText=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.light,
      textInputAction: TextInputAction.next,
      focusNode: this.focusNode,
      obscureText: this.obscureText,
      initialValue: this.initialValue,//'eve.holt@reqres.in',
      decoration: InputDecoration(
          hintText: this.hintText,
          labelText: this.labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: Container(
              padding: EdgeInsets.all(10),
              width: 70,
              height: 40,
              child: SvgPicture.asset(
                this.iconPath,
                color: Colors.black54,
              ))),
      onFieldSubmitted: this.onfieldSubmited,
      validator: (text) => this.validator(text),
    );
  }
}
