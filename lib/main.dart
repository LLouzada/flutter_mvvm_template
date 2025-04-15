import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/config/app_boot.dart';
import 'package:flutter_mvvm_template/config/app_dependencies.dart';
import 'package:flutter_mvvm_template/config/routing/app_router.dart';
import 'package:flutter_mvvm_template/ui/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootApp();

  runApp(MultiProvider(providers: providers, child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

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
