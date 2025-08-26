import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2 / 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(16),
          image:  DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
