import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
import 'package:flutter_mobile/widgets/customerCount/input_customer_count.dart';
import 'package:flutter_mobile/widgets/summaryPage/afterOrder/change_summary_cartPage.dart';
import 'package:flutter_mobile/widgets/tablePage/afterOrderTab/page_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class ChangeSummeryPage extends StatefulWidget {
  const ChangeSummeryPage({Key? key}) : super(key: key);
  State<ChangeSummeryPage> createState() => _StateSummeryPage();
}

class _StateSummeryPage extends State<ChangeSummeryPage> {
  String _nameTable = "";
  int _countNum = 1;
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
      _countNum = getCounts.getInt("key") ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return Container(
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
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 7),
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
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 8),
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
                  "-",
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
      );
    }

    Widget addMore() {
      return Container(
        padding: EdgeInsets.all(10),
        height: SizeConfig.blockVertical * 8,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("enything else ?",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Montserrat')),
            Container(
                height: SizeConfig.blockVertical * 8,
                width: SizeConfig.blockHorizontal * 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.indigoAccent.shade400)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewMenuGrid()));
                    },
                    child: Text("Add More",
                        style:
                            TextStyle(color: Colors.indigoAccent.shade400)))),
          ],
        ),
      );
    }

    Widget cartProduct() {
      return Container(
        height: SizeConfig.blockVertical * 46,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: ListView(
          children: cartProvider.carts.map((cart) => CartPage(cart)).toList(),
        ),
      );
    }

    Widget subTotal() {
      return Stack(
        children: [
          Container(
            height: SizeConfig.blockVertical * 15,
            width: SizeConfig.blockHorizontal * 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 3),
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
                          left: SizeConfig.blockHorizontal * 50,
                          top: SizeConfig.blockVertical * 3),
                      child: Text(
                        cartProvider.totalPrice().toString(),
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
                      margin:
                          EdgeInsets.only(left: SizeConfig.blockHorizontal * 5),
                      height: SizeConfig.blockVertical * 7,
                      width: SizeConfig.blockHorizontal * 90,
                      child: ElevatedButton(
                        onPressed: isButtonActive
                            ? () {
                                if (cartProvider.carts.isEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewTable()));
                                } else if (cartProvider.carts.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewTable()));
                                }
                                setState(() {
                                  isButtonActive = false;
                                  _countNum = 0;
                                  _nameTable = "-";
                                });
                              }
                            : null,
                        child: const Text(
                          "Home",
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
      );
    }

    SizeConfig().init(context);
    return Sizer(builder: (context, oreintation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
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
                            builder: (context) => const InputCount()));
                  }),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header(),
              SizedBox(height: SizeConfig.blockVertical * 0.5),
              addMore(),
              SizedBox(height: SizeConfig.blockVertical * 0.5),
              cartProduct(),
              SizedBox(height: SizeConfig.blockVertical * 5),
              subTotal(),
            ],
          ));
    });
  }
}
