import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String URL;
  bool isDayTime = false;

  WorldTime({this.location, this.flag, this.URL});

  Future<void> getTime() async {
    try {
      String baseUrl = 'https://worldtimeapi.org/api/timezone';
      Response response = await get('$baseUrl/$URL');
      //   print(response);
      Map data = jsonDecode(response.body);
      //print(data);

      String timeString = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(time);
      //print(offset);

      DateTime now = DateTime.parse(timeString);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
//    print('time in class $time');
    } catch (e) {
      print('caught error: $e');
      time = 'could not get data.';
    }
  }
}
