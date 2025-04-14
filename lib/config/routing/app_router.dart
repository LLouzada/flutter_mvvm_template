import 'package:flutter_mvvm_template/config/routing/app_routes.dart';
import 'package:flutter_mvvm_template/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
