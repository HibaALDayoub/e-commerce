import 'package:flutter/material.dart';

class CustomAppBar_ extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedIcon1;
  final void Function()? onPressedIcon2;
  const CustomAppBar_(
      {super.key,
      required this.titleAppBar,
      this.onPressedIcon1,
      this.onPressedIcon2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: titleAppBar),
              ),
            )),
        Expanded(
          flex: 1,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            padding: const EdgeInsets.all(3),
            child: IconButton(
                iconSize: 25,
                onPressed: onPressedIcon1,
                icon: const Icon(Icons.shopping_cart_outlined)),
            // child: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.all(3),
            child: IconButton(
                iconSize: 25,
                onPressed: onPressedIcon2,
                icon: const Icon(Icons.notifications_none)),
          ),
        ),
        // widget for اعلان
      ],
    );
  }
}
