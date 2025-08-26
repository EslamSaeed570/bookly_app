import 'package:bookly_app/features/home/presentation/views/widgets/custom_item.dart';
import 'package:flutter/material.dart';

class SimilerBookListViewItem extends StatelessWidget {
  const SimilerBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomItem(imageUrl: 'https://img.favpng.com/4/9/25/book-school-clip-art-png-favpng-2GQTF3L6kuSd3dE99YLWBMd2X.jpg',),
          );
        },
      ),
    );
  }
}
