import 'package:flutter/material.dart';

class OrderCheckoutPage extends StatelessWidget {
  const OrderCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {'nama': 'Nasi Goreng', 'jumlah': 2, 'harga': 15000},
      {'nama': 'Mie Ayam', 'jumlah': 1, 'harga': 12000},
    ];

    int total = cartItems.fold(
      0,
      (sum, item) => sum + (item['jumlah'] * item['harga'] as int),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout Order')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['nama']),
                      subtitle: Text(
                        'Jumlah: ${item['jumlah']}, Harga: ${item['harga']}',
                      ),
                      trailing: Text('Rp${item['harga']} * ${item['jumlah']}'),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order berhasil diproses!')),
                  );
                },
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
