import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Connect'),
        centerTitle: false,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1529676468690-ff2fbbf80de4?q=80&w=400&auto=format&fit=crop&ixlib=rb-4.0.3&s=7ac6b2f9d4e93feb5d59e2b8d0b9a1d6'),
                    ),
                    SizedBox(width: 12),
                    // Animated icon
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _controller.value * 6.28, // 2*pi radians
                          child: Icon(Icons.mobile_screen_share, color: Theme.of(context).colorScheme.primary, size: 32),
                        );
                      },
                    ),
                    SizedBox(width: 12),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Student Connect', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 6),
                        Text('Your college companion', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ))
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Just close the drawer, since you're already on Home
                },
              ),
              ListTile(
                leading: Icon(Icons.sunny),
                title: Text('Weather'),
                onTap: () {
                  Navigator.pushNamed(context, '/weather');
                },
              ),
              ListTile(
                leading: Icon(Icons.task),
                title: Text('Tasks'),
                onTap: () {
                  Navigator.pushNamed(context, '/tasks');
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Contact Admin'),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              SwitchListTile(
                title: Text('Dark Theme'),
                secondary: Icon(Icons.dark_mode),
                value: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner image + background color
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        'https://plus.unsplash.com/premium_photo-1678037611138-5ac999d635ca?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Text('Welcome to Student Connect',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, shadows: [Shadow(blurRadius: 6, color: Colors.black45, offset: Offset(0,2))])),
                    )
                  ],
                ),
              ),

              SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
                  ElevatedButton.icon(
                    icon: Icon(Icons.cloud),
                    label: Text('Open Weather'),
                    onPressed: () => Navigator.pushNamed(context, '/weather'),
                  )
                ],
              ),

              SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildCard(context, Icons.sunny, 'Weather', 'Live Bengaluru weather', '/weather'),
                  _buildCard(context, Icons.list_alt, 'Tasks', 'Add & manage tasks', '/tasks'),
                  _buildCard(context, Icons.email, 'Contact', 'Send message to admin', '/contact'),
                  _buildCard(context, Icons.info, 'About', 'App info & credits', '/about'),
                ],
              ),

              SizedBox(height: 20),

              Text('Tips', style: Theme.of(context).textTheme.titleSmall),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Use the drawer to navigate.'),
                      Text('• Tasks are saved locally and persist.'),
                      Text('• Contact admin uses your mail app to send messages.'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, String subtitle, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30),
              Spacer(),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 6),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text('Weather information will be displayed here.'),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Center(
        child: Text('Tasks management will be displayed here.'),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Admin'),
      ),
      body: Center(
        child: Text('Contact form will be displayed here.'),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About information will be displayed here.'),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Student Connect',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            home: HomeScreen(),
            routes: {
              '/weather': (context) => WeatherScreen(),
              '/tasks': (context) => TasksScreen(),
              '/contact': (context) => ContactScreen(),
              '/about': (context) => AboutScreen(),
            },
          );
        },
      ),
    ),
  );
}