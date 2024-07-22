import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/custom_text_form_field.dart';
import 'package:news_app/widgets/news_list_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Search',
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CustomTextFormField(
                   onFieldSubmitted: (value) {
                     titleController.text = value;
                     NewsCubit.get(context).getSearch(value);
                   },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    hintText: 'title',
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                Expanded(child: NewsListView(articles:list)),
              ],
            ));
      },
    );
  }
}
