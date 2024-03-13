import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/booking_history/presentation/views/booking_history_view.dart';
import 'package:jobizz/features/bottom_nav_bar/data/icon_model.dart';
import 'package:jobizz/features/home/presentation/views/home_view.dart';
import 'package:jobizz/features/profile/presentation/views/profile_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int activeIndex = 0;
  final List<Widget> bottomNavBody = [
    const HomeView(),
    const BookingHistoryView(),
    const ProfileView(),
  ];
  final List<IconModel> iconsList = [
    const IconModel(image: Assets.imagesHome, label: 'Home'),
    const IconModel(image: Assets.imagesBookHistory, label: 'BookingHistory'),
    const IconModel(image: Assets.imagesProfile, label: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavBody.elementAt(activeIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: activeIndex,
          onTap: (value) {
            setState(() {
              activeIndex = value;
            });
          },
          items: List.generate(
            iconsList.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                iconsList[index].image,
                colorFilter: ColorFilter.mode(
                    index == activeIndex
                        ? kPrimaryColor
                        : const Color(0xff4B5563),
                    BlendMode.srcIn),
              ),
              label: iconsList[index].label,
            ),
          )),
    );
  }
}
