import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/manager/navigation_cubit.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../search/data/repo/search_repo_impl.dart';
import '../../../search/presentation/controller/search_books_cubit/search_books_cubit.dart';
import '../../../search/presentation/views/search_view.dart';
import '../view/profile_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  // قائمة الشاشات ثابتة
  static final List<Widget> _screens = [
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
    // نستخدم BlocBuilder لمراقبة الـ Index الحالي
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          extendBody: true,

          /// 🔥 Transition بين الشاشات بناءً على الـ Index من الـ Cubit
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
            child: _screens[selectedIndex],
          ),

          bottomNavigationBar: _buildGlassNavBar(context, selectedIndex),
        );
      },
    );
  }

  Widget _buildGlassNavBar(BuildContext context, int selectedIndex) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              // تعديل اللون ليتناسب مع الـ Light/Dark Mode
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.05),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[800]!,
                hoverColor: Colors.grey[700]!,
                haptic: true,
                curve: Curves.easeOutBack,
                duration: const Duration(milliseconds: 500),
                gap: 10,
                // ألوان الأيقونات بناءً على الثيم
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                activeColor: const Color(0xffEF8262),
                iconSize: 24.h,
                tabBackgroundColor: const Color(0xffEF8262).withValues(alpha: 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

                tabs: [
                  _buildAnimatedTab(LineIcons.home, 0, selectedIndex),
                  _buildAnimatedTab(LineIcons.heart, 1, selectedIndex),
                  _buildAnimatedTab(LineIcons.search, 2, selectedIndex),
                  _buildAnimatedTab(LineIcons.user, 3, selectedIndex),
                ],

                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  // تحديث الـ Cubit بدل الـ setState
                  context.read<NavigationCubit>().changeIndex(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  GButton _buildAnimatedTab(IconData icon, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;

    return GButton(
      icon: icon,
      leading: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Icon(
          icon,
          color: isSelected
              ? const Color(0xffEF8262)
              : Colors.grey,
        ),
      ),
    );
  }
}
