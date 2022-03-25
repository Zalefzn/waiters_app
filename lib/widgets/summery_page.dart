import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/auth_providers.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/validation/change_page_view.dart';
import 'package:flutter_mobile/validation/menu_navbar.dart';
import 'package:flutter_mobile/widgets/update_product_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummeryPage extends StatefulWidget {
  @override
  State<SummeryPage> createState() => _SummeryPage();
}

class _SummeryPage extends State<SummeryPage> {
  bool isButtonActive = true;
  bool isButtonActive2 = true;
  String _tableName = "";
  int _count = 0;

  @override
  void initState() {
    super.initState();
    getStatus();
    getCount();
  }

  void getCount() async {
    final SharedPreferences getCount = await SharedPreferences.getInstance();
    setState(() {
      _count = getCount.getInt("key") ?? 0;
    });
  }

  void getStatus() async {
    final SharedPreferences getName = await SharedPreferences.getInstance();
    setState(() {
      _tableName = getName.getString("saveTable") ?? "noTable";
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    TableProviders tableProvider = Provider.of<TableProviders>(context);

    handleOrder() async {
      if (await orderProvider.orderCheck(
          cartProvider.carts, tableProvider.tables)) {}
    }

    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: RaisedButton(
            child: const Icon(Icons.arrow_back),
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
                      fontFamily: 'Montserrat',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.mode_edit_rounded, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputCustomer()));
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: SizeConfig.blockVertical * 12,
              width: SizeConfig.blockHorizontal * 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('No.of Customers',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w500)),
                      Text(
                        "Table No",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300),
                      ),
                      Text("Served By",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal * 7),
                        child: Text("$_count",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal * 8),
                          child: Text(
                            "$_tableName",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      const Text("Rizal",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 0.2),
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
                  decoration: const BoxDecoration(
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
                            child: const Text(
                              "Subtotal ",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 64,
                                top: SizeConfig.blockVertical * 3),
                            child: Text(
                              cartProvider.totalItems().toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
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
                              onPressed: isButtonActive
                                  ? () {
                                      if (cartProvider.carts.isEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewMenu()));
                                      } else if (cartProvider
                                          .carts.isNotEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopDialog2(context),
                                        );
                                      }
                                      setState(() {
                                        isButtonActive = false;
                                      });
                                    }
                                  : null,
                              child: const Text(
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
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 6),
                            height: SizeConfig.blockVertical * 7,
                            width: SizeConfig.blockHorizontal * 42,
                            child: ElevatedButton(
                              onPressed: isButtonActive2
                                  ? () async {
                                      if (cartProvider.carts.isEmpty) {
                                        return null;
                                      } else if (cartProvider
                                          .carts.isNotEmpty) {
                                        cartProvider.carts = [];

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewBarPage()));
                                        handleOrder();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopDialog(context),
                                        );
                                      }

                                      setState(() {
                                        isButtonActive2 = false;
                                      });
                                    }
                                  : null,
                              child: const Text(
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

_buildPopDialog(BuildContext context) {
  return AlertDialog(
      title: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 0,
                bottom: SizeConfig.blockVertical * 5),
            height: SizeConfig.blockVertical * 15,
            width: SizeConfig.blockHorizontal * 20,
            child: Icon(
              Icons.check_rounded,
              color: Colors.blue.shade900,
              size: 100,
            )),
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 5,
              bottom: SizeConfig.blockVertical * 4),
          child: const Text("Order Submitted!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ],
    ),
  ));
}

_buildPopDialog2(BuildContext context) {
  CartProvider cartProvider = Provider.of<CartProvider>(context);
  return AlertDialog(
      title: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 0,
                bottom: SizeConfig.blockVertical * 5),
            height: SizeConfig.blockVertical * 15,
            width: SizeConfig.blockHorizontal * 50,
            child: Center(
              child: Text("Are You Sure Want to Leave ?",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewBar()));
                cartProvider.carts.clear();
              },
              child: Container(
                height: SizeConfig.blockVertical * 5,
                width: SizeConfig.blockHorizontal * 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.indigoAccent.shade400,
                ),
                child: Center(
                    child: Text("Yes", style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewMenu()));
              },
              child: Container(
                  height: SizeConfig.blockVertical * 5,
                  width: SizeConfig.blockHorizontal * 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                      child: Text("No",
                          style:
                              TextStyle(color: Colors.indigoAccent.shade400)))),
            ),
          ],
        ),
      ],
    ),
  ));
}

class CartCard extends StatefulWidget {
  final CartModel cartModel;
  CartCard(this.cartModel);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String _notes = "";

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getNotes() async {
    final SharedPreferences getNote = await SharedPreferences.getInstance();
    setState(() {
      _notes = getNote.getString("Notes") ?? "No Notes";
    });
  }

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        EdgeInsets.only(right: SizeConfig.blockHorizontal * 18),
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
                        EdgeInsets.only(left: SizeConfig.blockHorizontal * 8),
                    child: Text(
                      widget.cartModel.product.hargaProduct,
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
                        left: SizeConfig.blockHorizontal * 11.5,
                        top: SizeConfig.blockVertical * 1),
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
                        left: SizeConfig.blockHorizontal * 10,
                        bottom: SizeConfig.blockVertical * 0.3),
                    child: TextButton(
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                cartProvider.removeCart(widget.cartModel.id);
                              },
                              child: Icon(Icons.remove,
                                  color: Colors.indigoAccent.shade400,
                                  size: 30)),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
