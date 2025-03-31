import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/config/app_dependencies.dart';
import 'package:flutter_mvvm_template/ui/core/theme/app_theme.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  final log = Logger('main');
  log.info('App started');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final log = Logger('MainApp');

  @override
  Widget build(BuildContext context) {
    log.fine('Building MainApp');
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Hello World!22')));
  }
}
