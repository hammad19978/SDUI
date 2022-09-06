import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search_ctrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            controller: search_ctrl,
            decoration: InputDecoration(hintText: "search"),
          ),
          MaterialButton(
            onPressed: () {
              getData();
              setState(() {});
            },
            child: Text('search'),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    Dio dio = Dio();
    var url = "https://api.staging.zeedlive.com/api/v1/search";
    var formData = FormData.fromMap({
      'success': true,
      'message': search_ctrl.text.toString(),
    });
    final response = await dio.post(url, data: formData);
    print(response.data.toString());
  }
}
