import 'package:flutter/material.dart';
import 'package:flutter_mobile/bloc/bloc_model_color.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:flutter_mobile/validation/change_page_view.dart';
import 'package:flutter_mobile/validation/menu_navbar.dart';
import 'package:flutter_mobile/validation/method.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class ChangeSummerPage extends StatefulWidget {
  const ChangeSummerPage({Key? key}) : super(key: key);
  State<ChangeSummerPage> createState() => _StateSummeryPage();
}

class _StateSummeryPage extends State<ChangeSummerPage> {
  @override
  Widget build(BuildContext context) {
    bool _isStatusActive = false;
    bool isButtonActive = true;
    bool isButtonActive2 = true;

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
                        child: const Text(
                          "07",
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
                        child: const Text(
                          "T-1",
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
                                                    const ViewMenu()));
                                      } else if (cartProvider
                                          .carts.isNotEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewMenu()));
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewBarPage()));
                                        //handleOrder();
                                        //showDialog(
                                        //context: context,
                                        //builder: (BuildContext context) =>
                                        //_buildPopDialog(context),
                                        //);
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

class CartPage extends StatefulWidget {
  final CartModel cartModel;
  CartPage(this.cartModel);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 11.5,
                      top: SizeConfig.blockVertical * 1),
                  child: const Text(
                    "Dimsum isi Cumi dan keju\nrasanya yang lezat kaya akan gizi\ndengan keju yang meleleh di dalamnya\nmembuat dimsum\nini menjadi yang paling favorite",
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
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: SizeConfig.blockVertical * 2,
                                          ),
                                          height: SizeConfig.blockVertical * 1,
                                          width:
                                              SizeConfig.blockHorizontal * 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.blockVertical * 3),
                                        Container(
                                          height: SizeConfig.blockVertical * 10,
                                          width:
                                              SizeConfig.blockHorizontal * 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              widget.cartModel.product
                                                      .nameProduct +
                                                  "-Void",
                                              style: const TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: SizeConfig.blockVertical * 7,
                                          width:
                                              SizeConfig.blockHorizontal * 90,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right:
                                                    SizeConfig.blockHorizontal *
                                                        40,
                                                top: SizeConfig.blockVertical *
                                                    2),
                                            child: const Text(
                                              "Reason :",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.blockVertical * 3),
                                        Container(
                                          height: SizeConfig.blockVertical * 35,
                                          width:
                                              SizeConfig.blockHorizontal * 90,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const TextField(
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '  Enter Reason',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: SizeConfig.blockVertical * 8,
                                          width:
                                              SizeConfig.blockHorizontal * 90,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Decrease Stock :",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                              Switch(
                                                  value: _isStatusActive,
                                                  activeColor: Colors
                                                      .indigoAccent.shade400,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _isStatusActive =
                                                          !_isStatusActive;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: SizeConfig.blockVertical * 15,
                                          width:
                                              SizeConfig.blockHorizontal * 90,
                                          margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockHorizontal * 3,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  add();
                                                },
                                                child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text("+",
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik',
                                                            fontSize: 35,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors
                                                                .indigoAccent
                                                                .shade400))),
                                              ),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockHorizontal *
                                                      3),
                                              Text(
                                                "$_n",
                                                style: const TextStyle(
                                                    fontFamily: 'Rubik',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                  width: SizeConfig
                                                          .blockHorizontal *
                                                      3),
                                              GestureDetector(
                                                onTap: () {
                                                  minus();
                                                },
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    child: Text("-",
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik',
                                                            fontSize: 35,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors
                                                                .indigoAccent
                                                                .shade400))),
                                              ),
                                              Container(
                                                height:
                                                    SizeConfig.blockVertical *
                                                        8,
                                                width:
                                                    SizeConfig.blockHorizontal *
                                                        50,
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .indigoAccent.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "Void Product",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Rubik',
                                                        color: Colors.white),
                                                  ),
                                                ),
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
                            child: Icon(Icons.inventory,
                                color: Colors.red, size: 25)),
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
