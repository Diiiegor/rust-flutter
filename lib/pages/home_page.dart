import 'package:basicodiseno/pages/home_page_tabs/history_tab.dart';
import 'package:basicodiseno/pages/home_page_tabs/home_tab.dart';
import 'package:basicodiseno/pages/home_page_tabs/mas_tab.dart';
import 'package:basicodiseno/pages/home_page_tabs/ofertas_tab.dart';
import 'package:basicodiseno/widgest/buttom_menu.dart';
import 'package:basicodiseno/widgest/my_appbar.dart';
import 'package:basicodiseno/widgest/my_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'chat_page.dart';
import 'images_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      BottomMenuItem(
          iconpath: 'assets/icons/home.svg',
          label: 'Inicio',
          content: HomeTab()),
      BottomMenuItem(
          iconpath: 'assets/icons/history.svg',
          label: 'Historial',
          content: HistoryTab()),
      BottomMenuItem(
          iconpath: 'assets/icons/ofertas.svg',
          label: 'Ofertas',
          content: OfertasTab()),
      BottomMenuItem(
          iconpath: 'assets/icons/open-menu.svg',
          label: 'Mas',
          content: MasTab()),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MyAppbar(
              leftIcon: 'https://image.flaticon.com/icons/svg/685/685662.svg',
              rightIcon:
                  'https://image.flaticon.com/icons/svg/2462/2462719.svg',
              onleftClick: () {
                Navigator.pushNamed(context, ImagesPage.routeName,
                    arguments:
                        ImagesPageArgs(username: 'Diego Rios', isactive: true));
              },
              onrightClick: () {
                final route = MaterialPageRoute(
                    builder: (BuildContext _) => ChatPage(
                          userName: 'Diego Rios',
                        ));
                Navigator.push(context, route);
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: MyPageview(
                  children:
                      menuItems.map<Widget>((item) => item.content).toList(),
                  currentPage: _currentPage,
                ),
              ),
            )
          ],
        ),
        top: true,
      ),
      bottomNavigationBar: ButtomMenu(
        currentPage: this._currentPage,
        onchanged: (int newCurrentPage) {
          setState(() {
            _currentPage = newCurrentPage;
          });
        },
        items: menuItems,
      ),
    );
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
