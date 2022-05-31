import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/productProvider.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
import 'package:flutter_mobile/widgets/menuPage/categoryProduct/category_product.dart';
import 'package:flutter_mobile/widgets/menuPage/productCard/productCard.dart';
import 'package:flutter_mobile/widgets/setting/logout.dart';
import 'package:flutter_mobile/widgets/tablePage/beforeOrderTab/page_view.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class MenuGrid extends StatefulWidget {
  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  TextEditingController searchController = TextEditingController();
  bool isActiveBotton = false;
  bool buttonPressed = false;
  var loading = false;

  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          loading = false;
        });
      });
      loading = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProviders productProviders = Provider.of<ProductProviders>(context);

    onSearchTextChanged(String text) async {
      productProviders.search.clear();
      if (text.isEmpty) {
        setState(() {});
        return;
      }

      productProviders.products.forEach((data) {
        if (data.nameProduct.toLowerCase().contains(text) ||
            data.idoutlet.toString().contains(text))
          productProviders.search.add(data);
      });
      setState(() {});
    }

    Widget buttonCategory() {
      return Stack(
        children: [
          Material(
            elevation: 4,
            child: Stack(
              children: [
                Container(
                  height: SizeConfig.blockVertical * 10,
                  width: SizeConfig.blockHorizontal * 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      CatgeoryProduct(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget viewMenuProduct() {
      return Column(
        children: [
          Container(
            color: backgroundClor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Search Product Name...',
                        border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      searchController.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("View : "),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewMenuList()));
                  },
                  icon: Icon(
                    Icons.list,
                    color: buttonNavbar,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewMenuGrid()));
                  },
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: buttonNavbar,
                    size: 30,
                  )),
            ],
          ),
        ],
      );
    }

    Widget menuGrid() {
      return Container(
          height: 63.h,
          width: SizeConfig.blockHorizontal * 100,
          color: Colors.white,
          child: productProviders.search.length != 0 ||
                  searchController.text.toLowerCase().isNotEmpty
              ? GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  padding: const EdgeInsets.all(2),
                  childAspectRatio: 1,
                  children: productProviders.search
                      .map((product) => ProductCard(product))
                      .toList(),
                )
              : loading
                  ? Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      padding: const EdgeInsets.all(2),
                      childAspectRatio: 1,
                      children: productProviders.products
                          .map((product) => ProductCard(product))
                          .toList(),
                    ));
    }

    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 23),
            child: Image.asset('images/qoligo_white.png',
                width: SizeConfig.blockHorizontal * 22,
                height: SizeConfig.blockVertical * 22),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewPage()));
            },
            icon: const Icon(Icons.chevron_left, size: 40, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogOut()));
                },
                icon: Icon(Icons.settings, color: Colors.white))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            buttonCategory(),
            SizedBox(height: SizeConfig.blockVertical * 2),
            viewMenuProduct(),
            SizedBox(height: SizeConfig.blockVertical * 2),
            menuGrid(),
          ]),
        ),
      );
    });
  }
}
