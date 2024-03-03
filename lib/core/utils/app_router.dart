import 'package:go_router/go_router.dart';
import 'package:jobizz/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:jobizz/features/welcome/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static const welcomeRoute = '/welcome';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: welcomeRoute,
        builder: (context, state) => const WelcomeView(),
      ),
    ],
  );
}
