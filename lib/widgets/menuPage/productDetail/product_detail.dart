import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/model/transaction_product_model.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:flutter_mobile/providers/transaction_provider.dart';
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

  _handleAddToCartBtn(TransactionProvider transactionProvider) async {
    bool isValidated = (_productAmount >= 1);

    // TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context, listen: false);

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

      widget.product.quantity = _productAmount;
      widget.product.notes = _productNotes;

      transactionProvider.addProduct(widget.product);
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
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);

    var productPrice = widget.product.price;

=======
import 'package:flutter_mobile/model/product.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
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
  int _n = 1;

  add() async {
    SharedPreferences setAdd = await SharedPreferences.getInstance();
    setAdd.setInt("getCounterData", _n + 1);
    setState(() {
      _n++;
    });
  }

  minus() async {
    setState(() {
      if (_n != 1) {
        _n--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    var hargaProduct = double.parse(widget.product.priceProduct).floor();
>>>>>>> master
    Widget header() {
      return Column(
        children: [
          Container(
<<<<<<< HEAD
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
=======
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
                  child: Icon(
                    Icons.chevron_left,
                    size: 40,
                  )),
            ]),
          ),
>>>>>>> master
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
<<<<<<< HEAD
              widget.product.name,
              style: const TextStyle(
=======
              widget.product.nameProduct,
              style: TextStyle(
>>>>>>> master
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
<<<<<<< HEAD
              productPrice.toString(),
              style: const TextStyle(
=======
              hargaProduct.toString(),
              style: TextStyle(
>>>>>>> master
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
<<<<<<< HEAD
      return SizedBox(
=======
      return Container(
>>>>>>> master
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal * 53,
                  top: SizeConfig.blockVertical * 2),
<<<<<<< HEAD
              child: const Text(
=======
              child: Text(
>>>>>>> master
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
<<<<<<< HEAD
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _textEditingController,
                  maxLines: 9,
                  decoration: const InputDecoration(
=======
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: textEditing,
                  maxLines: 9,
                  decoration: InputDecoration(
>>>>>>> master
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

<<<<<<< HEAD
    Widget addCart() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 4),
=======
    Widget addChart() {
      return Container(
        margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
>>>>>>> master
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            GestureDetector(
<<<<<<< HEAD
              onTap: () async {
                setState(() {
                  _decreaseQuantity();
                });
=======
              onTap: () {
                minus();
>>>>>>> master
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
<<<<<<< HEAD
              "$_productAmount",
=======
              "$_n",
>>>>>>> master
              style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            GestureDetector(
              onTap: () async {
<<<<<<< HEAD
                setState(() {
                  _increaseQuantity();
                });
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
=======
                print(_n + 1);
                setState(() {
                  add();
                });
              },
              child: Container(
                  margin: EdgeInsets.all(5),
>>>>>>> master
                  child: Text("+",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: buttonNavbar))),
            ),
<<<<<<< HEAD
            SizedBox(width: SizeConfig.blockHorizontal * 8),
            SizedBox(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () async {
                    _handleAddToCartBtn(transactionProvider);
=======
            SizedBox(width: SizeConfig.blockHorizontal * 10),
            Container(
              width: SizeConfig.blockHorizontal * 50,
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
                      }
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
                              builder: (context) => ViewMenuGrid()));
                    }
>>>>>>> master
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
<<<<<<< HEAD
          addCart()
=======
          addChart(),
>>>>>>> master
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> master
