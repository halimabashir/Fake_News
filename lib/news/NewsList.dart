import 'package:flutter/material.dart';

import '../model/Source.dart';
import '../model/apimanger.dart';
import '../model/newsResponse.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManger.getNews(sourceId: source.id ?? ''),
        builder: (bulidContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data${snapshot.error.toString()}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('server error${snapshot.data?.message}'),
            );
          }
          var newsList = snapshot.data?.newsList ?? [];
          return ListView.builder(
            itemBuilder: (_, index) {
              return NewsItem(newsList[index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
  }
}
