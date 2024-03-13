import 'package:go_router/go_router.dart';
import 'package:jobizz/features/OTP/presentation/views/OTP_view.dart';
import 'package:jobizz/features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'package:jobizz/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:jobizz/features/success/presentation/views/success_view.dart';
import 'package:jobizz/features/welcome/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static const welcomeRoute = '/welcome';
  static const successRoute = '/success';
  static const otpRoute = '/otp';
  static const bottomNavBarRoute = '/bottomNavbar';

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
      GoRoute(
        path: otpRoute,
        builder: (context, state) => const OTPView(),
      ),
      GoRoute(
        path: successRoute,
        builder: (context, state) => const SuccessView(),
      ),
      GoRoute(
        path: bottomNavBarRoute,
        builder: (context, state) => const BottomNavBarView(),
      ),
    ],
  );
}
