import 'package:flutter/material.dart';
import '../../../models/food.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                food.gambar,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              food.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(food.deskripsi),
            const SizedBox(height: 16),
            Text(
              'Harga: Rp${food.harga}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Stok: ${food.stok}', style: const TextStyle(fontSize: 18)),
            if (food.keterangan != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  food.keterangan!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
