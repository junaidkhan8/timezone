import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  String location; // location for the world time
  String time = ""; // time for the world time
  String flag; // flag in assets for the world time
  String url; // url for the time app
  late bool isdaytime;

  WorldTime({
    required this.url,
    required this.flag,
    required this.location,
  });

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      Map Data = jsonDecode(response.body);
      //print(Data);

      String datatime = Data['datetime'];
      String offset = Data['ufc_offset'].substring(1, 3);

      DateTime Now = DateTime.parse(datatime);
      Now = Now.add(
        Duration(
          hours: int.parse(offset),
        ),
      );

      isdaytime = Now.hour > 6 && Now.hour < 20 ? true : false;
      time = DateFormat.jm().format(Now);
    } catch (e) {
      print("there has been a error");
      time = 'an error occour';
    }
  }
}
