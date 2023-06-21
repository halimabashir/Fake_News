import 'package:flutter/material.dart';

import '../model/apimanger.dart';
import '../model/sourceResponse.dart';
import 'category_grid_view.dart';
import 'category_tabs_widget.dart';

class CategoryNewsList extends StatelessWidget {
  CategoryNewsList(this.category);
  Categroy category;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManger.getSources(category.categoryId),
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
          var sources = snapshot.data?.sources;
          return CategoryTabsWidget(sources!);
        },
      ),
    );
  }
}
