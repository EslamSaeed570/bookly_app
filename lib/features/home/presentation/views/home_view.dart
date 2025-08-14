import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          AssetsData.logo,
          height: 80,
          width: 100,
        ),
        actions:const [
          Icon(Icons.search),
        ],
      ),
    );
  }
}
