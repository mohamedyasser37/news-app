import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/widgets/news_list_view.dart';

import 'cubit/news_cubit.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return list.isEmpty ? const Center(child: CircularProgressIndicator()) : NewsListView(articles: list);
      },
    );
  }
}


