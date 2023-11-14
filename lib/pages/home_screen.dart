import 'package:auto_route/annotations.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iremovebreaklines/cubit/cubit/text_cleaner_cubit.dart';
import 'package:iremovebreaklines/pages/widgets/text_card.dart';
import 'package:iremovebreaklines/utils/extensions/color_extension.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController pageController = PageController();
  final SideMenuController sideMenu = SideMenuController();

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
      backgroundColor: HexColor.fromHex('#F1F5F9'),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            // Page controller to manage a PageView
            controller: sideMenu,
            // Will shows on top of all items, it can be a logo or a Title text
            title: Text('IRB'),
            // Notify when display mode changed
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            // List of SideMenuItem to show them on SideMenu
            items: items,
            style: SideMenuStyle(
                backgroundColor: HexColor.fromHex('#F1F5F9'),
                displayMode: SideMenuDisplayMode.compact),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                BlocProvider(
                  create: (context) => TextCleanerCubit(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return TextCard(
                        textId: '1',
                      );
                    },
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
