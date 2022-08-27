import 'package:flutter/material.dart';
import 'package:shop_app_project/screens/cart_screen.dart';
import 'package:shop_app_project/screens/home_screen.dart';
import 'package:shop_app_project/widgets/basic_product_details.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const route = "/productDetail";
  final ValueNotifier<bool> badgeVisible;

  const ProductDetailScreen(this.badgeVisible);

  final Function addToCart = CartScreen.addToCart;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
        appBar: HomeScreen.appBar(context, "Product Detail", badgeVisible),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicProductDetails(product),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Color(0xFFEDEDED),
                      thickness: 0.9,
                    ),
                  ),
                  const Text(
                    "Product Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.2),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                        height: 1.5),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          addToCart(product);
                          badgeVisible.value = true;
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF3669C9))),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
