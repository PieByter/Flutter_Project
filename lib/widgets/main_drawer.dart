import 'package:flutter/material.dart';
import '../screens/authentication/login_page.dart';

class MainDrawer extends StatelessWidget {
  final Function(int) onMenuTap;
  const MainDrawer({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Menu Kantin',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Title 1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Halaman Utama'),
                    onTap: () {
                      onMenuTap(0);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ListTile(
                    leading: const Icon(Icons.app_registration),
                    title: const Text('Halaman Pemesanan'),
                    onTap: () {
                      onMenuTap(1);
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Title 2
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Title 2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood),
                    title: const Text('Riwayat Transaksi'),
                    onTap: () {
                      onMenuTap(2);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profil'),
                    onTap: () {
                      onMenuTap(3);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
            tileColor: Colors.red,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            minVerticalPadding: 25.0,
          ),
        ],
      ),
    );
  }
}
