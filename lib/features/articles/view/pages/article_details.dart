
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wmt_news_app/features/articles/view/widgets/big_post.dart';

import '../../data/model/article_model.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: FaIcon(FontAwesomeIcons.share)
          )
        ],
      ),
      body: ListView(
        children: [
          BigPost(article: widget.article),
          Divider(),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(widget.article.content),
          )
        ],
      ),
    );
  }
}
