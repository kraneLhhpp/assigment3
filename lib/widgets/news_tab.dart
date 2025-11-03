import 'package:flutter/material.dart';
import 'package:mobilka_news_api/pages/article_detail_page.dart';
import 'package:mobilka_news_api/widgets/calculate_time.dart';
import 'package:mobilka_news_api/widgets/image_returner.dart';

class NewsTab extends StatelessWidget{
  final String category;
  final String author;
  final String urlToImage;
  final String title;
  final String publishedAt;
  final String content;

  const NewsTab({super.key, required this.category, required this.author, required this.urlToImage, required this.title, required this.publishedAt, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageRetuner(urlToImage: urlToImage, width: 100, height: 100),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.isNotEmpty ? category.toUpperCase() : 'Common',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E4B66),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        author,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4E4B66),
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 20),
                    
                    Expanded(
                      flex: 1,
                      child: Text(
                        CalculateTime.calculateTime(publishedAt),
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF4E4B66)
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ArticleDetailPage(
                            author: author, 
                            category: category, 
                            publishedAt: publishedAt, 
                            title: title, 
                            urlToImage: urlToImage, 
                            content: content
                          ))
                        );
                      }, 
                      icon: Icon(Icons.more_horiz_rounded)
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


