import 'package:flutter/material.dart';
import 'package:news_app/cubit/news_cubit.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    super.key,
    required this.article,
  });

  var article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NewsCubit.get(context).launchURL(article['url']);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0,left: 10),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article['title']}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, height: 1.5),
                  ),
                  Text(
                    '${article['publishedAt']}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
