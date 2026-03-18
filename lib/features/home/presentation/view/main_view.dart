import 'dart:ui';

import 'package:bookly/features/home/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../search/data/repo/search_repo_impl.dart';
import '../../../search/presentation/controller/search_books_cubit/search_books_cubit.dart';
import '../../../search/presentation/views/search_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const FavoritesView(),
    BlocProvider(
      create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
      child: const SearchView(),
    ),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /// 🔥 Animated transition between screens
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _screens[_selectedIndex],
      ),

      bottomNavigationBar: _buildGlassNavBar(),
    );
  }

  Widget _buildGlassNavBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[800]!,
                hoverColor: Colors.grey[700]!,
                haptic: true,

                /// 🔥 smoother animation
                curve: Curves.easeOutBack,
                duration: const Duration(milliseconds: 500),

                gap: 10,
                color: Colors.grey[400],

                /// 🔥 active style
                activeColor: Colors.white,
                iconSize: 24.h,

                tabBackgroundColor:
                const Color(0xffEF8262).withValues(alpha: 0.2),

                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

                tabs: [
                  _buildAnimatedTab(LineIcons.home, 0),
                  _buildAnimatedTab(LineIcons.heart, 1),
                  _buildAnimatedTab(LineIcons.search, 2),
                  _buildAnimatedTab(LineIcons.user, 3),
                ],

                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 Animated icon
  GButton _buildAnimatedTab(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return GButton(
      icon: icon,
      leading: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Icon(icon),
      ),
    );
  }
}
