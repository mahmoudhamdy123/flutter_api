import 'package:flutter/cupertino.dart';

class New with ChangeNotifier {
  int id;
  String title;
  String image;
  String description;
  String username;
  String created_at;

  New(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.description,
      @required this.username,
      @required this.created_at});
}
