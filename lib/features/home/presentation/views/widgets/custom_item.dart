import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7 / 2.8,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: AssetImage(AssetsData.testImage), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
