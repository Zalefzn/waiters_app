import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/categoryProduct.dart';
import 'package:flutter_mobile/providers/categoryProduct.dart';
import 'package:flutter_mobile/providers/productProvider.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class CatgeoryProduct extends StatefulWidget {
  @override
  State<CatgeoryProduct> createState() => _CategoryProduct();
}

class _CategoryProduct extends State<CatgeoryProduct> {
  @override
  Widget build(BuildContext context) {
    ProductProviders productProviders = Provider.of<ProductProviders>(context);
    ProductCategorys category = Provider.of<ProductCategorys>(context);

    handleButtonNavigate(ProductCategory category) {
      var data = productProviders.products
          .where((element) => element.idProCategory == category.idCategory)
          .toList();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
      // var data = productProviders.products
      //     .where((element) => element.idProCategory == category.idCategory)
      //     .toList();

      print(data);
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 2.5,
            top: SizeConfig.blockVertical * 2),
        height: SizeConfig.blockVertical * 6,
        width: SizeConfig.blockHorizontal * 95,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Items',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Transform.rotate(
                angle: 90 * math.pi / 90,
                child: Icon(Icons.chevron_left_rounded,
                    size: 20, color: Colors.black),
              )
            ],
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
                    height: SizeConfig.blockVertical * 87,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 2,
                            ),
                            height: SizeConfig.blockVertical * 1,
                            width: SizeConfig.blockHorizontal * 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockVertical * 2),
                            child: Text(
                              'Armor Kopi Leuwit - Best Seller',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockVertical * 2,
                                  left: SizeConfig.blockHorizontal * 0),
                              height: SizeConfig.blockVertical * 75,
                              width: SizeConfig.blockHorizontal * 90,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: ListView.builder(
                                  itemCount: category.categorys.length,
                                  itemBuilder: (context, i) {
                                    final a = category.categorys[i];
                                    return GestureDetector(
                                      onTap: () async {
                                        handleButtonNavigate(a);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: SizeConfig.blockVertical * 2),
                                        height: SizeConfig.blockVertical * 10,
                                        width: SizeConfig.blockHorizontal * 80,
                                        decoration: BoxDecoration(
                                            color: textColor2,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            a.categoryName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
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
    );
  }
}
