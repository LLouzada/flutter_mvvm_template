import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/config/app_dependencies.dart';
import 'package:flutter_mvvm_template/config/routing/app_router.dart';
import 'package:flutter_mvvm_template/ui/core/theme/app_theme.dart';
import 'package:flutter_mvvm_template/utils/log_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootApp();

  runApp(MultiProvider(providers: providers, child: MainApp()));
}

Future<void> bootApp() async {
  final DateTime start = DateTime.timestamp();
  LogUtil.instance.i('App booting...');
  await dotenv.load();

  final DateTime end = DateTime.timestamp();
  LogUtil.instance.i('App booted in ${end.difference(start).inMilliseconds}ms');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: [],
      routerConfig: appRouter,
    );
  }
}
