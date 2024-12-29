import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/article_screen/article_screen.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarked Articles',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: newsProvider.bookmarkedArticles.isEmpty
          ? const Center(child: Text("No bookmarked articles"))
          : ListView.separated(
              itemBuilder: (context, index) {
                final article = newsProvider.bookmarkedArticles[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleScreen(article: article),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            article.urlToImage ?? "",
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                article.description ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Remove button
                        IconButton(
                          onPressed: () {
                            // Remove article from bookmarks
                            newsProvider.removeBookmark(article);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${article.title} removed from bookmarks"),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: newsProvider.bookmarkedArticles.length,
            ),
    );
  }
}
