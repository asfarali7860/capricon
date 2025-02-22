import 'package:capricon/utils/colors.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/dashboard/profile/view/profile_view.dart';
import 'package:capricon/view/screen/dashboard/search/view/search_view.dart';
import 'package:capricon/view/screen/dashboard/widgets/custm_bottom_navigation.dart';
import 'package:flutter/material.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final List<Widget> pages = [
    const SearchPageView(),
    const ProfileScreenView()
  ];

  int selectedIndex = 0;

  final PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      if(selectedIndex != index){
        selectedIndex = index;
      }
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    //   if(userId.isEmpty){
    //     getSignIn();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}