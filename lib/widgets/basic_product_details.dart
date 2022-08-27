import 'package:flutter/material.dart';

import '../models/product.dart';

class BasicProductDetails extends StatelessWidget {
  final Product product;

  const BasicProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 70, top: 10),
            // width: 300,
            child: Image.asset(
              product.imageUrl,
              height: 250, //150
              fit: BoxFit.fill,
              alignment: Alignment.centerRight,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            product.title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.2),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            product.price,
            style: const TextStyle(
                color: Color(0xFFFE3A30),
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: 0.2),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.star,
                          color: Color(0xFFFFC120), size: 14), //12
                      Text(
                        product.rating.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Text("${product.reviews} Reviews",
                    style: Theme.of(context).textTheme.headline6),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                    color: const Color(0xFFEEFAF6),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Tersedia : ${product.quantity}",
                  style: const TextStyle(
                    color: Color(0xFF3A9B7A),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.3,
                  ),
                ),
              )
            ],
          )
        ]);
  }
}
