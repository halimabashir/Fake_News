import 'package:flutter/material.dart';
import 'package:untitled3/categeroy/source_tab_item..dart';
import 'package:untitled3/model/Source.dart';

import '../news/NewsList.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((sources) => SourceTab(sources,
                      selectedIndex == widget.sources.indexOf(sources)))
                  .toList(),
              isScrollable: true,
            ),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}
