import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/newsResponse.dart';
import 'news_details.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetalis.routeName, arguments: news);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: 200,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            Text(
              news.author ?? '',
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              news.title ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //Text(
            //news.publishedAt ?? '',
            // textAlign: TextAlign.end,
            //   ),
          ],
        ),
      ),
    );
  }
}
