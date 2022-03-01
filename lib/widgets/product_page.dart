import 'package:flutter/material.dart';

import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/validation/menu_navbar.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/widgets/summery_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final DataProduct product;

  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical * 2,
                left: SizeConfig.blockHorizontal * 2),
            height: SizeConfig.blockVertical * 6,
            width: SizeConfig.blockHorizontal * 100,
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewMenu()));
                  },
                  child: Icon(
                    Icons.chevron_left,
                  )),
            ]),
          ),
        ],
      );
    }

    Widget image() {
      return Container(
        height: SizeConfig.blockVertical * 45,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
                height: SizeConfig.blockVertical * 23,
                width: SizeConfig.blockHorizontal * 100,
                child: Image.asset("images/no_image.png")),
            SizedBox(height: SizeConfig.blockVertical * 4),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  child: Text(
                    widget.product.nameProduct,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 20),
                  child: Text(
                    widget.product.hargaProduct,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 3),
            Container(
                margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 48),
                child: Text(
                    "ini adalah text untuk deskripsi\nmenu yang tertara disini")),
          ],
        ),
      );
    }

    Widget notes() {
      return Container(
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal * 58,
                  top: SizeConfig.blockVertical * 2),
              child: Text(
                "Additional Notes  :",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
              height: SizeConfig.blockVertical * 20,
              width: SizeConfig.blockHorizontal * 92,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "   Contoh : Pedas Manis",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addChart() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 4),
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text("-",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Text(
              "0",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text("+",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Container(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () {
                    cartProvider.addCart(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        backgroundColor: Colors.green,
                        content: Text(
                          "Add Success",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewBar()));
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text("Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                  )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          header(),
          image(),
          Container(
            height: SizeConfig.blockVertical * 0.2,
            width: SizeConfig.blockHorizontal * 100,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          notes(),
          Container(
            height: SizeConfig.blockVertical * 0.2,
            width: SizeConfig.blockHorizontal * 100,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          addChart(),
        ],
      ),
    );
  }
}
