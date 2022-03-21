import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/auth_providers.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/widgets/login_page.dart';
import 'package:flutter_mobile/widgets/splash_screen.dart';
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
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
          ),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
          '/': (context) => const SplashScreen(),
          '/Login': (context) => const LoginPage(),
        }),
      );
    });
  }
}
