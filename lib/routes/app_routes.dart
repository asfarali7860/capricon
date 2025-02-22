import 'package:capricon/view/screen/dashboard/view/dashboard_view.dart';
import 'package:capricon/view/screen/login/view/login_view.dart';
import 'package:capricon/view/screen/searchDetail/view/search_detail_view.dart';
import 'package:capricon/view/screen/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  signInPage,
  dashboard,
  searchDetailPage
}

final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.splash.name,
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/signInPage',
    name: AppRoute.signInPage.name,
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: '/dashboard',
    name: AppRoute.dashboard.name,
    builder: (context, state) => const DashboardView(),
  ),
  GoRoute(
    path: '/searchDetailPage',
    name: AppRoute.searchDetailPage.name,
    builder: (context, state) {
      final String searchId = state.extra! as String;
      return SearchDetailPage(searchId: searchId,);
    }
  ),
];