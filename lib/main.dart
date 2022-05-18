import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/transactionModel.dart';
import 'package:flutter_mobile/providers/authService.dart';
import 'package:flutter_mobile/providers/cartProduct.dart';
import 'package:flutter_mobile/providers/categoryProduct.dart';
import 'package:flutter_mobile/providers/maredTable.dart';
import 'package:flutter_mobile/providers/moveTable.dart';
import 'package:flutter_mobile/providers/orderProduct.dart';
import 'package:flutter_mobile/providers/posSetting.dart';
import 'package:flutter_mobile/providers/productProvider.dart';
import 'package:flutter_mobile/providers/sectionTable,.dart';
import 'package:flutter_mobile/providers/tableProvider.dart';
import 'package:flutter_mobile/providers/transactionProvider.dart';
import 'package:flutter_mobile/providers/userServer.dart';
import 'package:flutter_mobile/widgets/customerCount/input_customer_count.dart';
import 'package:flutter_mobile/widgets/loginPage/login_page.dart';
import 'package:flutter_mobile/widgets/splash_screen.dart';
import 'package:flutter_mobile/widgets/summaryPage/afterOrder/change_summerypage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProviders(),
          ),
          ChangeNotifierProvider(
            create: (context) => TableProviders(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductProviders(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductCategorys(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SectionTable(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderUser(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MargeProviders(),
          ),
          ChangeNotifierProvider(
            create: (context) => MoveProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PosProviders(),
          ),
          ChangeNotifierProvider(
            create: (context) => TransactionProvider(),
          ),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
          '/': (context) => const SplashScreen(),
          '/Login': (context) => const LoginPage(),
          '/inputCount': (context) => const InputCount(),
          '/changeSummary': (context) => const ChangeSummeryPage(),
        }),
      );
    });
  }
}
