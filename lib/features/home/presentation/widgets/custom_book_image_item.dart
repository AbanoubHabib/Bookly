import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      //width:height
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(Assets.images.soloLeveling.path),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
