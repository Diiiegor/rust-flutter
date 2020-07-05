import 'package:flutter/material.dart';

class MyPageview extends StatefulWidget {
  final int currentPage;
  final List<Widget> children;

  MyPageview({Key key, @required this.currentPage, @required this.children})
      : assert(currentPage != null && currentPage >= 0),
        assert(children != null && children.length >= 0),
        super(key: key);

  @override
  _MyPageviewState createState() => _MyPageviewState();
}

class _MyPageviewState extends State<MyPageview> {
  List<int> renderedTabs = [0];

  @override
  void didUpdateWidget(MyPageview oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("new page ${widget.currentPage}");
    if(!renderedTabs.contains(widget.currentPage)){
      setState(() {
        renderedTabs.add(widget.currentPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: List.generate(widget.children.length, (int index) {
        return renderedTabs.contains(index)
            ? widget.children[index]
            : Container();
      }),
      index: widget.currentPage,
    );
  }
}
