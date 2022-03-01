import 'package:flutter/material.dart';

import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';

import 'package:provider/provider.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/widgets/update_product_page.dart';
import 'package:sizer/sizer.dart';

class SummeryPage extends StatefulWidget {
  const SummeryPage({Key? key}) : super(key: key);

  @override
  State<SummeryPage> createState() => _SummeryPage();
}

class _SummeryPage extends State<SummeryPage> {
  bool isButtonActive = true;
  bool isButtonActive2 = true;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: RaisedButton(
            child: Icon(Icons.arrow_back),
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ViewBar()));
            },
          ),
          title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 18,
              ),
              child: Text('Order Summary',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_edit_rounded, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: SizeConfig.blockVertical * 12,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Table'),
            ),
            Container(
              height: SizeConfig.blockVertical * 47,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: ListView(
                children:
                    cartProvider.carts.map((cart) => CartCard(cart)).toList(),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: SizeConfig.blockVertical * 18,
                  width: SizeConfig.blockHorizontal * 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 5,
                                top: SizeConfig.blockVertical * 3),
                            child: Text(
                              "Subtotal ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 65,
                                top: SizeConfig.blockVertical * 3),
                            child: Text(
                              "0",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 5),
                            height: SizeConfig.blockVertical * 7,
                            width: SizeConfig.blockHorizontal * 42,
                            child: ElevatedButton(
                              onPressed: isButtonActive2
                                  ? () {
                                      if (mounted) {
                                        setState(() {
                                          isButtonActive2 = false;
                                        });
                                      }
                                    }
                                  : null,
                              child: Text(
                                "Order",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red[400],
                                onSurface: Colors.grey.shade900,
                                elevation: 0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 4),
                            height: SizeConfig.blockVertical * 7,
                            width: SizeConfig.blockHorizontal * 42,
                            child: ElevatedButton(
                              onPressed: isButtonActive
                                  ? () {
                                      if (mounted) {
                                        setState(() {
                                          isButtonActive = false;
                                        });
                                      }
                                    }
                                  : null,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red[400],
                                onSurface: Colors.grey.shade900,
                                elevation: 0,
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
          ],
        ),
      );
    });
  }
}

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockVertical * 20,
      width: SizeConfig.blockHorizontal * 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 6,
            top: SizeConfig.blockVertical * 3),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "2x",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 12),
                  child: Text(
                    cart.product.nameProduct,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 8),
                  child: Text(
                    cart.product.hargaProduct,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 18,
                      top: SizeConfig.blockVertical * 1),
                  child: Text(
                    "Dimsum isi Cumi dan keju\nrasanya yang lezat kaya akan gizi\ndengan keju yang meleleh di dalamnya\nmembuat dimsum\nini menjadi yang paling favorite",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.blockHorizontal * 17,
                    bottom: SizeConfig.blockVertical * 4,
                  ),
                  child: TextButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue.shade900),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProductPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
