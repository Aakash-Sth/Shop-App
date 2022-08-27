import 'package:flutter/material.dart';
import 'package:shop_app_project/screens/product_detail_screen.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 240,
      width: MediaQuery.of(context).size.width * 0.424,
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.route, arguments: product);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Card(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        product.imageUrl,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FittedBox(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        product.price,
                        style: const TextStyle(
                            color: Color(0xFFFE3A30),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 0.2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.star,
                                color: Color(0xFFFFC120), size: 12),
                            Text(
                              product.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2),
                            ),
                          ]),
                      Text("${product.reviews} Reviews",
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2)),
                      SizedBox(
                        width: 25,
                        height: 30,
                        child: PopupMenuButton(
                            iconSize: 20,
                            padding: const EdgeInsets.only(right: 5),
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem<int>(
                                  value: 0,
                                  child: Text("Item Menu"),
                                ),
                              ];
                            }),
                      )
                    ],
                  ),
                )
              ]))),
    );
  }
}
