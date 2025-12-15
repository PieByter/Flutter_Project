import '../../../models/food.dart';
import 'package:flutter/material.dart';
import 'food_detail_page.dart';
import '../../../services/food_service.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Makanan')),
      body: FutureBuilder<List<Food>>(
        future: fetchFoods(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          }
          final foods = snapshot.data ?? [];
          if (foods.isEmpty) {
            return const Center(child: Text('Tidak ada makanan tersedia'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: foods.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              if (index >= foods.length) return const SizedBox.shrink();
              final food = foods[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(food: food),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      food.gambarMakanan != null
                          ? Image.network(
                              food.gambarMakanan!,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: double.infinity,
                              height: 100,
                              color: Colors.grey[100],
                              child: const Icon(Icons.fastfood, size: 40),
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                food.deskripsi ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text('Rp${food.harga}'),
                              Text('Available ${food.stok}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
