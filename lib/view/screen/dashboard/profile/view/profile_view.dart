// ignore_for_file: use_build_context_synchronously

import 'package:capricon/core/constant.dart';
import 'package:capricon/routes/app_routes.dart';
import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/login/viewModel/login_viewmodel.dart';
import 'package:capricon/view/screen/login/viewModel/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenView extends ConsumerStatefulWidget {
  const ProfileScreenView({super.key});

  @override
  ConsumerState<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends ConsumerState<ProfileScreenView> {

  List<Map<String, dynamic>> tileNames = [
    {
      "icon": Icons.notifications,
      "title": "Notifications",
      "desc":  "Set up notification"
    },
    {
      "icon": Icons.delete_rounded,
      "title": "Trash",
      "desc":  "Check out trash"
    },
    {
      "icon": Icons.settings,
      "title": "Settings",
      "desc":  "Customize your settings"
    },
    {
      "icon": Icons.question_mark_outlined,
      "title": "FAQs",
      "desc":  "Have any questions?"
    },
    {
      "icon": Icons.logout,
      "title": "Log out",
      "desc":  "Want to leave"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Capricon Stock",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: kWhite,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH32,
            const CircleAvatar(
              radius: 35,
              child: Icon(
                Icons.person,
                size: 35,
              ),
            ),
            gapH8,
            Text(
              loginState.loginResponse?.user?.fullName ?? "Stock User",
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: kBlack,
                fontWeight: FontWeight.bold
              ),
            ),
            gapH48,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: tileNames.length,
                separatorBuilder: (context, index) {
                  return gapH12;
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      if(index == 4){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              backgroundColor: kWhite,
                              title: const Text(
                                "Logout",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,),
                              ),
                              content: const Text(
                                "Are you sure you want Logout? ",
                                style: TextStyle(color: primaryColor),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.remove(KeyConstants.accessToken);
                                    await prefs.remove(KeyConstants.loginData);
                                    context.pushReplacementNamed(AppRoute.signInPage.name);
                                  },  
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          gapW10,
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: kBlack, width: 2)
                            ),
                            child: Icon(tileNames[index]['icon']),
                          ),
                          gapW16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tileNames[index]['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: kBlack,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                tileNames[index]['desc'],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kBlack,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}