import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Seoul');
    Map data = jsonDecode(response.body);

    String dateTime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(dateTime);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

    // print(dateTime + offset);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading page'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Text('this is the loading page'),
    );
  }
}
