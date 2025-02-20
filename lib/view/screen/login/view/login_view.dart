import 'package:capricon/routes/app_routes.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/login/viewModel/login_viewmodel.dart';
import 'package:capricon/view/screen/login/viewModel/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passeordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(loginNotifierProvider, (prev, next){
      if(next.isSuccess){
        // context.pushReplacementNamed(AppRoute.)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final loginState = ref.watch(loginNotifierProvider);
    return Scaffold(
      backgroundColor: kBlack,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.2,),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.baskervville(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign In for free to email HR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w600),
                ),
                gapH24,
                TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                gapH16,
                TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration( 
                      border: Border.all(color: kWhite),
                      color: kWhite,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: loginState.isLoading ? const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: kWhite,))) 
                    : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapH16,
                GestureDetector(
                  onTap: () {
                    // context.pushNamed(AppRoute.signUpPage.name);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      gapW16,
                      Text('Not have an account? Sign Up', style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                gapH32,
              ],
            ),
          ),
        ],
      ),
    );
  }
}