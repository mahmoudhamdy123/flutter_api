import 'dart:convert';

import 'package:flutterapi/model/new.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class News with ChangeNotifier {
  List<New> _items = [];

  List<New> get items {
    return [..._items];
  }

  Future<void> fetchNews() async {
    const url = 'http://api.ajyal.blog/api/events';
    try {
       final response = await http.get(url);
       var  extractedData = json.decode(response.body) ;
       List<dynamic> data = extractedData["events"];
      if (extractedData == null) {
        //TODO There are no data
        print("There are no data");
        return;
      }
      if (response.statusCode == 404) {
        //TODO 404 Not Found
        print("404 Not Found");
        return;
      }
      if (response.statusCode == 200) {
      print(data);
        //TODO  status code of 200
        print(" status code of 200 OK");
        final List<New> loadedNews = [];
        for(int i=0;i<data.length;i++){
          loadedNews.add(New(
            id: data[i]['id'],
            title: data[i]['title'],
            image: data[i]['image'],
            created_at: data[i]['created_at'],
            description: data[i]['description'],
            username: data[i]['username'],
          ));
        }
        _items = loadedNews;
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
