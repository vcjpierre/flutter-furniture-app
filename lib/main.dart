import 'package:flutter/material.dart';
import 'pages/product.dart';
import 'pages/home.dart';
import 'pages/user.dart';
import 'pages/cart.dart';

void main() => runApp(FurnitureApp());

class FurnitureApp extends StatelessWidget {
  final pages = <String, WidgetBuilder>{
    MainPage.tag: (context) => MainPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MainPage(),
      routes: pages,
    );
  }
}

class MainPage extends StatefulWidget {
  static String tag = 'ana-sayfa';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            new HomePage(),
            new ProductPage(),
            new CartPage(),
            new UserPage(),
          ],
        ),
        bottomNavigationBar: new TabBar(
          indicatorWeight: 2.0,
          tabs: [
            Tab(icon: Icon(Icons.home, color: Colors.grey)),
            Tab(icon: Icon(Icons.event_seat, color: Colors.grey)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            Tab(icon: Icon(Icons.person, color: Colors.grey)),
          ],
          labelColor: Colors.grey,
          unselectedLabelColor: Colors.white30,
          indicatorColor: Colors.yellow,
        ),
      ),
    );
  }
}
