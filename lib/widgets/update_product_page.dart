import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';

class UpdateProductPage extends StatefulWidget {
  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical * 2,
                left: SizeConfig.blockHorizontal * 2),
            height: SizeConfig.blockVertical * 6,
            width: SizeConfig.blockHorizontal * 100,
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewBar()));
                  },
                  child: Icon(
                    Icons.chevron_left,
                  )),
            ]),
          ),
        ],
      );
    }

    Widget image() {
      return Container(
        height: SizeConfig.blockVertical * 45,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
                height: SizeConfig.blockVertical * 23,
                width: SizeConfig.blockHorizontal * 100,
                child: Image.asset("images/no_image.png")),
            SizedBox(height: SizeConfig.blockVertical * 4),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 30),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 3),
            Container(
                margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 48),
                child: Text(
                    "ini adalah text untuk deskripsi\nmenu yang tertara disini")),
          ],
        ),
      );
    }

    Widget notes() {
      return Container(
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal * 58,
                  top: SizeConfig.blockVertical * 2),
              child: Text(
                "Additional Notes  :",
                style: TextStyle(
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
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "   Contoh : Pedas Manis",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addChart() {
      return Container(
        height: SizeConfig.blockVertical * 13.5,
        width: SizeConfig.blockHorizontal * 100,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.blockHorizontal * 3),
            TextButton(
                onPressed: () {},
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text("-",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade900))),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                )),
            SizedBox(width: SizeConfig.blockHorizontal * 5),
            Text(""),
            SizedBox(width: SizeConfig.blockHorizontal * 5),
            TextButton(
                onPressed: () {},
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text("+",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade900))),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                )),
            SizedBox(width: SizeConfig.blockHorizontal * 5),
            Container(
              width: SizeConfig.blockHorizontal * 47,
              height: SizeConfig.blockVertical * 9,
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        backgroundColor: Colors.green,
                        content: Text(
                          "Update Success",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text("Update Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
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
          addChart(),
        ],
      ),
    );
  }
}
