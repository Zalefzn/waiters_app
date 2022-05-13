import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/providers/transaction_provider.dart';
import 'package:flutter_mobile/screens/customer%20count/input_customer_count.dart';
import 'package:flutter_mobile/widgets/summery%20page/ordered_product_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SummaryOrderPage extends StatefulWidget {
  @override
  State<SummaryOrderPage> createState() => _SummaryOrderPage();
}

class _SummaryOrderPage extends State<SummaryOrderPage> {
  String _tableName = "";
  int _tableCustomerCount = 1;

  bool isButtonActive = true;
  bool isButtonActive2 = true;

  @override
  void initState() {
    getTableData();
  }

  void getTableData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      _tableName = preferences.getString("saveTable") ?? "-";
      _tableCustomerCount = preferences.getInt("key") ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);

    Widget ContainerApp() {
      return Container(
        height: SizeConfig.blockVertical * 9,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: backgroundClor,
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
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 7),
                  child: Text("$_tableCustomerCount",
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                    margin:
                    EdgeInsets.only(left: SizeConfig.blockHorizontal * 8),
                    child: Text(
                      _tableName,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                const Text("-",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonOrder() {
      return Stack(
        children: [
          Container(
            height: SizeConfig.blockVertical * 17,
            width: SizeConfig.blockHorizontal * 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
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
                        transactionProvider.subtotal().toString(),
                        style: const TextStyle(
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
                      width: SizeConfig.blockHorizontal * 42,
                      child: ElevatedButton(
                        onPressed: () async {
                          return;
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: buttonColor3,
                          onPrimary: textColor3,
                          elevation: 0,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 6),
                      height: SizeConfig.blockVertical * 7,
                      width: SizeConfig.blockHorizontal * 42,
                      child: ElevatedButton(
                        onPressed: () async {
                          return;
                        },
                        child: const Text(
                          "Order",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: buttonColor3,
                          onPrimary: buttonNavbar2,
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

    Widget listCart() {
      return Container(
        height: SizeConfig.blockVertical * 50,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Stack(children: [
          Container(
            child: ListView(
              children: transactionProvider.transactionProducts.map((item) => OrderedProductCard(item)).toList()
            ),
          )
        ]),
      );
    }
    
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: backgroundClor,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 18),
            child: Text(
              "Order Summary",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.mode_edit_rounded, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InputCustomer()));
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerApp(),
            listCart(),
            buttonOrder(),
          ],
        ),
      );
    });

  }
}