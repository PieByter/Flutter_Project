import 'package:flutter/material.dart';
import '../../../config/preview_config.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

@AppPreview(name: 'Edit Profile', group: 'Profile')
Widget editProfilePreview() {
  return const MaterialApp(
    home: EditProfilePage(),
    debugShowCheckedModeBanner: false,
  );
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final _namaC = TextEditingController(text: 'Nama User');
  final _nikC = TextEditingController(text: '12345677890');
  final _emailC = TextEditingController(text: 'user@gmail.com');
  final _telpC = TextEditingController(text: '08123456789');
  final _alamatC = TextEditingController(text: 'Jl. Mawar No. 1');
  final _tglLahirC = TextEditingController(text: '1995-01-01');
  final _tglGabungC = TextEditingController(text: '2022-05-10');
  final _jabatanC = TextEditingController(text: 'Staff');
  final _bagianC = TextEditingController(text: 'Operasional');
  final _penempatanC = TextEditingController(text: 'Jakarta');
  final _keteranganC = TextEditingController(text: '—');
  final _kuponTersediaC = TextEditingController(text: '12');
  final _kuponTerpakaiC = TextEditingController(text: '5');
  final _kuponBatalC = TextEditingController(text: '1');
  final _gambarC = TextEditingController(text: 'assets/images/profile.png');

  @override
  void dispose() {
    _namaC.dispose();
    _nikC.dispose();
    _emailC.dispose();
    _telpC.dispose();
    _alamatC.dispose();
    _tglLahirC.dispose();
    _tglGabungC.dispose();
    _jabatanC.dispose();
    _bagianC.dispose();
    _penempatanC.dispose();
    _keteranganC.dispose();
    _kuponTersediaC.dispose();
    _kuponTerpakaiC.dispose();
    _kuponBatalC.dispose();
    _gambarC.dispose();
    super.dispose();
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
        _gambarC.text = image.path;
      });
    }
  }

  Future<void> _pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
        _gambarC.text = image.path;
      });
    }
  }

  Widget _section(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController c, {
    TextInputType? type,
    bool obscure = false,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        obscureText: obscure,
        readOnly: readOnly,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (v) =>
            (v == null || v.isEmpty) ? '$label tidak boleh kosong' : null,
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  Widget _dateField(
    String label,
    TextEditingController c,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () => _selectDate(context, c),
        validator: (v) =>
            (v == null || v.isEmpty) ? '$label tidak boleh kosong' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              _section('Gambar Profil', [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: _profileImage != null
                            ? ClipOval(
                                child: kIsWeb
                                    ? Image.network(
                                        _profileImage!.path,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, _, _) =>
                                            const Icon(Icons.person, size: 60),
                                      )
                                    : Image.file(
                                        _profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                              )
                            : const Icon(Icons.person, size: 60),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickFromGallery,
                            icon: const Icon(Icons.photo),
                            label: const Text('Galeri'),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: _pickFromCamera,
                            icon: const Icon(Icons.camera_alt),
                            label: const Text('Kamera'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              _section('Akun', [
                _field('Nama', _namaC),
                _field('Email', _emailC, type: TextInputType.emailAddress),
              ]),
              _section('Kontak', [
                _field('Nomor Telepon', _telpC, type: TextInputType.phone),
                _field('Alamat', _alamatC, type: TextInputType.streetAddress),
              ]),
              _section('Identitas', [
                _field('NIK', _nikC, type: TextInputType.number),
                _dateField('Tanggal Lahir', _tglLahirC, context),
              ]),
              _section('Pekerjaan', [
                _field('Jabatan', _jabatanC),
                _field('Bagian', _bagianC),
                _field('Penempatan', _penempatanC),
                _dateField('Tanggal Bergabung', _tglGabungC, context),
                _field('Keterangan', _keteranganC),
              ]),
              _section('Kupon', [
                _infoRow('Kupon Tersedia', _kuponTersediaC.text),
                _infoRow('Kupon Terpakai', _kuponTerpakaiC.text),
                _infoRow('Kupon Dibatalkan', _kuponBatalC.text),
              ]),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data tersimpan')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
