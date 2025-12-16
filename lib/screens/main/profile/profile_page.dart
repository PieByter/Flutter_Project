import 'package:flutter/material.dart';
import 'package:project_kantin/screens/settings_pages.dart';
import '../../../helper/auth_helper.dart';
import 'company_profile_page.dart';
import '../../../config/preview_config.dart';
import 'edit_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/user_service.dart';

@AppPreview(name: 'Profile Page', group: 'Profile')
Widget profilePagePreview() {
  return const MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false,
  );
}

class ProfilePage extends StatefulWidget {
  final void Function(bool)? onThemeChanged;
  const ProfilePage({super.key, this.onThemeChanged});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = _loadUser();
  }

  Future<Map<String, dynamic>> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final token = prefs.getString('token');

    // debugPrint('prefs userId: $userId, token: ${token?.substring(0, 12)}...');

    if (userId == null || token == null || token.isEmpty) {
      return {
        'id': 0,
        'nama': 'Nama User',
        'email': 'user@gmail.com',
        'gambar_profil': null,
      };
    }

    try {
      return await UserService.getUserById(userId);
    } catch (e) {
      // Fallback agar UI tetap jalan
      return {
        'id': userId,
        'nama': 'Nama User',
        'email': 'user@gmail.com',
        'gambar_profil': null,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Profil')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error : ${snapshot.error}"));
          }

          final user = snapshot.data ?? {};
          final nama = user['nama'];
          final email = user['email'];
          final gambarProfil = user['gambar_profil'];

          final onThemeChanged = widget.onThemeChanged;

          return Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: ClipOval(
                    child: gambarProfil != null
                        ? Image.network(
                            gambarProfil,
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => _buildPlaceholder(),
                          )
                        : _buildPlaceholder(),
                  ),
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
                        Center(
                          child: Text(
                            nama,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            email,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Divider(height: 32),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit Profil'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfilePage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite),
                          title: const Text('Wishlist'),
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
                          leading: const Icon(Icons.business),
                          title: const Text('Company Profile'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CompanyProfilePage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SettingsPage(
                                  onThemeChanged: onThemeChanged,
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            AuthHelper.logout(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 64),
                  child: Text(
                    '${DateTime.now().year} © Copyright. All right Reserved\nPT Nama Perusahaan',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, size: 48, color: Colors.grey),
    );
  }
}
