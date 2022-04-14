import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/widgets/menu%20page/menu_page.dart';
import 'package:flutter_mobile/widgets/summery%20page/summery_page.dart';
import 'package:flutter_mobile/widgets/table%20page/page_view.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';

class ViewMenu extends StatefulWidget {
  @override
  State<ViewMenu> createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  @override
  void initState() {
    getCount();
    super.initState();
  }

  void getCount() {}
  int _count = 0;
  int _currentIndex = 0;
  int selectedIndex = 0;
  List options = [
    MenuPage(),
    SummeryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey.shade300,
          animationDuration: Duration(milliseconds: 400),
          animationCurve: Curves.easeIn,
          items: [
            Icon(
              Icons.shopping_bag_outlined,
              color: selectedIndex == 0 ? buttonNavbar : buttonNavbar2,
            ),
            Badge(
              badgeContent: Text(cartprovider.totalItems().toString(),
                  style: TextStyle(
                    color: Colors.white,
                  )),
              child: Icon(
                Icons.summarize_outlined,
                color: selectedIndex == 1 ? buttonNavbar : buttonNavbar2,
              ),
              badgeColor: Colors.orangeAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              selectedIndex = index;
            });
          },
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: options[_currentIndex],
        ),
      );
    });
  }
}

class ViewBar extends StatefulWidget {
  const ViewBar({Key? key}) : super(key: key);

  @override
  State<ViewBar> createState() => _ViewBarState();
}

class _ViewBarState extends State<ViewBar> {
  int _currentIndex = 0;
  int selectedIndex = 0;
  List options = [
    ViewPage(),
    SummeryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: backgroundClor,
          backgroundColor: buttonNavbar2,
          animationDuration: const Duration(milliseconds: 400),
          animationCurve: Curves.easeIn,
          items: [
            Icon(
              Icons.shopping_bag_outlined,
              color: selectedIndex == 0 ? buttonNavbar : buttonNavbar2,
            ),
            Icon(
              Icons.summarize_outlined,
              color: selectedIndex == 1 ? buttonNavbar : buttonNavbar2,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              selectedIndex = index;
            });
          },
        ),
        backgroundColor: backgroundClor,
        body: Container(
          child: options[_currentIndex],
        ),
      );
    });
  }
}
