import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String duration;

  const OfferCard(this.title, this.duration);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, bottom: 20),
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Container(width: MediaQuery.of(context).size.width * 0.84),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.24,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/cardBackground.png',
                  fit: BoxFit.cover,
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            ),
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.8),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        duration,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ]),
              decoration: const BoxDecoration(
                  color: Color(0xFF3669C9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            )
          ],
        ),
      ),
    );
  }
}
