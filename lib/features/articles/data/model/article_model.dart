
import 'package:intl/intl.dart';

class Article{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;


  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

  factory Article.fromJson(Map<String, dynamic> json){
    DateTime date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(json["publishedAt"]);
    return Article(
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      publishedAt: "${date.hour}:${date.minute}",//year - month - day
      content: json["content"] ?? ""
    );
  }
}