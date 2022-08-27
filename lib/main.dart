import 'package:flutter/material.dart';
import 'package:shop_app_project/screens/cart_screen.dart';
import 'package:shop_app_project/screens/product_detail_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBadgeVisible =
        ValueNotifier(CartScreen.cartItems.isEmpty ? false : true);

    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.7,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.16),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2)),
          fontFamily: 'DMSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              )),
          canvasColor: Colors.white),
      routes: {
        '/': (context) => HomeScreen(cartBadgeVisible),
        CartScreen.route: (context) => CartScreen(cartBadgeVisible),
        ProductDetailScreen.route: (context) =>
            ProductDetailScreen(cartBadgeVisible)
      },
    );
  }
}
