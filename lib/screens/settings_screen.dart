import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Locale) setLocale;
  const SettingsScreen({super.key, required this.setLocale});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  Locale _selectedLocale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notifications
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              secondary: const Icon(Icons.notifications, color: Colors.blueAccent),
              title: const Text("Notifications"),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
          ),
          const SizedBox(height: 12),

          // Privacy & Security
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.security, color: Colors.redAccent),
              title: const Text("Privacy & Security"),
              subtitle: const Text("Manage your account security settings"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: перейти на экран Privacy
              },
            ),
          ),
          const SizedBox(height: 12),

          // Language
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ExpansionTile(
              leading: const Icon(Icons.language, color: Colors.green),
              title: const Text("Language"),
              children: [
                RadioListTile<Locale>(
                  title: const Text("English"),
                  value: const Locale('en'),
                  groupValue: _selectedLocale,
                  onChanged: (locale) {
                    setState(() => _selectedLocale = locale!);
                    widget.setLocale(locale!);
                  },
                ),
                RadioListTile<Locale>(
                  title: const Text("Русский"),
                  value: const Locale('ru'),
                  groupValue: _selectedLocale,
                  onChanged: (locale) {
                    setState(() => _selectedLocale = locale!);
                    widget.setLocale(locale!);
                  },
                ),
                RadioListTile<Locale>(
                  title: const Text("Қазақша"),
                  value: const Locale('kk'),
                  groupValue: _selectedLocale,
                  onChanged: (locale) {
                    setState(() => _selectedLocale = locale!);
                    widget.setLocale(locale!);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
