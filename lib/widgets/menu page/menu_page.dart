import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/widgets/menu%20page/product_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var loading = false;

  TextEditingController searchController = TextEditingController();
  bool isActiveBotton = false;
  bool buttonPressed = false;

  @override
  void initState() {
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
        if (data.nameProduct.contains(text) ||
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
                  child: Stack(
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search Product ...',
                          icon: Icon(Icons.search),
                        ),
                        onChanged: onSearchTextChanged,
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
                child: productProviders.search.length != 0 ||
                        searchController.text.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount: productProviders.search.length,
                        itemBuilder: (context, i) {
                          final e = productProviders.search[i];
                          return GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                          productProviders.products.first)));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockVertical * 2),
                              height: SizeConfig.blockVertical * 34,
                              width: SizeConfig.blockHorizontal * 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: SizeConfig.blockVertical * 1),
                                  Image.network(e.gambarUrl,
                                      height: 110,
                                      width: 170,
                                      fit: BoxFit.fill),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockVertical * 3),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            e.nameProduct,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.blockVertical * 1),
                                        Center(
                                          child: Text(
                                            e.hargaProduct,
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
                          );
                        })
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount: productProviders.products.length,
                        itemBuilder: (context, k) {
                          final j = productProviders.products[k];
                          return GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                          productProviders.products.first)));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockVertical * 2),
                              height: SizeConfig.blockVertical * 34,
                              width: SizeConfig.blockHorizontal * 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: SizeConfig.blockVertical * 1),
                                  Image.network(j.gambarUrl,
                                      height: 110,
                                      width: 170,
                                      fit: BoxFit.fill),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockVertical * 3),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            j.nameProduct,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.blockVertical * 1),
                                        Center(
                                          child: Text(
                                            j.hargaProduct,
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
                          );
                        })),
            // child: GridView.count(
            //   crossAxisCount: 2,
            //   mainAxisSpacing: 2,
            //   crossAxisSpacing: 1,
            //   padding: const EdgeInsets.all(6),
            //   childAspectRatio: 1,
            //   children: productProviders.products
            //       .map((product) => ProductCard(product))
            //       .toList(),
            // )),
          ]),
        ),
      );
    });
  }
}

// class ProductCard extends StatefulWidget {
//   final DataProduct product;
//   ProductCard(this.product);

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () async {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ProductPage(widget.product)));
//           },
//           child: Container(
//             margin: EdgeInsets.only(
//                 left: SizeConfig.blockHorizontal * 3,
//                 top: SizeConfig.blockVertical * 2),
//             height: SizeConfig.blockVertical * 34,
//             width: SizeConfig.blockHorizontal * 45,
//             decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               children: [
//                 SizedBox(height: SizeConfig.blockVertical * 1),
//                 Image.network(widget.product.gambarUrl,
//                     height: 110, width: 170, fit: BoxFit.fill),
//                 Container(
//                   margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Text(
//                           widget.product.nameProduct,
//                           style: const TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Montserrat'),
//                         ),
//                       ),
//                       SizedBox(height: SizeConfig.blockVertical * 1),
//                       Center(
//                         child: Text(
//                           widget.product.hargaProduct,
//                           style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'Montserrat'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class CategoryPage extends StatefulWidget {
  ProductCategory category;
  CategoryPage(this.category);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<DataProduct> dataProduct = [];
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    ProductProviders product = Provider.of<ProductProviders>(context);

    return ChangeNotifierProvider<ProductProviders>(
      create: (context) => ProductProviders(),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            buttonPressed ? null : buttonPressed = !buttonPressed;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
          height: SizeConfig.blockVertical * 10,
          width: SizeConfig.blockHorizontal * 96,
          decoration: BoxDecoration(
              color: buttonPressed ? buttonColor : textColor2,
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
      ),
    );
  }
}
