
import 'package:flutter/material.dart';
import '../model/special_offer.dart';

class SpecialOfferWidget extends StatelessWidget {
  const SpecialOfferWidget(
      this.context, {
        Key? key,
        required this.data,
        required this.index,
      }) : super(key: key);

  final SpecialOffer data;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              data.icon,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 8),
              child: Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                data.detail,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 8),
              child: Text(
                data.discount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}