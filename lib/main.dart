import 'package:flutter/material.dart';
import 'package:project_kantin/screens/main/coupon/coupon_pages.dart';
import 'screens/authentication/login_page.dart';
import 'screens/main/order/order_page.dart';
import 'screens/main/home_page.dart';
import 'screens/main/transaction/transaction_page.dart';
import 'screens/main/profile/profile_page.dart';
import 'widgets/main_drawer.dart';
import 'widgets/main_bottom_nav.dart';
import 'screens/splash_screen.dart';
import 'screens/main/order/order_checkout_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Apps',
      home: isLoggedIn ? const MainNavigationPage() : const LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    CouponPages(),
    TransactionPage(),
    ProfilePage(),
  ];

  final int cartCount = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Kantin Apps'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: null,
        actions: [
          IconButton(
            icon: Badge(
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              // Navigator.pushNamed(context, '/order_checkout');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OrderCheckoutPage()),
              );
            },
            tooltip: 'Keranjang Belanja',
          ),
        ],
      ),
      drawer: MainDrawer(
        onMenuTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MainBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
