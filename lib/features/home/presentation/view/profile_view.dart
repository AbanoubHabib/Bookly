import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/manager/theme_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              child: Icon(Icons.person, size: 50.r, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 16.h),
            const Text('Abanoub Habib', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 40.h),

            // Theme Toggle Tile
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return ListTile(
                  leading: Icon(
                    themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                    color: const Color(0xffEF8262),
                  ),
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    value: themeMode == ThemeMode.dark,
                    activeThumbColor: const Color(0xffEF8262),
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                );
              },
            ),

            const Divider(),

            // أي إعدادات تانية مستقبلاً
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xffEF8262)),
              title: const Text('About Bookly'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
