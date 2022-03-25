import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/widgets/product_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_mobile/api/api_service.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // List<DataProduct> dataProduct = [];

  TextEditingController searchController = TextEditingController();
  bool isActiveBotton = false;
  bool buttonPressed = false;

  @override
  void initState() {
    getCategory();
    getProducts();
    // DataService.getDataPro().then((value) {
    //   setState(() {
    //     dataProduct = value;
    //   });
    // });

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
    ProductProviders productProviders = Provider.of<ProductProviders>(context);
    ProductCategorys category = Provider.of<ProductCategorys>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
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
                                      'List Menu                                                                   >',
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
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
                                                  SizeConfig.blockVertical * 90,
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
                                                            80,
                                                        width: SizeConfig
                                                                .blockHorizontal *
                                                            100,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: ListView.builder(
                                                            itemCount: 1,
                                                            itemBuilder:
                                                                (context,
                                                                    int index) {
                                                              return Container(
                                                                height: SizeConfig
                                                                        .blockVertical *
                                                                    80,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Column(
                                                                  children: category
                                                                      .categorys
                                                                      .map((category) =>
                                                                          CategoryPage(
                                                                              category))
                                                                      .toList(),
                                                                ),
                                                              );
                                                            }) //GridView.count(
                                                        //crossAxisCount: 2,
                                                        //mainAxisSpacing: 2,
                                                        //crossAxisSpacing: 3,
                                                        //padding:
                                                        //EdgeInsets.all(6),
                                                        //childAspectRatio: 1,
                                                        //children: categorys
                                                        //.categorys
                                                        //.map((category) =>
                                                        //CategoryPage(
                                                        //category))
                                                        //.toList(),
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                  height: SizeConfig.blockVertical * 10,
                  width: SizeConfig.blockHorizontal * 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        controller: searchController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: 'Search Product ...',
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: SizeConfig.blockVertical * 54,
              width: SizeConfig.blockHorizontal * 100,
              color: Colors.white,
              // child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 2,
              //       crossAxisSpacing: 1,
              //       childAspectRatio: 1,
              //     ),
              //     // itemCount: //dataProduct.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         child: Column(children: [
              //           Text(dataProduct[index].nameProduct),
              //         ]),
              //       );
              //     })
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 1,
                padding: const EdgeInsets.all(6),
                childAspectRatio: 1,
                children: productProviders.products
                    .map((product) => ProductCard(product))
                    .toList(),
              ),
            ),
          ]),
        ),
      );
    });
  }
}

class ProductCard extends StatelessWidget {
  final DataProduct product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage(product)));
          },
          child: Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 3,
                top: SizeConfig.blockVertical * 2),
            height: SizeConfig.blockVertical * 34,
            width: SizeConfig.blockHorizontal * 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.blockVertical * 1),
                Image.network(product.gambarUrl,
                    height: 100, width: 130, fit: BoxFit.fill),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          product.nameProduct,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1),
                      Center(
                        child: Text(
                          product.hargaProduct,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryPage extends StatefulWidget {
  final ProductCategory category;
  CategoryPage(this.category);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<DataProduct> dataProduct = [];
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.category.categoryName.contains("Extra")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          //  Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => ViewMenu()));
        } else if (widget.category.categoryName.contains("Meal")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => ViewMenu()));
        } else if (widget.category.categoryName.contains("Non-Coffe")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => ViewMenu()));
        } else if (widget.category.categoryName.contains("Coffe")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ViewMenu()));
        } else if (widget.category.categoryName.contains("Food")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ViewMenu()));
        } else if (widget.category.categoryName.contains("Dessert")) {
          setState(() {
            buttonPressed = !buttonPressed;
          });
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ViewMenu()));
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
        height: SizeConfig.blockVertical * 10,
        width: SizeConfig.blockHorizontal * 96,
        decoration: BoxDecoration(
            color: buttonPressed ? Colors.blueAccent[700] : Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            widget.category.categoryName,
            style: TextStyle(
              color: buttonPressed ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
