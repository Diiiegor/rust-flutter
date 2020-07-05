import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenuItem {
  final String iconpath, label;
  final Widget content;

  BottomMenuItem({@required this.iconpath, @required this.label, @required this.content});
}

class ButtomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;
  final int currentPage;
  final void Function( int ) onchanged;

  const ButtomMenu({Key key, @required this.items, @required this.currentPage, this.onchanged})
      : assert(items != null && items.length > 0),
        assert(currentPage != null && currentPage >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final BottomMenuItem item = items[index];
            final bool isactive=index==currentPage;
            return Expanded(
              child: Container(
                child: CupertinoButton(
                  onPressed: () =>onchanged(index),
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        item.iconpath,
                        width: 30,
                        color:isactive? Colors.blue:Colors.black,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(item.label,
                          style: TextStyle(fontSize: 10, color:isactive? Colors.blue:Colors.black))
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
