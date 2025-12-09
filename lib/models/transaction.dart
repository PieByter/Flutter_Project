class Transaction {
  final String id;
  final String tanggal;
  final int total;
  final List<String> items;

  Transaction({
    required this.id,
    required this.tanggal,
    required this.total,
    required this.items,
  });
}

final List<Transaction> dummyTransactions = [
  Transaction(
    id: 'T001',
    tanggal: '2025-12-09',
    total: 35000,
    items: ['Nasi Goreng', 'Es Teh'],
  ),
  Transaction(
    id: 'T002',
    tanggal: '2025-12-08',
    total: 35000,
    items: ['Mie Ayam'],
  ),
  Transaction(
    id: 'T003',
    tanggal: '2025-12-07',
    total: 35000,
    items: ['Soto Ayam', 'Es Jeruk', 'Kerupuk'],
  ),
];
