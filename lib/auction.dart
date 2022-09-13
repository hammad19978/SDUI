import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Auction extends StatefulWidget {
  const Auction({Key? key}) : super(key: key);

  @override
  State<Auction> createState() => _AuctionState();
}

class _AuctionState extends State<Auction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auction'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Categories",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 17,
          ),
          InkWell(
            onTap: () {
              getAuction();
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xff2E2E2F),
              ),
              child: Image.asset('abc.png'),
            ),
          ),
        ],
      ),
    );
  }

  Future getAuction() async {
    final dio = Dio();
    const url =
        'https://api.staging.zeedlive.com/api/v1/get/auction/by/category';

    var formData = FormData.fromMap({'category_id': 36});

    try {
      final response = await dio.post(url, data: formData);
      print(response.data.toString());

      if (response.data['success'] == true) {
        print('successfully');
      } else {
        print('failed');
      }
    } catch (error) {
      print(error);
    }
  }
}
