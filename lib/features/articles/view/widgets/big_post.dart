
import 'package:flutter/material.dart';

import '../../data/model/article_model.dart';

class BigPost extends StatelessWidget {
  const BigPost({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
              article.urlToImage,
            errorBuilder: (context, object, stacktrace){
                return FlutterLogo();
            },
          ),
          Text(article.title),
          Text(article.author),
          Text(article.publishedAt)
        ],
      ),
    );
  }
}
