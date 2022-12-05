import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wmt_news_app/features/articles/data/model/article_model.dart';
import 'package:wmt_news_app/features/articles/view/bloc/article_bloc.dart';

import '../bloc/article_event.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {

  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(LoadArticle());
  }

  @override
  Widget build(BuildContext context) {
    var articleBloc = context.watch<ArticleBloc>();
    List<Article> listOfArticles = articleBloc.state.listOfArticles;

    return Scaffold(
      body: listOfArticles.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: listOfArticles.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Text(listOfArticles[index].title),
                    Divider()
                  ],
                );
              }
          ),
    );
  }
}
