import 'package:flutter/material.dart';

import 'news_item.dart';

class NewsListView extends StatelessWidget {
   const NewsListView({super.key, required  this.articles});

  final List articles ;
  @override
  Widget build(BuildContext context) {
    return articles.isEmpty ? const SizedBox() :   ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
      return  NewsItem(

        article: articles[index],
      );
    }, separatorBuilder: (context, index) => Divider(
      color: Colors.grey[300],
      thickness: 2,
    ), itemCount: 10);
  }
}
