import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/widgets/product_page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late String filter;

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController searchControl = TextEditingController();

  @override
  initState() {
    searchControl.addListener(() {
      setState(() {
        filter = searchControl.text;
      });
    });
  }

  @override
  void dispose() {
    searchControl.dispose();
    super.dispose();
  }

  List<DataProduct> products = [];
  @override
  Widget build(BuildContext context) {
    ProductProviders productProviders = Provider.of<ProductProviders>(context);

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
            icon: Icon(Icons.settings),
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
                        decoration: BoxDecoration(
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
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          enableDrag: true,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height:
                                                  SizeConfig.blockVertical * 90,
                                              color: Colors.white,
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
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockVertical *
                                                              2),
                                                      child: Text(
                                                        'Armor Kopi Leuwit - Best Seller',
                                                        style: TextStyle(
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
                                                          left: SizeConfig
                                                                  .blockHorizontal *
                                                              0),
                                                      height: SizeConfig
                                                              .blockVertical *
                                                          80,
                                                      width: SizeConfig
                                                              .blockHorizontal *
                                                          100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: ListView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'All Menu Items',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Best Sellers',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Dim Sum',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Appetizers',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Noodles',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Main Course',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Dessert',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Coffe',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                right: SizeConfig
                                                                        .blockHorizontal *
                                                                    2,
                                                                top: SizeConfig
                                                                        .blockVertical *
                                                                    2),
                                                            height: SizeConfig
                                                                    .blockVertical *
                                                                9,
                                                            width: SizeConfig
                                                                    .blockHorizontal *
                                                                95,
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(
                                                                'Tea',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(7),
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
                    children: const [
                      TextField(
                        decoration: InputDecoration(
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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    children: [
                      Column(
                        children: productProviders.products
                            .map((product) => ProductCard(product))
                            .toList(),
                      ),
                    ],
                  ),
                ],
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
          onTap: () {
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
                Image.asset("images/no_image.png",
                    height: 100, width: 130, fit: BoxFit.fill),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          product.nameProduct,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1),
                      Center(
                        child: Text(
                          product.hargaProduct,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
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
                Image.asset("images/no_image.png",
                    height: 100, width: 130, fit: BoxFit.fill),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          product.nameProduct,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1),
                      Center(
                        child: Text(
                          product.hargaProduct,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
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
