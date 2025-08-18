import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: Text(S.of(context).enableDarkMode),
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (_) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: DropdownButton<Locale>(
                value: Localizations.localeOf(context),
                items: const [
                  DropdownMenuItem(value: Locale('kk'), child: Text('Қазақша')),
                  DropdownMenuItem(value: Locale('ru'), child: Text('Русский')),
                  DropdownMenuItem(value: Locale('en'), child: Text('English')),
                ],
                onChanged: (locale) {
                  if (locale != null) {
                    S.load(locale); // Меняем язык приложения
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
