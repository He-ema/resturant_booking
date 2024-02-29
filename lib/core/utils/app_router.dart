import 'package:go_router/go_router.dart';
import 'package:jobizz/features/onBoarding/presentation/views/on_boarding_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}
