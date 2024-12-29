import 'package:flutter/material.dart';
import 'package:newsapp/model/news_list_model.dart';


class ArticleScreen extends StatelessWidget {
  final NewsArticle article;

  ArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage.isNotEmpty
                ? Image.network(article.urlToImage)
                : Container(),
            SizedBox(height: 16),
            Text(
              article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              article.description,
              maxLines: 10,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          //  ElevatedButton(
//             onPressed: () async {
//                final uri = Uri.tryParse(article.url);
//           if (uri != null && await canLaunchUrl(uri)) {
//             await launchInBrowser(uri);
//             }},
 
//   child: Text('Read Full Article'),
// ),

          ],
        ),
      ),
    );
  }
}