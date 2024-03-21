import 'package:flutter/material.dart';
import 'package:wisatajogja/screen/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto Profil dan Nama
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: constraints.maxWidth < 600 ? 40 : 80,
                      // Mengatur radius menjadi 80 untuk layar besar dan 40 untuk layar kecil
                      backgroundImage: AssetImage('assets/freya.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Aura',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Section Ganti Password
                const Text(
                  'Ganti Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildListItem(
                  context,
                  'Reset Password',
                  icon: Icons.lock,
                  onPressed: () {
                    // Implementasi aksi ketika tombol "Change Password" ditekan
                  },
                ),
                const Divider(),

                // Section Menuju Halaman Settings
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildListItem(
                  context,
                  'Go to Settings',
                  icon: Icons.settings,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  },
                ),
                const Divider(),

                // Section Versi Aplikasi
                const Text(
                  'Versi Aplikasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildListItem(
                  context,
                  '1.0.0', // Ganti dengan versi aplikasi yang sesuai
                  icon: Icons.info,
                  onPressed: () {
                    // Implementasi aksi ketika tombol versi aplikasi ditekan
                  },
                ),
                const Divider(),
                // Section Logout
                _buildListItem(
                  context,
                  'Logout',
                  icon: Icons.logout,
                  onPressed: () {
                    // Implementasi aksi ketika tombol "Logout" ditekan
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title,
      {VoidCallback? onPressed, IconData? icon}) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
