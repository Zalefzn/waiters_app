import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/class_model.dart';
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
                                                                  if (productProviders
                                                                          .products[
                                                                              index]
                                                                          .idProCategory ==
                                                                      null) {
                                                                    print("");
                                                                  } else {
                                                                    print(category
                                                                        .categorys[
                                                                            index]
                                                                        .idCategory);
                                                                    print(productProviders
                                                                        .products
                                                                        .where((product) =>
                                                                            ProductCard(product).product.idProCategory ==
                                                                            category.categorys[index].idCategory)
                                                                        .toList());
                                                                  }
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
                height: 63.h,
                width: SizeConfig.blockHorizontal * 100,
                color: Colors.white,
                child: productProviders.search.length != 0 ||
                        searchController.text.toLowerCase().isNotEmpty
                    ? GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 1,
                        padding: const EdgeInsets.all(6),
                        childAspectRatio: 1,
                        children: productProviders.search
                            .map((product) => ProductCard(product))
                            .toList(),
                      )
                    : loading
                        ? Center(child: CircularProgressIndicator())
                        : GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 1,
                            padding: const EdgeInsets.all(6),
                            childAspectRatio: 1,
                            children: productProviders.products
                                .map((product) => ProductCard(product))
                                .toList(),
                          )),
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
            height: 30.h,
            width: SizeConfig.blockHorizontal * 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockVertical * 1),
                  Image.network(widget.product.gambarUrl,
                      height: 80, width: 110, fit: BoxFit.fill),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            widget.product.nameProduct,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockVertical * 1),
                        Center(
                          child: Text(
                            widget.product.hargaProduct,
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
        ),
      ],
    );
  }
}
