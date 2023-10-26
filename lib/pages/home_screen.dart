import 'package:auto_route/annotations.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  // https://pub.dev/packages/easy_sidemenu
  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
        title: 'Dashboard',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.home),
        badgeContent: Text(
          '3',
          style: TextStyle(color: Colors.white),
        ),
      ),
      SideMenuItem(
        title: 'Settings',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.settings),
      ),
      SideMenuItem(
        title: 'Exit',
        onTap: (_, _a) {},
        icon: Icon(Icons.exit_to_app),
      ),
    ];
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            // Page controller to manage a PageView
            controller: sideMenu,
            // Will shows on top of all items, it can be a logo or a Title text
            title: Text('IRB'),
            // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            footer: Text('demo'),
            // Notify when display mode changed
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            // List of SideMenuItem to show them on SideMenu
            items: items,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  child: Center(
                    child: Text('Dashboard'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Settings'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
