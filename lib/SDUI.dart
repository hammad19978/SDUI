import 'package:flutter/material.dart';

class SdUi_Screen extends StatefulWidget {
  const SdUi_Screen({Key? key}) : super(key: key);

  @override
  State<SdUi_Screen> createState() => _SdUi_ScreenState();
}

class _SdUi_ScreenState extends State<SdUi_Screen> {
  List<Map<String, dynamic>> serverUi = [
    {'type': 'SizedBox', 'height': 25.0},
    {'type': 'Image', 'url': 'assets/logo1.png'},
    {'type': 'SizedBox', 'height': 35.0},
    {'type': 'MaterialButton', 'hint': 'LOGIN'},
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> sduiwidgets = [];
    serverUi.forEach(((element) {
      String type = element['type'];
      if (type == 'SizedBox') {
        sduiwidgets.add(SizedBox(
          height: element['height'],
        ));
      }
      if (type == 'Image') {
        sduiwidgets.add(Image.asset(
          element['url'],
        ));
      }

      if (type == 'MaterialButton') {
        sduiwidgets.add(MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          minWidth: 200,
          child: Text(element['hint']),
        ));
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Driven UI'),
      ),
      body: Center(
        child: Column(
          children: [
            ...sduiwidgets,
          ],
        ),
      ),
    );
  }
}
