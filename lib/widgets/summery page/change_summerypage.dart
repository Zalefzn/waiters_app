import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/navigation%20page/menu_navbar.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/customer%20count/input_customer_count.dart';
import 'package:flutter_mobile/widgets/table%20page/change_page_view.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class ChangeSummerPage extends StatefulWidget {
  const ChangeSummerPage({Key? key}) : super(key: key);
  State<ChangeSummerPage> createState() => _StateSummeryPage();
}

class _StateSummeryPage extends State<ChangeSummerPage> {
  String _nameTable = "";
  int _countNum = 0;

  bool isButtonActive = true;
  bool isButtonActive2 = true;

  @override
  void initState() {
    super.initState();
    getName();
    getCounts();
  }

  void getName() async {
    final SharedPreferences getNameTab = await SharedPreferences.getInstance();
    setState(() {
      _nameTable = getNameTab.getString("saveTable") ?? "-";
    });
  }

  void getCounts() async {
    final SharedPreferences getCounts = await SharedPreferences.getInstance();
    setState(() {
      _countNum = getCounts.getInt("key") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, oreintation, deviceType) {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewBarPage()));
              }),
          title: Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 18,
            ),
            child: Text(
              "Order Summary",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.mode_edit_outline_rounded,
                    color: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InputCustomer()));
                }),
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
                      Text(
                        "No.of Customers",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        "Table No",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        "Served By",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal * 7),
                        child: Text(
                          "$_countNum",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal * 8),
                        child: Text(
                          "$_nameTable",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Text(
                        "Rizal",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 0.2),
            Container(
              height: SizeConfig.blockVertical * 47,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: ListView(
                children:
                    cartProvider.carts.map((cart) => CartPage(cart)).toList(),
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
                    ),
                  ),
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
                            child: const Text(
                              "0",
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
                                                    ViewMenu()));
                                      } else if (cartProvider
                                          .carts.isNotEmpty) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const ViewMenu()));
                                      }
                                      setState(() {
                                        isButtonActive = false;
                                        _countNum = 0;
                                        _nameTable = "-";
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
                                        setState(() {
                                          isButtonActive2 = false;
                                        });
                                      } else if (cartProvider
                                          .carts.isNotEmpty) {}
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

class CartPage extends StatefulWidget {
  final CartModel cartModel;
  CartPage(this.cartModel);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String noteMenu = "";

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getNotes() async {
    final SharedPreferences getNote = await SharedPreferences.getInstance();
    noteMenu = getNote.getString("Notes") ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
        if (_n != 0) {
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
                      child: Text("Notes : " + "$noteMenu",
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
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ViewBar()));
                                        break;
                                      case 'Outdoor':
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ViewBar2()));
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
                                'Table : ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 15,
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
                                      "",
                                      style: TextStyle(
                                        fontFamily: ' Montserrat',
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  elevation: 0,
                                  items: _dropDownItem2(),
                                  onChanged: (value) {
                                    switch (value) {
                                      case '':
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ViewBar()));
                                        break;
                                      case '':
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ViewBar2()));
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
                const Text(
                  "2x",
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
                    widget.cartModel.product.hargaProduct.toString(),
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
                    "$noteMenu",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}

List<DropdownMenuItem<String>> _dropDownItem2() {
  List<String> dll = ['', ''];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}
