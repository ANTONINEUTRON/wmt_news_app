
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wmt_news_app/features/articles/view/widgets/big_post.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
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
              onPressed: ()async{
                await Share.share("Hi! checkout this news from WMT News App ${widget.article.url}");
              },
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
            child: Text(
                widget.article.description,
              style: Theme.of(context).textTheme.labelLarge
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.article.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          MaterialButton(
            onPressed: ()=> readMore(widget.article.url),
            child: Text(
                "READ MORE",
              style: TextStyle(
                color: Colors.white
              )
            ),
            color: Colors.green.shade800,
            padding: EdgeInsets.all(8),
            elevation: 15,
            height: 60,
          )
        ],
      ),
    );
  }

  ///A method that will take a url and open the link in a browser
  Future<void> readMore(String url) async{
    var parsedUrl = Uri.parse(url);
    await launchUrl(parsedUrl);
  }
}
