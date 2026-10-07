import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.emoji_events,
                color: Colors.orange,
                size: 40,
              ),
              title: const Text(
                'Green Starter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Complete your first 5 eco-friendly activities.',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.eco,
                color: Colors.green,
                size: 40,
              ),
              title: const Text(
                'Eco Champion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Earn 200 Eco Points.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}