import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/validation/method%20style/theme.dart';
import 'package:flutter_mobile/widgets/menu%20page/menu_grid.dart';
import 'package:flutter_mobile/widgets/menu%20page/product_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MenuList extends StatefulWidget {
  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
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
    getCategory();
    getProducts();
    super.initState();
  }

  getCategory() async {
    await Provider.of<ProductCategorys>(context, listen: false).getCategory();
  }

  getProducts() async {
    await Provider.of<ProductProviders>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    ProductCategorys category = Provider.of<ProductCategorys>(context);
    ProductProviders productProviders = Provider.of<ProductProviders>(context);

    // ignore: unused_element
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
                  context, MaterialPageRoute(builder: (context) => LogOut()));
            },
            icon: const Icon(Icons.settings),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
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
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 2.5,
                                      top: SizeConfig.blockVertical * 2),
                                  height: SizeConfig.blockVertical * 6,
                                  width: SizeConfig.blockHorizontal * 95,
                                  child: ElevatedButton(
                                    child: Text(
                                      'All Items                                                             >',
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      //category product
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(45),
                                              topRight: Radius.circular(45),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          enableDrag: true,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height:
                                                  SizeConfig.blockVertical * 87,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          45)),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        top: SizeConfig
                                                                .blockVertical *
                                                            2,
                                                      ),
                                                      height: SizeConfig
                                                              .blockVertical *
                                                          1,
                                                      width: SizeConfig
                                                              .blockHorizontal *
                                                          40,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockVertical *
                                                              2),
                                                      child: Text(
                                                        'Armor Kopi Leuwit - Best Seller',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 15.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: SizeConfig
                                                                    .blockVertical *
                                                                2,
                                                            left: SizeConfig.blockHorizontal *
                                                                0),
                                                        height: SizeConfig
                                                                .blockVertical *
                                                            75,
                                                        width: SizeConfig
                                                                .blockHorizontal *
                                                            90,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: ListView.builder(
                                                            itemCount: category
                                                                .categorys
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    int index) {
                                                              final a = category
                                                                      .categorys[
                                                                  index];
                                                              return GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              MenuPage()));
                                                                  productProviders
                                                                      .products
                                                                      .where((product) =>
                                                                          ProductCard(product)
                                                                              .product
                                                                              .idProCategory ==
                                                                          category
                                                                              .categorys[index]
                                                                              .idCategory)
                                                                      .toList();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .blockVertical *
                                                                          2),
                                                                  height: SizeConfig
                                                                          .blockVertical *
                                                                      10,
                                                                  width: SizeConfig
                                                                          .blockHorizontal *
                                                                      80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: buttonPressed
                                                                              ? buttonColor
                                                                              : textColor2,
                                                                          border: Border
                                                                              .all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      a.categoryName,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }) //GridView.count(

                                                        ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Column(
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
                                  builder: (context) => MenuList()));
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
                                  builder: (context) => ViewMenu()));
                        },
                        icon: Icon(
                          Icons.grid_view_rounded,
                          color: buttonNavbar,
                          size: 30,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Container(
                height: 63.h,
                width: SizeConfig.blockHorizontal * 100,
                color: Colors.white,
                child: productProviders.search.length != 0 ||
                        searchController.text.toLowerCase().isNotEmpty
                    ? ListView.builder(
                        itemCount: productProviders.search.length,
                        itemBuilder: (context, h) {
                          final a = productProviders.search[h];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: SizeConfig.blockVertical * 7,
                                width: SizeConfig.blockHorizontal * 95,
                                decoration: BoxDecoration(
                                    color: backgroundClor,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 0.8,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      a.nameProduct,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    Text(
                                      a.hargaProduct,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })
                    : loading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: productProviders.products.length,
                            itemBuilder: (context, b) {
                              final i = productProviders.products[b];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: SizeConfig.blockVertical * 7,
                                    width: SizeConfig.blockHorizontal * 95,
                                    decoration: BoxDecoration(
                                        color: backgroundClor,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                          width: 0.8,
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            i.nameProduct,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            i.hargaProduct,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            })
                // : GridView.count(
                //     crossAxisCount: 2,
                //     mainAxisSpacing: 2,
                //     crossAxisSpacing: 1,
                //     padding: const EdgeInsets.all(6),
                //     childAspectRatio: 1,
                //     children: productProviders.products
                //         .map((product) => ProductCard(product))
                //         .toList(),
                //   )),
                ),
          ]),
        ),
      );
    });
  }
}

class ProductCard extends StatefulWidget {
  DataProduct product;
  ProductCard(this.product);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(widget.product)));
          },
          child: Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 3,
                top: SizeConfig.blockVertical * 2),
            height: SizeConfig.blockVertical * 25,
            width: SizeConfig.blockHorizontal * 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.product.nameProduct,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
                Text(
                  widget.product.hargaProduct.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
