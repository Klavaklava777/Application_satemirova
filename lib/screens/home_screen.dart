import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  final Function(Locale) setLocale;
  const HomeScreen({super.key, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'icon': Icons.list,
        'color': Colors.blue,
        'title': "Catalog",
        'route': '/catalog',
      },
      {
        'icon': Icons.videogame_asset,
        'color': Colors.green,
        'title': "Game",
        'route': '/game',
      },
      {
        'icon': Icons.person,
        'color': Colors.orange,
        'title': "Profile",
        'route': '/profile',
      },
      {
        'icon': Icons.settings,
        'color': Colors.purple,
        'title': "Settings",
        'route': '/settings',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: setLocale,
            itemBuilder: (context) => [
              const PopupMenuItem(value: Locale('en'), child: Text("English")),
              const PopupMenuItem(value: Locale('ru'), child: Text("Русский")),
              const PopupMenuItem(value: Locale('kk'), child: Text("Қазақша")),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 колонки
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.pushNamed(context, item['route'] as String),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: (item['color'] as Color).withOpacity(0.15),
                    child: Icon(
                      item['icon'] as IconData,
                      size: 28,
                      color: item['color'] as Color,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
