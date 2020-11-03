import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //getting the data
    String datetime = data['datetime'];
    int offset = int.parse(data['utc_offset'].substring(0,3));
    String offsetmin = data['utc_offset'].substring(4,6);


    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: offset));
    now = now.add(Duration(minutes: int.parse(offsetmin)));

    isDayTime = now.hour >= 6 && now.hour <= 19 ? true:false;

    time = DateFormat.jm().format(now);
  }

}