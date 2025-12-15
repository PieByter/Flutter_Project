import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final void Function(bool)? onThemeChanged;
  const SettingsPage({super.key, this.onThemeChanged});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void _toggleDarkMode(bool value) {
    // 1. Update UI lokal dulu
    setState(() {
      _isDarkMode = value;
    });

    // 2. Panggil callback untuk ubah theme di MyApp (langsung, tanpa await)
    widget.onThemeChanged?.call(value);

    // 3. Simpan ke SharedPreferences di background
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDarkMode', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(value: _isDarkMode, onChanged: _toggleDarkMode),
            ),
          ),
        ],
      ),
    );
  }
}
