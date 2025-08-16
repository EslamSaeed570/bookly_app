import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 36,
        left: 25,
        right: 15,
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 24,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
              )),
        ],
      ),
    );
  }
}
