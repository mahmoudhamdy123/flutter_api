import 'package:flutter/material.dart';
import 'package:flutterapi/provider/news.dart';
import 'package:flutterapi/widget/news_list_view.dart';
import 'package:provider/provider.dart';




class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {

  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context).fetchNews().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
      ),
      body:_isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : NewsListView(),
    );
  }
}
