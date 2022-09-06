import 'package:comments_reply/model/CommentModel.dart';
import 'package:flutter/cupertino.dart';

class CommentProvider with ChangeNotifier {
  List lst = [];

  List get getComment => lst;

  setComment(cmtval) {
    lst.add([cmtval, []]);
    notifyListeners();
  }

  List get getreply => lst;

  setReply(ind, rplyval) {
    lst[ind][1].add(rplyval);
    notifyListeners();
  }
}
