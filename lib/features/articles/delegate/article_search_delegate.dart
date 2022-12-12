import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/model/article_model.dart';
import '../view/bloc/article_bloc.dart';
import '../view/widgets/big_post.dart';

class ArticleSearchDelegate extends SearchDelegate{
  List<Article> listOfArticles = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Initialize the list of articles from ArticleBloc
    listOfArticles = context.watch<ArticleBloc>().state.listOfArticles;

    //Return the Widget to be shown
    return [
      IconButton(
        onPressed: (){
          query = ""; //set query textfield to be empty
        },
        icon: FaIcon(FontAwesomeIcons.xmarkCircle),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(listOfArticles.isEmpty){
      return const Center(
        child: Text("Articles Has Not Been Loaded Yet"),
      );
    }

    //create list 
    var listOfQueryItems = [];

    //getting the user query
    //we check the query through the list
    for(var article in listOfArticles){
      //during the check we will copy to a new list
      var title = article.title.toLowerCase();
      var queryLC = query.toLowerCase();

      if(title.contains(queryLC)){
        listOfQueryItems.add(article);
      }
    }
    
    //display new list
    return ListView.builder(
        itemCount: listOfQueryItems.length,
        itemBuilder: (context, index){
          return BigPost(
            key: Key("$index"),
            article: listOfQueryItems[index],
          );
        }
    );
  }

}