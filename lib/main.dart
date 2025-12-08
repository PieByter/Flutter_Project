import 'package:flutter/material.dart';
import 'screens/authentication/login_page.dart';
import 'screens/authentication/register_page.dart';
import 'screens/food_list_page.dart';
import 'widgets/main_drawer.dart';
import 'widgets/main_bottom_nav.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const LoginPage(),
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
  final List<Widget> _pages = [LoginPage(), RegisterPage(), FoodListPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kantin Apps')),
      drawer: MainDrawer(
        onMenuTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // child: ListView(
        //   padding: EdgeInsets.zero,
        //   children: [
        //     DrawerHeader(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: NetworkImage(
        //             'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        //           ),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           CircleAvatar(
        //             radius: 32,
        //             backgroundImage: NetworkImage(
        //               'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        //             ),
        //           ),
        //           const SizedBox(height: 12),
        //           const Text(
        //             'Menu Kantin',
        //             style: TextStyle(color: Colors.white, fontSize: 24),
        //           ),
        //         ],
        //       ),
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.login),
        //       title: const Text('Login'),
        //       onTap: () {
        //         setState(() {
        //           _selectedIndex = 0;
        //           Navigator.pop(context);
        //         });
        //       },
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.app_registration),
        //       title: const Text('Register'),
        //       onTap: () {
        //         setState(() {
        //           _selectedIndex = 1;
        //           Navigator.pop(context);
        //         });
        //       },
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.fastfood),
        //       title: const Text('FoodList'),
        //       onTap: () {
        //         setState(() {
        //           _selectedIndex = 2;
        //           Navigator.pop(context);
        //         });
        //       },
        //     ),
        //   ],
        // ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MainBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.login),
      //       label: 'Login',
      //       backgroundColor: Colors.green,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.app_registration),
      //       label: 'Register',
      //       backgroundColor: Colors.red,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.fastfood),
      //       label: 'FoodList',
      //       backgroundColor: Colors.orange,
      //     ),
      //   ],
      // ),
    );
  }
}
