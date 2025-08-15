import 'package:bookly_app/features/home/presentation/views/widgets/custo_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 22),
      child: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
