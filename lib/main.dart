import 'package:flutter/material.dart';
import 'pages/product.dart';
import 'pages/home.dart';
import 'pages/user.dart';
import 'pages/cart.dart';

void main() => runApp(FurnitureApp());

class FurnitureApp extends StatelessWidget {
  final pages = <String, WidgetBuilder>{
    MainPage.tag: (context) => const MainPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MainPage(),
      routes: pages,
    );
  }
}

class MainPage extends StatefulWidget {
  static String tag = 'ana-sayfa';
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  TabController get _controller {
    return _tabController ??= TabController(length: 4, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          const HomePage(),
          const ProductPage(),
          const CartPage(),
          const UserPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _controller,
        indicatorWeight: 2.0,
        tabs: [
          const Tab(icon: Icon(Icons.home, color: Colors.grey)),
          const Tab(icon: Icon(Icons.event_seat, color: Colors.grey)),
          const Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
          const Tab(icon: Icon(Icons.person, color: Colors.grey)),
        ],
        labelColor: Colors.grey,
        unselectedLabelColor: Colors.white30,
        indicatorColor: Colors.yellow,
      ),
    );
  }
}
