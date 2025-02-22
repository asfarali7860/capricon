

import 'package:capricon/routes/app_routes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/login/viewModel/login_viewmodel.dart';
import 'package:capricon/view/screen/login/viewModel/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(loginNotifierProvider.notifier).getUserData();
    });
    Future.delayed(const Duration(seconds: 2), () {
      final state = ref.read(loginNotifierProvider);
      Logger.printError(state.loginResponse.toString());
      if (mounted) {
        if(state is LoginError){
          context.pushReplacementNamed(AppRoute.signInPage.name);
        } else {
          context.pushReplacementNamed(AppRoute.dashboard.name);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Container(
        color: kWhite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 70.h,
          ),
        ),
      ),
    );
  }
}