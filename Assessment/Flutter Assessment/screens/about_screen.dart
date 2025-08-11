import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Application')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About This App',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 12),
            Text(
              'This Flutter application is designed as a practical example for learning mobile app development concepts including navigation, user input, data storage, and API integration. It demonstrates how to build a multi-screen app with both local and external data handling.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 28),
            Text(
              'Key Features:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 18),
            _featureTile(
              context,
              icon: Icons.home,
              title: 'Home Screen with Drawer Navigation',
              subtitle: 'Quick access to all app sections using named routes.',
            ),
            _featureTile(
              context,
              icon: Icons.wb_sunny_outlined,
              title: 'Weather Information',
              subtitle: 'Fetches real-time weather data from Open-Meteo API and displays forecast.',
            ),
            _featureTile(
              context,
              icon: Icons.check_circle_outline,
              title: 'Task Management (CRUD)',
              subtitle: 'Add, edit, and delete tasks. Data is stored locally using SharedPreferences.',
            ),
            _featureTile(
              context,
              icon: Icons.person_outline,
              title: 'Profile Form',
              subtitle: 'Collects user details with form validation, switches, and sliders.',
            ),
            _featureTile(
              context,
              icon: Icons.palette_outlined,
              title: 'Custom Design',
              subtitle: 'Uses background colors, images, cards, and typography for better UI.',
            ),
            _featureTile(
              context,
              icon: Icons.devices_other,
              title: 'Multi-Platform Support',
              subtitle: 'Compatible with Android, iOS, and Web using responsive design.',
            ),
            _featureTile(
              context,
              icon: Icons.api_outlined,
              title: 'External API Integration',
              subtitle: 'Demonstrates fetching and parsing JSON data from a live REST API.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureTile(BuildContext context,
      {required IconData icon, required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 2),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
