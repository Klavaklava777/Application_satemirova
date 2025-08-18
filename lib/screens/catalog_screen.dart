import 'package:flutter/material.dart';
import 'game_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Consultation Game 1',
        'price': '\$10',
        'description': 'Improve mental strength and focus.',
        'icon': Icons.sports_soccer,
      },
      {
        'title': 'Consultation Game 2',
        'price': '\$15',
        'description': 'Learn strategies for better performance.',
        'icon': Icons.sports_basketball,
      },
      {
        'title': 'Consultation Game 3',
        'price': '\$20',
        'description': 'Personalized coaching session.',
        'icon': Icons.sports_tennis,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog / Services'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // одна колонка, можно сделать 2 для планшета
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3, // карточка более широкая
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        service['icon'] as IconData,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            service['title'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service['description'] as String,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            service['price'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GameScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Buy'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
