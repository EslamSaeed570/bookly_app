import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
     
      required this.pageCount});
  final MainAxisAlignment mainAxisAlignment;
  
  final int pageCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const SizedBox(
          width: 6.3,
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          'pageCount',
          style: Styles.textStyle14,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($pageCount)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
