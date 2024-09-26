import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.body, required this.title,  this.currentIndex=0});
final Widget? body;
final String title;
final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: body,
      appBar:customAppBar(context: context, title: title) ,
    );
  }
}