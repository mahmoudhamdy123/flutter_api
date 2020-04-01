



import 'package:flutter/material.dart';
import 'package:flutterapi/provider/news.dart';
import 'package:provider/provider.dart';

import 'news_list_view_design.dart';

class NewsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<News>(context).items;
    return ListView.builder(
      itemCount: newsData.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: newsData[i],
          child: NewsListViewsDesign(),
        )
    );
  }
}
