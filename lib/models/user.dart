class User {
  final String id, nama, email, role;

  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    nama: json['nama'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
  );
}
