
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../data/model/article_model.dart';
import '../pages/article_details.dart';

class BigPost extends StatelessWidget {
  const BigPost({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigate to article deatils page
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return ArticleDetailsPage(article: article,);
            })
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage,
              placeholder: (context, url){
                return CircularProgressIndicator();
              },
              errorWidget: (context, url, error){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.chainBroken),
                      Text("Could not load this image")
                    ],
                  ),
                );
              },
            ),
            Text(
                article.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(article.author),
            Text(
              article.publishedAt
            )
          ],
        ),
      ),
    );
  }
}
