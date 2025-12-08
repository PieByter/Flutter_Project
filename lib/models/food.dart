class Food {
  final String id, nama, deskripsi, gambar;
  final int harga, stok;
  final String? keterangan;

  Food({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.harga,
    required this.stok,
    this.keterangan,
  });
}

final List<Food> dummyFoods = [
  Food(
    id: '1',
    nama: 'Nasi Goreng',
    deskripsi: 'Nasi goreng special dengan telur dan ayam',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 15000,
    stok: 10,
  ),
  Food(
    id: '2',
    nama: 'Mie Ayam',
    deskripsi: 'Mie ayam special dengan pangsit dan bakso',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 12000,
    stok: 8,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
  Food(
    id: '3',
    nama: 'Bihun Goreng',
    deskripsi: 'Bihun goreng special dengan sayuran dan telur',
    gambar: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    harga: 13000,
    stok: 15,
  ),
];
