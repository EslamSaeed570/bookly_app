import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubits/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is NewestBooksSuccess) {
          return ListView.builder(
            
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
