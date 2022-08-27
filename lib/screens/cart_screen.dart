import 'package:flutter/material.dart';
import 'package:shop_app_project/models/product.dart';
import 'package:shop_app_project/widgets/product_item.dart';

import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  static const route = "/cartScreen";
  final ValueNotifier<bool> badgeVisible;

  const CartScreen(this.badgeVisible);
  static List<Product> cartItems = [];

  static void addToCart(Product p) {
    cartItems.add(p);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreen.appBar(context, "Cart", badgeVisible),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.65),
            itemBuilder: (context, index) {
              return ProductItem(
                CartScreen.cartItems[index],
              );
            },
            itemCount: CartScreen.cartItems.length),
      ),
    );
  }
}
