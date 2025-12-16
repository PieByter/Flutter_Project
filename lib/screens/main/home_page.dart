import 'package:flutter/material.dart';

import '../../config/preview_config.dart';

@AppPreview(name: 'Home Page', group: 'Home')
Widget homePagePreview() {
  return const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {'icons': Icons.fastfood, 'title': 'Makanan'},
    {'icons': Icons.local_drink, 'title': 'Minuman'},
    {'icons': Icons.shopping_cart, 'title': 'Pesanan'},
    {'icons': Icons.history, 'title': 'Riwayat'},
    {'icons': Icons.account_balance_wallet, 'title': 'Dompet'},
    {'icons': Icons.person, 'title': 'Profil'},
    {'icons': Icons.info, 'title': 'Informasi'},
    {'icons': Icons.settings, 'title': 'Pengaturan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Saldo Anda",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rp 150.000",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.account_balance_wallet,
                    size: 40,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // CircleAvatar(
                          //   radius: 28,
                          //   backgroundColor: Colors.green[100],
                          //   child: Icon(
                          //     item['icons'],
                          //     size: 28,
                          //     color: Colors.green[800],
                          //   ),
                          // ),
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Sudut rounded
                            ),
                            child: Icon(
                              item['icons'],
                              size: 28,
                              color: Colors.green[800],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['title'],
                            style: const TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
