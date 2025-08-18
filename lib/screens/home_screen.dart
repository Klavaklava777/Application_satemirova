import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  final Function(Locale) setLocale;

  const HomeScreen({super.key, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Кнопки смены языка
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setLocale(const Locale('en')),
                  child: const Text('EN'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setLocale(const Locale('ru')),
                  child: const Text('RU'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setLocale(const Locale('kk')),
                  child: const Text('KK'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Пример текстов из arb файлов
            Text(S.of(context).profile),
            const SizedBox(height: 8),
            Text(S.of(context).catalog),
            const SizedBox(height: 8),
            Text(S.of(context).myGames),
            const SizedBox(height: 8),
            Text(S.of(context).settings),
          ],
        ),
      ),
    );
  }
}
