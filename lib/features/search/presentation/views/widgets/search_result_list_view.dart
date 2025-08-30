import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/manager/search_result_cubits/search_result_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is SearchResultSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SearchresultListViewItem(
                    bookModel: state.books[index],
                  ),
                  // child: Text('result'),
                );
              });
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

