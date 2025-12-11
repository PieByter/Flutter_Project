import 'package:flutter/material.dart';

class CouponPages extends StatelessWidget {
  const CouponPages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> coupons = [
      {
        'title': 'Diskon 10%',
        'desc': 'Dapatkan diskon 10% untuk semua makanan.',
        'code': 'MAKAN10',
      },
      {
        'title': 'Gratis Minuman',
        'desc': 'Beli makanan apa saja, gratis 1 minuman',
        'code': 'MINUMANGRATIS',
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Kupon Saya')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          final coupon = coupons[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const Icon(
                Icons.card_giftcard,
                color: Colors.orange,
                size: 36,
              ),
              title: Text(
                coupon['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coupon['desc'] ?? ''),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      coupon['code'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
