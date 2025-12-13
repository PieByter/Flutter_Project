class Food {
  final int id;
  final String kode;
  final String nama;
  final String? deskripsi;
  final int harga;
  final int stok;
  final String? gambarMakanan;
  final String status;
  final bool isAvailable;
  final String tipeMenu;
  final int tambahanBayar;

  Food({
    required this.id,
    required this.kode,
    required this.nama,
    this.deskripsi,
    required this.harga,
    required this.stok,
    this.gambarMakanan,
    required this.status,
    required this.isAvailable,
    required this.tipeMenu,
    required this.tambahanBayar,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'],
    kode: json['kode'],
    nama: json['nama'],
    deskripsi: json['deskripsi'],
    harga: json['harga'],
    stok: json['stok'],
    gambarMakanan: json['gambar_makanan'],
    status: json['status'],
    isAvailable: json['is_available'] ?? false,
    tipeMenu: json['tipe_menu'],
    tambahanBayar: json['tambahan_bayar'],
  );
}
