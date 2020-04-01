import 'package:flutter/material.dart';
import 'package:flutterapi/model/new.dart';
import 'package:provider/provider.dart';





class NewsListViewsDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<New>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    foregroundColor: Colors.green,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        news.username,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        news.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10),
                      ),
                      Text(
                        news.created_at,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(news.image))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: SingleChildScrollView(
                child: Text(news.description),
              ),
            )
          ],
        ),
      ),
    );
  }
}
