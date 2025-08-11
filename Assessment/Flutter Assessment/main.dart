import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'package:student_connect/screens/about_screen.dart' as about;
import 'package:student_connect/screens/contact_screen.dart' as contact;
import 'package:student_connect/screens/home_screen.dart';
import 'package:student_connect/screens/tasks_screen.dart' as tasks;
import 'package:student_connect/screens/weather_screen.dart' as weather;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Student Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3
        colorSchemeSeed: Colors.deepPurple, // Optional: for Material 3 color theming
      ),
      darkTheme: ThemeData(
        useMaterial3: true, // Enable Material 3 for dark mode
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      themeMode: themeProvider.themeMode,
      home: HomeScreen(),
      routes: {
        '/weather': (context) => weather.WeatherScreen(),
        '/tasks': (context) => tasks.TasksScreen(),
        '/contact': (context) => contact.ContactScreen(),
        '/about': (context) => about.AboutScreen(),
      },
    );
  }
}
