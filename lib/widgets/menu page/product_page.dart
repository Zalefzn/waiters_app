import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/navigation%20page/menu_navbar.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  final DataProduct product;

  ProductPage(
    this.product,
  );

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController textEditing = TextEditingController();

  bool _changeWarna = false;
  bool _changeColor = false;
  int _n = 0;

  add() {
    setState(() {
      _n++;
    });
  }

  minus() {
    setState(() {
      if (_n != 0) {
        _n--;
      }
    });
  }

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
                height: SizeConfig.blockVertical * 30,
                width: SizeConfig.blockHorizontal * 100,
                child: Image.network(widget.product.gambarProduct)),
            SizedBox(height: SizeConfig.blockVertical * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3),
                  child: Text(
                    widget.product.nameProduct,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
                  child: Text(
                    widget.product.hargaProduct,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 3),
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
                  right: SizeConfig.blockHorizontal * 53,
                  top: SizeConfig.blockVertical * 2),
              child: Text(
                "Additional Notes  :",
                style: TextStyle(
                  fontFamily: 'Montserrat',
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
                controller: textEditing,
                maxLines: 9,
                decoration: InputDecoration(
                  hintText: "Contoh : Pedas Manis",
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
              onTap: () async {
                SharedPreferences setAdd =
                    await SharedPreferences.getInstance();
                setAdd.setInt("getCount", _n);
                print(_n);
                setState(() {
                  add();
                });
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text("+",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigoAccent.shade400))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Text(
              "$_n",
              style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            GestureDetector(
              onTap: () {
                minus();
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text("-",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigoAccent.shade400))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Container(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences setNotes =
                        await SharedPreferences.getInstance();
                    setNotes.setString("Notes", textEditing.text);
                    print(textEditing.text);
                    if (cartProvider.carts.isEmpty ||
                        cartProvider.carts.isNotEmpty) {
                      if (_n == 0) {
                        setState(() {
                          _changeColor = false;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.red,
                          content: Text(
                            "Add Valid",
                            textAlign: TextAlign.center,
                          ),
                        ));
                      } else if (_n > 0) {
                        setState(() {
                          _changeWarna = true;

                          if (_n < 1) {
                            setState(() {
                              _changeWarna = false;
                            });
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 500),
                            backgroundColor: Colors.green,
                            content: Text(
                              "Add Success",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        cartProvider.addCart(widget.product);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewMenu()));
                      }
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("Add to Cart",
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  style: TextButton.styleFrom(
                    backgroundColor: _changeColor == _changeWarna
                        ? Colors.grey.shade300
                        : Colors.indigoAccent.shade400,
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
