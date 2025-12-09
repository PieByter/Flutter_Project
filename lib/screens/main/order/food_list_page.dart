import '../../../models/food.dart';
import 'package:flutter/material.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Makanan')),
      // body: ListView.builder(
      //   itemCount: dummyFoods.length,
      //   itemBuilder: (context, index) {
      //     final food = dummyFoods[index];
      //     return Card(
      //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //       child: ListTile(
      //         leading: Image.network(
      //           food.gambar,
      //           width: 56,
      //           height: 56,
      //           fit: BoxFit.cover,
      //         ),
      //         title: Text(food.nama),
      //         subtitle: Text(
      //           '${food.deskripsi}\nHarga: Rp${food.harga} | Stok: ${food.stok}',
      //         ),
      //         isThreeLine: true,
      //         trailing: Text('Stok: ${food.stok}'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (_) => FoodDetailPage(food: food)),
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyFoods.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8, // atur rasio tinggi/lebar card
        ),
        itemBuilder: (context, index) {
          final food = dummyFoods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FoodDetailPage(food: food)),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    food.gambar,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.nama,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food.deskripsi,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text('Harga: Rp${food.harga}'),
                        Text('Stok: ${food.stok}'),
                      ],
                    ),
                  ),
                ],
              ),
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
