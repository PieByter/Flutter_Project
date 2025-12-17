import 'package:flutter/material.dart';
// import '../../../models/food.dart';
import '../../../models/transaction.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Transaksi')),
      body: ListView.builder(
        itemCount: dummyTransactions.length,
        itemBuilder: (context, index) {
          final trx = dummyTransactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('ID Transaksi : ${trx.id}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tanggal : ${trx.tanggal}'),
                  Text('Item : ${trx.items.join(', ')}'),
                  Text('Total: Rp${trx.total}'),
                ],
              ),
              isThreeLine: true,
              leading: const Icon(Icons.receipt_long),
            ),
          );
        },
      ),
    );
  }
}
