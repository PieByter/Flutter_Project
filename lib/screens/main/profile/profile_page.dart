import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: ListView(
          shrinkWrap: true,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            const SizedBox(height: 16),
            Card(
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(24),
              //     topRight: Radius.circular(24),
              //   ),
              // ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Nama User',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'user@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Divider(height: 32),
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Edit Profil'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.business),
                      title: const Text('Company Profile'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('History Transaksi'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: Text(
                '${DateTime.now().year} © Copyright. All right Reserved',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
