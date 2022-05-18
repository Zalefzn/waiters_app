import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/cartProduct.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/widgets/tablePage/afterOrderTab/page_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final CartModel cartModel;
  CartPage(this.cartModel);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _noteMenu = "";
  int _getQuantity = 1;

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getQuantity() async {
    final SharedPreferences getQuantityCounter =
        await SharedPreferences.getInstance();
    _getQuantity = getQuantityCounter.getInt("getCounterData") ?? 1;
  }

  void getNotes() async {
    final SharedPreferences getNote = await SharedPreferences.getInstance();
    _noteMenu = getNote.getString("Notes") ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    var hargaProduct =
        double.parse(widget.cartModel.product.priceProduct).floor();
    bool _itemClick = false;
    bool _isStatusActive = false;
    int _n = 0;

    add() {
      setState(() {
        _n++;
      });
    }

    minus() {
      setState(() {
        if (_n != 1) {
          _n--;
        }
      });
    }

    return GestureDetector(
      onTap: () {
        _itemClick = !_itemClick;
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (context) {
            return Container(
              height: SizeConfig.blockVertical * 87,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical * 2,
                    ),
                    height: SizeConfig.blockVertical * 1,
                    width: SizeConfig.blockHorizontal * 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockVertical * 3),
                  Container(
                    height: SizeConfig.blockVertical * 10,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(" Transfer Menu",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 7,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Text(
                        "Selected Menu : " +
                            "[ " +
                            widget.cartModel.product.nameProduct +
                            " ]",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 7,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text("Notes : " + "$_noteMenu",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockVertical * 2),
                  Container(
                    height: SizeConfig.blockVertical * 0.2,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 7,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Destination Table",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 0.2,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockVertical * 2),
                  Container(
                    height: SizeConfig.blockVertical * 10,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 3,
                                  top: SizeConfig.blockVertical * 3),
                              child: Text(
                                'Section/Floor : ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 1,
                                  top: SizeConfig.blockVertical * 2.5),
                              width: SizeConfig.blockHorizontal * 64,
                              height: SizeConfig.blockVertical * 5,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockVertical * 2),
                                    child: Text(
                                      "Indoor",
                                      style: TextStyle(
                                        fontFamily: ' Montserrat',
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  elevation: 0,
                                  items: _dropDownItem(),
                                  onChanged: (value) {
                                    switch (value) {
                                      case 'Indoor':
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewTable()));
                                        break;
                                      case 'Outdoor':
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewTable()));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockVertical * 12),
                  Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.blockHorizontal * 4),
                    height: SizeConfig.blockVertical * 13.5,
                    width: SizeConfig.blockHorizontal * 100,
                    child: Row(
                      children: [
                        SizedBox(width: SizeConfig.blockHorizontal * 3),
                        GestureDetector(
                          onTap: () async {
                            setState(() {});
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
                          "0",
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: SizeConfig.blockHorizontal * 8),
                        GestureDetector(
                          onTap: () {},
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
                                if (cartProvider.carts.isEmpty ||
                                    cartProvider.carts.isNotEmpty) {
                                  if (_n == 0) {
                                    setState(() {});
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
                                      if (_n < 1) {
                                        setState(() {});
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
                                  }
                                }
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: const Text("Transefer Menu",
                                      style: TextStyle(
                                          fontFamily: 'Rubik',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.indigoAccent.shade400,
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
        );
      },
      child: Container(
        height: SizeConfig.blockVertical * 20,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: _itemClick ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  cartProvider.totalItems().toString() + " x",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockHorizontal * 18,
                  ),
                  child: Text(widget.cartModel.product.nameProduct,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 8),
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
            SizedBox(height: SizeConfig.blockVertical * 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 11.5,
                      top: SizeConfig.blockVertical * 1),
                  child: Text(
                    "$_noteMenu",
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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopDialog(context),
                              );
                              // cartProvider.removeCart(widget.cartModel.id);
                            },
                            child: Icon(Icons.delete_forever_rounded,
                                color: buttonColor3, size: 25)),
                      ],
                    ),
                    onPressed: () {},
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

_buildPopDialog(BuildContext context) {
  Widget appBar() {
    return Container(
      height: SizeConfig.blockVertical * 5,
      child: Center(
        child: Text("nameProduct"),
      ),
    );
  }

  Widget textName() {
    return Container(
        margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 52),
        child: Text("Reason :",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500)));
  }

  Widget reason() {
    return Container(
      height: SizeConfig.blockVertical * 40,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: 15,
          decoration: InputDecoration(
            hintText: "Enter Reason..",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget deacreaseData() {
    return Container();
  }

  return SingleChildScrollView(
    child: AlertDialog(
        title: Center(
            child: Container(
                height: SizeConfig.blockVertical * 70,
                width: SizeConfig.blockHorizontal * 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: [
                  appBar(),
                  SizedBox(height: SizeConfig.blockVertical * 2),
                  textName(),
                  SizedBox(height: SizeConfig.blockVertical * 1),
                  reason(),
                  SizedBox(height: SizeConfig.blockVertical * 1),
                  deacreaseData(),
                ])))),
  );
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}
