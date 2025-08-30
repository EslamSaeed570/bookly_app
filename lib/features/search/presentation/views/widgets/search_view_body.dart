import 'package:bookly_app/core/utils/styles.dart';

import 'package:bookly_app/features/search/presentation/manager/search_result_cubits/search_result_cubit.dart';

import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String search = 'programming';
  @override
  void initState() {
    BlocProvider.of<SearchResultCubit>(context)
        .featchFeaturedBooks(search: search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchResultCubit>(context)
                  .featchFeaturedBooks(search: value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Search result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
