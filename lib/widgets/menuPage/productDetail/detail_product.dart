import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/transactionProduct.dart';
import 'package:flutter_mobile/providers/transactionProvider.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  final TransactionProduct product;

  ProductDetailPage(this.product);

  @override
  State<ProductDetailPage> createState() => _productDetail();
}

class _productDetail extends State<ProductDetailPage> {
  int _productCount = 1;
  String _productNotes = "";

  late final TextEditingController textEditingController =
      TextEditingController();

  //data kedalam initstate
  @override
  void initState() {
    super.initState();

    setState(() {
      _productCount = widget.product.quantity;
      _productNotes = widget.product.notes;
    });

    textEditingController.text = _productNotes;

    textEditingController.addListener(() {
      final String text = textEditingController.text;

      setState(() {
        _productNotes = text;
      });
    });
  }

  //data di dispose
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  //incrennt data
  incrementDataPlus() async {
    _productCount++;
  }

  //decrement data
  decrementDataMinus() async {
    if (_productCount != 1) {
      setState(() {
        _productCount--;
      });
    }

    //handle Data Back
    handleDataBack() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
    }

    //handle add  data to cartProduct
    _handleDataAdd(TransactionProvider transactionProvider) async {
      bool isValidate = (_productCount >= 1);

      var snackBarColor = isValidate ? Colors.green : Colors.red;
      var snackBarContent =
          isValidate ? "Success add Product" : "Cannot add Product";

      setPreferences();

      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          snackBarContent,
          textAlign: TextAlign.center,
        ),
      )));
      if (isValidate) {
        transactionProvider.addProduct(widget.product);

        widget.product.quantity = _productCount;
        widget.product.notes = _productNotes;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
      }
    }
  }

  setPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("getCounterData", _productCount);
    preferences.setString("Notes", _productNotes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
