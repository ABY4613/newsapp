import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/article_screen/article_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _selectedCategory = 'business'; // Default category

  @override
  void initState() {
    super.initState();
    _fetchCategoryNews();
  }

  // Fetch news related to selected category
  Future<void> _fetchCategoryNews() async {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    await newsProvider.fetchNewsByCategory(_selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category News',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
   
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <String>[
                  'business', 'sports', 'technology', 'health', 'entertainment'
                ].map((category) {
                  bool isSelected = _selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                      _fetchCategoryNews();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green[200]: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          category.capitalize(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // News List
          Expanded(
            child: newsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : newsProvider.articles.isEmpty
                    ? const Center(child: Text("No articles found"))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final article = newsProvider.articles[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ArticleScreen(article: article),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: newsProvider.articles.length,
                      ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }
}
