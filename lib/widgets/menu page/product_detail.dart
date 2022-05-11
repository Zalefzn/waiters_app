import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/model/transaction_product_model.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/providers/items_providers.dart';

class ProductDetail extends StatefulWidget {
  final TransactionProductModel product;

  const ProductDetail(this.product, {key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();

}

class _ProductDetailState extends State<ProductDetail> {
  int _productAmount = 1;
  String _productNotes = "";

  late final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      _productAmount = widget.product.quantity;
      _productNotes = widget.product.notes;
    });

    _textEditingController.text = _productNotes;

    _textEditingController.addListener(() {
      final String text = _textEditingController.text;

      setState(() {
        _productNotes = text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  _increaseQuantity() async {
    setState(() {
      _productAmount++;
    });
  }

  _decreaseQuantity() async {
    if (_productAmount != 1) {
      setState(() {
        _productAmount--;
      });
    }
  }

  _handleBackBtn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
  }

  _handleAddToCartBtn(CartProvider cartProvider) async {
    bool isValidated = (_productAmount >= 1);

    var snackbarColor = isValidated ? Colors.green : Colors.red;
    var snackbarContent = isValidated ? "Successfully added product to cart !" : "Cannot add product, please check and try again";

    setPreferences();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: snackbarColor,
      content: Text(snackbarContent, textAlign: TextAlign.center),
    ));

    if (isValidated) {
      // cartProvider.addCart(widget.product);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
    }

  }

  setPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("getCounterData", _productAmount);
    preferences.setString("Notes", _productNotes);
  }


  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    var productPrice = widget.product.price;

    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2, left: SizeConfig.blockHorizontal * 2),
            height: SizeConfig.blockHorizontal * 6,
            width: SizeConfig.blockHorizontal * 100,
            child: Row(children: [
              GestureDetector(
                onTap: _handleBackBtn,
                child: const Icon(Icons.chevron_left, size: 40),
              )
            ],),
          )
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
              widget.product.name,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              productPrice.toString(),
              style: const TextStyle(
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
      return SizedBox(
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal * 53,
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _textEditingController,
                  maxLines: 9,
                  decoration: const InputDecoration(
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

    Widget addCart() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 4),
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _decreaseQuantity();
                });
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text("-",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: buttonNavbar))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            Text(
              "$_productAmount",
              style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _increaseQuantity();
                });
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text("+",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: buttonNavbar))),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            SizedBox(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () async {
                    _handleAddToCartBtn(cartProvider);
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
          addCart()
        ],
      ),
    );
  }
}