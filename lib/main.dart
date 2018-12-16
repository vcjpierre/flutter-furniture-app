import 'package:flutter/material.dart';
import './main_page.dart';

void main() => runApp(SocialApp());

class SocialApp extends StatelessWidget {
  final pages = <String, WidgetBuilder> {
    SocialHome.tag: (context) => SocialHome(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery',
      theme: ThemeData(
        fontFamily: 'Josefin',
        primarySwatch: Colors.yellow,
      ),
      home: SocialHome(),
      routes: pages,
    );
  }
}

