import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'pages/account.dart'; // Halaman Akun
import 'pages/dashboard.dart'; // Halaman Dashboard (Pemantauan Proyek)
import 'pages/task.dart'; // Halaman Tugas

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar halaman untuk setiap tab
  final List<Widget> _pages = const [
    DashboardPage(), // Dashboard proyek
    TaskPage(), // Halaman tugas
    AccountScreen(), // Akun pengguna
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex], // Menampilkan halaman berdasarkan tab aktif
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C2C2E), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            gap: 8,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xFF3A3A3C),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: 'Dashboard'),
              GButton(icon: Icons.assignment, text: 'Tugas'),
              GButton(icon: Icons.account_circle, text: 'Akun'),
            ],
          ),
        ),
      ),
    );
  }
}
