import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/model/class_cartModel.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/widgets/menu%20page/update_product_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCard extends StatefulWidget {
  final CartModel cartModel;
  CartCard(this.cartModel);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String _notes = "";
  int _countProduct = 0;

  @override
  void initState() {
    getNotes();
    getCount();
    super.initState();
  }

  void getCount() async {
    final SharedPreferences getCounter = await SharedPreferences.getInstance();
    setState(() {
      _countProduct = getCounter.getInt("getCounterData") ?? 1;
    });
  }

  void getNotes() async {
    final SharedPreferences getNote = await SharedPreferences.getInstance();
    setState(() {
      _notes = getNote.getString("Notes") ?? "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    var hargaProduct =
        double.parse(widget.cartModel.product.hargaProduct).floor();
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    bool _itemPressed = false;

    return GestureDetector(
        onTap: () {
          _itemPressed = !_itemPressed;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdateProductPage(widget.cartModel)));
        },
        child: Container(
          height: SizeConfig.blockVertical * 20,
          width: SizeConfig.blockHorizontal * 100,
          decoration: BoxDecoration(
            color: _itemPressed ? Colors.grey.shade300 : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.blockHorizontal * 5),
                    child: Text(
                      widget.cartModel.product.nameProduct,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: SizeConfig.blockHorizontal * 5),
                    child: Text(
                      hargaProduct.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockVertical * 1,
                        left: SizeConfig.blockHorizontal * 5),
                    child: Text(
                      "$_notes",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockHorizontal * 5,
                        bottom: SizeConfig.blockVertical * 0.3),
                    child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                cartProvider.removeCart(widget.cartModel.id);
                              },
                              child: Icon(Icons.delete_outline_outlined,
                                  color: buttonColor3, size: 25)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: SizeConfig.blockHorizontal * 5),
                  GestureDetector(
                    onTap: () async {
                      cartProvider.reduceQuntity(widget.cartModel.id);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Text("-",
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: buttonNavbar))),
                  ),
                  SizedBox(width: SizeConfig.blockHorizontal * 4),
                  Text(
                    cartProvider.totalItems().toString(),
                    style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(width: SizeConfig.blockHorizontal * 4),
                  GestureDetector(
                    onTap: () async {
                      cartProvider.addQuantity(widget.cartModel.id);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Text("+",
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: buttonNavbar))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
