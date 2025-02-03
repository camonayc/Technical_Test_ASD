import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_asd/src/core/theme/app_colors.dart';
import 'package:technical_test_asd/src/shared/widgets/navbar_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = -1;
  String _location = '';

  @override
  void initState() {
    _getSelectedIndex(_location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _location = GoRouter.of(context)
          .routerDelegate
          .currentConfiguration
          .uri
          .toString();
      _currentIndex = _getSelectedIndex(_location);
    });

    return Container(
      height: 110.h,
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.carbonBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: AppColors.shadows,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavBarItem(
            icon: Icons.home,
            isSelected: _currentIndex == 0,
            onTap: () => _onItemTapped(context, 0),
          ),
          NavBarItem(
            icon: Icons.favorite,
            isSelected: _currentIndex == 1,
            onTap: () => _onItemTapped(context, 1),
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String location) {
    if (location == '/home') {
      return 0;
    }
    if (location == '/favorites') {
      return 1;
    }
    return -1;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
      case 1:
        context.go('/favorites');
    }
  }
}
