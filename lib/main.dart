import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/achievements_screen.dart';
import 'screens/add_activity_screen.dart';

void main() {
  runApp(const CampusGreenApp());
}

class CampusGreenApp extends StatelessWidget {
  const CampusGreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Campus Green',
  theme: ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.grey[100],
  ),
  home: const HomeScreen(),
);
}
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> activities = [
    'Used a reusable water bottle',
    'Cycled to college',
  ];

  int ecoPoints = 120;
  bool pointsUpdated = false;

  final Map<String, String> ecoTips = {
    'Save Water': 'Close taps properly and avoid wasting water.',
    'Choose Green Travel':
        'Walk, cycle or use public transport when possible.',
  };

  String getCategoryIcon(String category) {
    switch (category) {
      case 'Water':
        return '💧';
      case 'Transport':
        return '🚲';
      case 'Trees & Plants':
        return '🌳';
      case 'Waste Management':
        return '♻️';
      case 'Energy':
        return '⚡';
      default:
        return '🌱';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: const Text('Campus Green'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'achievements') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AchievementsScreen(),
                  ),
                );
              }

              if (value == 'about') {
                showAboutDialog(
                  context: context,
                  applicationName: 'Campus Green',
                  applicationVersion: '1.0',
                  applicationLegalese:
                      'A smart campus sustainability app.',
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'achievements',
                child: Text('🏆 Achievements'),
              ),
              const PopupMenuItem(
                value: 'about',
                child: Text('ℹ️ About Campus Green'),
              ),
            ],
          ),
        ],
      ),

      // Main Body
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(
                orientation == Orientation.portrait ? 16 : 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Section
                  RichText(
  text: TextSpan(
    style: const TextStyle(
      fontSize: 24,
      color: Colors.black,
    ),
    children: [
      const TextSpan(text: 'Welcome, '),
      TextSpan(
        text: 'Green Student! 🌱',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    ],
  ),
),

                  const SizedBox(height: 8),

                  const Text(
                    'Make your campus greener, one action at a time.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Nature Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/campus_green.jpg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Eco Points Card
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pointsUpdated ? 1.0 : 0.7,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: pointsUpdated
                            ? Colors.green.shade100
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.eco,
                            size: 45,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Eco Points',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '$ecoPoints Points',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Activities
                  const Text(
                    'Today\'s Activities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...activities.map(
                    (activity) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.eco,
                          color: Colors.green,
                        ),
                        title: Text(activity),
                        subtitle: const Text('+10 Eco Points'),
                        trailing: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Eco Tips
                  const Text(
                    'Eco Tips 🌱',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...ecoTips.entries.map(
                    (tip) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.eco,
                          color: Colors.green,
                        ),
                        title: Text(
                          tip.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(tip.value),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Achievement Progress
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.emoji_events,
                                color: Colors.orange,
                                size: 35,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Green Starter',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Complete 5 eco-friendly activities',
                          ),

                          const SizedBox(height: 8),

                          LinearProgressIndicator(
                            value: (activities.length / 5).clamp(
                              0.0,
                              1.0,
                            ),
                            minHeight: 8,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '${activities.length} / 5 activities completed',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // Add Activity Button
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newActivity = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddActivityScreen(),
            ),
          );

          if (newActivity != null) {
            setState(() {
              activities.add(newActivity);
              ecoPoints += 10;
              pointsUpdated = true;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}