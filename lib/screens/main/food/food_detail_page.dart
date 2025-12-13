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
              child: food.gambarMakanan != null
                  ? Image.network(
                      food.gambarMakanan!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.fastfood, size: 80),
                    ),
            ),
            const SizedBox(height: 24),
            Text(
              food.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(food.deskripsi ?? '-', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'Harga: Rp${food.harga}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Stok: ${food.stok}', style: const TextStyle(fontSize: 18)),
            if (food.deskripsi != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  food.deskripsi!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
