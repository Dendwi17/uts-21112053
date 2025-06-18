import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header Profil
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  // Foto Profil dari assets lokal
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/img/profile.jpeg'),
                  ),
                  const SizedBox(width: 20),
                  // Nama dan Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deni Dwi Nugroho',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'deden@example.com',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.grey),

            // Menu Akun
            Expanded(
              child: ListView(
                children: const [
                  AccountMenuItem(icon: Icons.person, title: 'Edit Profil'),
                  AccountMenuItem(icon: Icons.settings, title: 'Pengaturan'),
                  AccountMenuItem(icon: Icons.lock, title: 'Ganti Password'),
                  AccountMenuItem(icon: Icons.help_outline, title: 'Bantuan'),
                  AccountMenuItem(icon: Icons.logout, title: 'Keluar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const AccountMenuItem({Key? key, required this.icon, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
      onTap: () {
        debugPrint('Menu "$title" ditekan');
        // Tambahkan aksi di sini jika diperlukan
      },
    );
  }
}
