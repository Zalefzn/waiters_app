import 'dart:async';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //getProducts();
    //getTab();

    Timer(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, '/Login'));
    super.initState();
  }

  //getProducts() async {
  //await Provider.of<ProductProviders>(context, listen: false).getData();
  //}

  //getTab() async {
  //await Provider.of<TableProviders>(context, listen: false).getTable();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 130,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/logo.png"))),
            ),
          ],
        ),
      ),
    );
  }
}
