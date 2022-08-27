import 'package:flutter/material.dart';
import 'package:shop_app_project/widgets/offer_card.dart';
import 'package:shop_app_project/widgets/product_item.dart';

import '../dummy_data.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final ValueNotifier<bool> badgeVisible;

  const HomeScreen(this.badgeVisible);

  static PreferredSizeWidget appBar(
      BuildContext context, String title, ValueNotifier<bool> visible) {
    return AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: title == "Mega Mall"
              ? const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)
              : null,
        ),
        actions: [
          ValueListenableBuilder<bool>(
              valueListenable: visible,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(CartScreen.route);
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          )),
                    ),
                    Visibility(
                      visible: visible.value,
                      child: const Positioned(
                        right: 13,
                        top: 14.5,
                        child: Icon(
                          Icons.circle,
                          color: Color(0xFFFE3A30),
                          size: 10.5,
                        ),
                      ),
                    )
                  ],
                );
              })
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreen.appBar(context, "Mega Mall", badgeVisible),
      body: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: OfferCard(
                        "20% off\non Fridays", "August 20 - September 10"),
                  ),
                  OfferCard("Gatis Ongkir\nSelama PPKM!",
                      "Periode Mei - Agustus 2021"),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Featured Products",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.38),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3669C9)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return ProductItem(products[index]);
                            })),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
