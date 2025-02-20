import 'package:capricon/view/screen/login/view/login_view.dart';
import 'package:capricon/view/screen/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  signInPage,
}

final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.splash.name,
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/',
    name: AppRoute.signInPage.name,
    builder: (context, state) => const SignInPage(),
  ),
];