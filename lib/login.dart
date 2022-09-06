import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email_ctrl = new TextEditingController();
  TextEditingController pass_ctrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            child: TextField(
              controller: email_ctrl,
              decoration: InputDecoration(hintText: 'Login'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            child: TextField(
              controller: pass_ctrl,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              confirmLogin();
            },
            child: Text('LOGIN'),
          )
        ],
      ),
    );
  }

  Future confirmLogin() async {
    final dio = Dio();
    const url = 'https://api.staging.zeedlive.com/api/v1/login';

    var formData = FormData.fromMap({
      'email': email_ctrl.text.toString(),
      'password': pass_ctrl.text.toString(),
    });

    try {
      final response = await dio.post(url, data: formData);
      print(response.data.toString());

      if (response.data['success'] == true) {
        print('successfully login');
      } else {
        print('failed to login');
      }
    } catch (error) {
      print(error);
    }
  }
}
