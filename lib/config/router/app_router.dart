import 'package:disenos_app/presentation/screens/emergency/emergency_screen.dart';
import 'package:disenos_app/presentation/screens/pinterest/pinterest_screen.dart';
import 'package:disenos_app/presentation/screens/screens.dart';
import 'package:disenos_app/presentation/screens/headers/headers_screen.dart';
import 'package:disenos_app/presentation/screens/slivers/slivers_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/slide-show',
      builder: (context, state) => const SlideShowScreen(),
    ),
    GoRoute(
      path: '/animations',
      builder: (context, state) => const AnimacionesScreen(),
    ),
    GoRoute(
      path: '/emergency',
      builder: (context, state) => const EmergencyScreen(),
    ),
    GoRoute(
      path: '/pinterest',
      builder: (context, state) => const PinterestScreen(),
    ),
    GoRoute(
      path: '/progress-radio',
      builder: (context, state) => const GraficasCircularScreen(),
    ),
    GoRoute(
      path: '/headers',
      builder: (context, state) => const HeadersScreen(),
    ),
    GoRoute(
      path: '/slivers',
      builder: (context, state) => const SliverScreen(),
    ),

    


  ]

);