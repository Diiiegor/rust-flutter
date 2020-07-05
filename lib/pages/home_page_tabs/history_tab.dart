import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    print('Hisory tab');
    return AspectRatio(aspectRatio: 7/4,child: Container(
      color:Colors.red,
      child: Image.network('https://images7.alphacoders.com/980/thumb-1920-980709.png'),
    ),);
  }
}
