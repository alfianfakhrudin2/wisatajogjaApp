import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisatajogja/provider/themeProv.dart';
import 'package:wisatajogja/screen/AppLocalizations.dart';
import 'package:wisatajogja/screen/main_screen.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate("settings") ?? ''),
      ),
      body: Consumer<Themeprov>(
        builder: (context, notifier, child) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark theme"),
                trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.toggleTheme(),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Language"),
                trailing: DropdownButton<String>(
                  value: 'English', // Nilai awal bahasa
                  onChanged: (String? newValue) {
                    // Implementasi perubahan bahasa di sini
                    // Misalnya, dengan menetapkan nilai ke variabel state atau menggunakan provider
                  },
                  items: <String>[
                    'English',
                    'Indonesian',
                    'France',
                  ] // Daftar bahasa yang tersedia
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
