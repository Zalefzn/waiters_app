import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/validation/menu_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:provider/provider.dart';

class UpdateProductPage extends StatefulWidget {
  final CartModel cartModel;
  UpdateProductPage(
    this.cartModel,
  );

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  TextEditingController textController = TextEditingController();

  bool _changeWarna = false;
  bool _changeColor = false;
  int _s = 0;

  tambah() {
    setState(() {
      _s++;
    });
  }

  kurang() {
    setState(() {
      if (_s != 0) {
        _s--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header2() {
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
                  child: const Icon(
                    Icons.chevron_left,
                  )),
            ]),
          ),
        ],
      );
    }

    Widget image2() {
      return Container(
        height: SizeConfig.blockVertical * 45,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
                height: SizeConfig.blockVertical * 30,
                width: SizeConfig.blockHorizontal * 100,
                child: Image.network(widget.cartModel.product.gambarProduct)),
            SizedBox(height: SizeConfig.blockVertical * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  child: Text(
                    widget.cartModel.product.nameProduct,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 20),
                  child: Text(
                    widget.cartModel.product.hargaProduct,
                    style: const TextStyle(
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

    Widget notes2() {
      return Container(
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal * 58,
                  top: SizeConfig.blockVertical * 2),
              child: const Text(
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
                controller: textController,
                maxLines: 9,
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

    Widget addChart2() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 4),
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            GestureDetector(
              onTap: () {
                setState(() {
                  tambah();
                });
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text("+",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Text(
              "$_s",
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  kurang();
                });
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text("-",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Container(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences setNotes =
                        await SharedPreferences.getInstance();
                    setNotes.setString("Notes", textController.text);
                    print(textController.text);
                    if (cartProvider.carts.isEmpty ||
                        cartProvider.carts.isNotEmpty) {
                      if (_s == 0) {
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
                      } else if (_s > 0) {
                        setState(() {
                          _changeWarna = true;

                          if (_s < 1) {
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
                        cartProvider.addCart(widget.cartModel.product);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewMenu()));
                      }
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("Update Cart",
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
          header2(),
          image2(),
          Container(
            height: SizeConfig.blockVertical * 0.2,
            width: SizeConfig.blockHorizontal * 100,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          notes2(),
          Container(
            height: SizeConfig.blockVertical * 0.2,
            width: SizeConfig.blockHorizontal * 100,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          addChart2(),
        ],
      ),
    );
  }
}
