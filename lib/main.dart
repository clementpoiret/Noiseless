import 'package:flutter/material.dart';
import 'pages/news.dart';
import 'pages/saved.dart';
import 'pages/settings.dart';

void main() {
  runApp(const NoiselessApp());
}

class NoiselessApp extends StatelessWidget {
  const NoiselessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noiseless',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Noiseless'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.feed),
            icon: Icon(Icons.feed_outlined),
            label: 'News',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_outline),
            label: 'Saved',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.manage_accounts),
            icon: Icon(Icons.manage_accounts_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const NewsPage(),

        /// Saved page
        const SavedPage(),

        /// Settings page
        const SettingsPage(),
      ][currentPageIndex],
    );
  }
}
