import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // هنجيب اللون المناسب للثيم الحالي (أبيض في الدارك وأسود في اللايت)
    final Color themeColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.images.logo.path, height: 30, color: themeColor),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.search);
            },
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
              color: themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
