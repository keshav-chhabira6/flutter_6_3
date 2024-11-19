import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dashboardItems = [
      {'title': 'Statistics', 'icon': Icons.bar_chart, 'color': Colors.blue},
      {
        'title': 'Notifications',
        'icon': Icons.notifications,
        'color': Colors.red
      },
      {'title': 'Tasks', 'icon': Icons.check_circle, 'color': Colors.green},
      {'title': 'Messages', 'icon': Icons.message, 'color': Colors.orange},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) {
            final item = dashboardItems[index];
            return GestureDetector(
              onTap: () {
                // Handle card tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item['title']} tapped!')),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: item['color'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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

void main() => runApp(const MaterialApp(home: Dashboard()));
