import '../models/food.dart';
import 'package:flutter/material.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Makanan')),
      body: ListView.builder(
        itemCount: dummyFoods.length,
        itemBuilder: (context, index) {
          final food = dummyFoods[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(
                food.gambar,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
              title: Text(food.nama),
              subtitle: Text(
                '${food.deskripsi}\nHarga: Rp${food.harga} | Stok: ${food.stok}',
              ),
              isThreeLine: true,
              trailing: Text('Stok: ${food.stok}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FoodDetailPage(food: food)),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Tambah Makanan',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
