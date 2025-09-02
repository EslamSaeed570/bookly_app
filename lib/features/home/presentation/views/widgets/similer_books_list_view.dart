import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similer_books_cubits/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBookListViewItem extends StatelessWidget {
  const SimilerBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
        builder: (context, state) {
          if (state is SimilerBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else if (state is SimilerBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.smallThumbnail??'',
                  ),
                );
              },
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
