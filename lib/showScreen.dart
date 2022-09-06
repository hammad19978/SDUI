import 'package:comments_reply/provider/commentProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  TextEditingController cmt_ctrl = new TextEditingController();

  TextEditingController reply_ctrl = new TextEditingController();
  int? ind;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CommentProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 500,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: provider.getComment.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Text(
                        index.toString() +
                            "   " +
                            provider.getreply[index][0].toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        index.toString() +
                            "   " +
                            provider.getreply[index][1].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          ind = index;
                        },
                        child: Text("Reply"),
                      ),
                    ],
                  );
                })),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "comments"),
                        controller: cmt_ctrl,
                        onSubmitted: (value) {
                          provider.setComment(value.toString());
                          print(provider.getComment.toString());
                          Text(provider.getComment.toString());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "reply"),
                        controller: reply_ctrl,
                        onSubmitted: (value) {
                          provider.setReply(ind, value.toString());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
