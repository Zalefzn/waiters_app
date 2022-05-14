import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/methodSize/method.dart';
import 'package:flutter_mobile/method/methodStyle/theme.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:flutter_mobile/widgets/menuPage/menu_grid.dart';
import 'package:flutter_mobile/widgets/menuPage/menu_list.dart';
import 'package:flutter_mobile/widgets/summaryPage/summery_page.dart';
import 'package:flutter_mobile/widgets/tablePage/page_view.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

//navigation navbar menu view
class ViewMenuGrid extends StatefulWidget {
  @override
  State<ViewMenuGrid> createState() => _ViewMenuGridState();
}

class _ViewMenuGridState extends State<ViewMenuGrid> {
  @override
  void initState() {
    getCount();
    super.initState();
  }

  void getCount() {}
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: buttonNavbar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              title: Text("Order"),
            ),
            BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text(cartprovider.totalItems().toString(),
                    style: TextStyle(
                      color: Colors.white,
                    )),
                child: Icon(
                  Icons.summarize_outlined,
                ),
                badgeColor: Colors.orangeAccent,
              ),
              title: Text("Summary"),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
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

class ViewMenuList extends StatefulWidget {
  @override
  State<ViewMenuList> createState() => _ViewMenuListState();
}

class _ViewMenuListState extends State<ViewMenuList> {
  @override
  void initState() {
    getCount();
    super.initState();
  }

  void getCount() {}
  int _currentIndex = 0;
  int selectedIndex = 0;
  List options = [
    MenuList(),
    SummeryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    CartProvider cartprovider = Provider.of<CartProvider>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: buttonNavbar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              title: Text("Order"),
            ),
            BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text(cartprovider.totalItems().toString(),
                    style: TextStyle(
                      color: Colors.white,
                    )),
                child: Icon(
                  Icons.summarize_outlined,
                ),
                badgeColor: Colors.orangeAccent,
              ),
              title: Text("Summary"),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
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

// //navigation navbar view table
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: buttonNavbar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              title: Text("Order"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.summarize_outlined,
              ),
              title: Text("Summary"),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
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
