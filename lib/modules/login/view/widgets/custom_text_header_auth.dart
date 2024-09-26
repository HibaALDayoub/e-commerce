import 'package:flutter/material.dart';

class CustomTextHeaderAuth extends StatelessWidget {
  final String headerText;
  final String underHeaderText;
  const CustomTextHeaderAuth(
      {super.key, required this.headerText, required this.underHeaderText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              headerText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              underHeaderText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black38),
            ),
          ],
        ));
  }
}
