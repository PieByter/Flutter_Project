import 'package:flutter/material.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Navigator.pop(context),
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/logo.png', // Pastikan path asset benar
                fit: BoxFit.fill,
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 16),
                  Text(
                    'Tentang Perusahaan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Project Kantin adalah aplikasi modern untuk memudahkan transaksi di kantin sekolah dan kantor. '
                    'Kami berkomitmen memberikan layanan terbaik dengan teknologi terkini, keamanan data, dan kemudahan penggunaan.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Visi & Misi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visi: Menjadi solusi digital terbaik untuk kantin di Indonesia.\n'
                    'Misi: Memberikan kemudahan, keamanan, dan inovasi dalam setiap transaksi.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
