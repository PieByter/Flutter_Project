import 'package:flutter/material.dart';
import 'package:project_kantin/screens/main/coupon/coupon_pages.dart';
import 'screens/authentication/login_page.dart';
import 'screens/main/order/order_page.dart';
import 'screens/main/home_page.dart';
import 'screens/main/transaction/transaction_page.dart';
import 'screens/main/profile/profile_page.dart';
import 'widgets/main_bottom_nav.dart';
import 'screens/main/order/order_checkout_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Apps',
      home: widget.isLoggedIn
          ? MainNavigationPage(onThemeChanged: _changeTheme)
          : const LoginPage(),
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
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  final void Function(bool)? onThemeChanged;
  const MainNavigationPage({super.key, this.onThemeChanged});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  final int cartCount = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Buat list pages di dalam build() agar dapat akses widget.onThemeChanged
    final List<Widget> pages = [
      const HomePage(),
      const OrderPage(),
      const CouponPages(),
      const TransactionPage(),
      ProfilePage(onThemeChanged: widget.onThemeChanged), // ✅ Kirim callback
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 40), // Tanpa ../
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Badge(
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderCheckoutPage()),
              );
            },
            tooltip: 'Keranjang Belanja',
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Cari',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
            tooltip: 'Notifikasi',
          ),
        ],
      ),
      body: pages[_selectedIndex], // ✅ Ganti _pages jadi pages
      bottomNavigationBar: MainBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
