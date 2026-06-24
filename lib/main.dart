import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/learning_provider.dart';
import 'screens/home/home_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  // await Hive.initFlutter();
  // await Hive.openBox('user_progress');
  // await Hive.openBox('bookmarks');

  runApp(const EnglishHubApp());
}

class EnglishHubApp extends StatefulWidget {
  const EnglishHubApp({super.key});

  @override
  State<EnglishHubApp> createState() => _EnglishHubAppState();
}

class _EnglishHubAppState extends State<EnglishHubApp> {
  final LearningProvider _provider = LearningProvider();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _provider.initialize().then((_) {
      if (mounted) setState(() => _initialized = true);
    });
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LearningProvider>.value(
      value: _provider,
      child: MaterialApp(
        title: 'EnglishHub',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: _initialized ? const HomeScreen() : const _LoadingScreen(),
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
