import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/icon_paths.dart';
import 'package:realfitzclient/views/pages/dashboard/home/home_page.dart';
import 'package:realfitzclient/views/pages/dashboard/profile/profile_page.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/my_reward/my_reward_page.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../constants/strings.dart';
import '../../widgets/bottom_appbar_item.dart';
import 'challenge/challenge_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        overlayColor: MaterialStateProperty.all(AppColors.primary),
        onDestinationSelected: (int index) {
          setState(() => currentPageIndex = index);
        },
        selectedIndex: currentPageIndex,
        height: AppSizes.s65,
        destinations: <Widget>[
          NavigationDestination(
            icon: BottomAppBarIcon(iconPath: IconPaths.home),
            label: AppStrings.home,
          ),
          NavigationDestination(
            icon: BottomAppBarIcon(iconPath: IconPaths.shoe),
            label: AppStrings.challenge,
          ),
          NavigationDestination(
            icon: BottomAppBarIcon(iconPath: IconPaths.crown),
            label: AppStrings.reward,
          ),
          NavigationDestination(
            icon: BottomAppBarIcon(iconPath: IconPaths.profileFilled),
            label: AppStrings.profile,
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const ChallengePage(),
        const RewardsPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
