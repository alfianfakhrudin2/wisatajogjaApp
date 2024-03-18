import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisatajogja/provider/themeProv.dart';
import 'package:wisatajogja/screen/main_screen.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
            ],
          );
        },
      ),
    );
  }
}
