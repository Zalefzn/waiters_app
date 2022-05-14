import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/methodSize/method.dart';
import 'package:flutter_mobile/method/methodStyle/theme.dart';
import 'package:flutter_mobile/model/cartProduct.dart';
import 'package:flutter_mobile/navigation/navigation_navbar.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int _s = 1;

  tambah() {
    setState(() {
      _s++;
    });
  }

  kurang() {
    setState(() {
      if (_s != 1) {
        _s--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    var hargaProduct =
        double.parse(widget.cartModel.product.priceProduct).floor();

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewMenuGrid()));
                  },
                  child: const Icon(Icons.chevron_left, size: 40)),
            ]),
          ),
        ],
      );
    }

    Widget image() {
      return Container(
        height: SizeConfig.blockVertical * 40,
        width: SizeConfig.blockHorizontal * 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.cartModel.product.nameProduct,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              hargaProduct.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: textController,
                  maxLines: 9,
                  decoration: InputDecoration(
                    hintText: "Contoh : Pedas Manis",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addChart2() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            // GestureDetector(
            //   onTap: () {
            //     minus();
            //   },
            //   child: Container(
            //       margin: const EdgeInsets.all(5),
            //       child: Text("-",
            //           style: TextStyle(
            //               fontFamily: 'Rubik',
            //               fontSize: 35,
            //               fontWeight: FontWeight.w600,
            //               color: buttonNavbar))),
            // ),
            // SizedBox(width: SizeConfig.blockHorizontal * 8),
            // Text(
            //   "$_n",
            //   style: const TextStyle(
            //       fontFamily: 'Rubik',
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // ),
            // SizedBox(width: SizeConfig.blockHorizontal * 8),
            // GestureDetector(
            //   onTap: () async {
            //     print(_n + 1);
            //     setState(() {
            //       add();
            //     });
            //   },
            //   child: Container(
            //       margin: EdgeInsets.all(5),
            //       child: Text("+",
            //           style: TextStyle(
            //               fontFamily: 'Rubik',
            //               fontSize: 35,
            //               fontWeight: FontWeight.w600,
            //               color: buttonNavbar))),
            // ),
            SizedBox(width: SizeConfig.blockHorizontal * 0),
            Container(
              width: SizeConfig.blockHorizontal * 90,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences setNotes =
                        await SharedPreferences.getInstance();
                    setNotes.setString("Notes", textController.text);
                    print(textController.text);
                    // if (cartProvider.carts.isEmpty ||
                    //     cartProvider.carts.isNotEmpty) {
                    //   // if (_n == 0) {
                    //   //   setState(() {
                    //   //     _changeColor = false;
                    //   //   });
                    //   //   ScaffoldMessenger.of(context)
                    //   //       .showSnackBar(const SnackBar(
                    //   //     duration: Duration(milliseconds: 500),
                    //   //     backgroundColor: Colors.red,
                    //   //     content: Text(
                    //   //       "Add Valid",
                    //   //       textAlign: TextAlign.center,
                    //   //     ),
                    //   //   ));
                    //   // } else if (_n > 0) {
                    //   //   setState(() {
                    //   //     _changeWarna = true;

                    //   //     if (_n < 1) {
                    //   //       setState(() {
                    //   //         _changeWarna = false;
                    //   //       });
                    //   //     }
                    //   //   });
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
                            builder: (context) => ViewMenuGrid()));
                  },
                  // },

                  child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("Update Cart",
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  style: TextButton.styleFrom(
                    backgroundColor: buttonNavbar,
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
          addChart2(),
        ],
      ),
    );
  }
}
