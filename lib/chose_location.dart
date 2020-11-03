import 'package:flutter/material.dart';
import 'world_clock.dart';

class Choselocation extends StatefulWidget {
  @override
  _ChoselocationState createState() => _ChoselocationState();
}

class _ChoselocationState extends State<Choselocation> {

  List<WorldTime> locations = [
    WorldTime(location:'Algiers' ,flag:'algeria.png' ,url:'Africa/Algiers' ),
    WorldTime(location:'Cairo' ,flag:'egypt.png' ,url:'Africa/Cairo' ),
    WorldTime(location:'Nairobi' ,flag:'kenya.png',url:'Africa/Nairobi' ),
    WorldTime(location:'Johannesburg' ,flag:'southAfrica.png' ,url:'Africa/Johannesburg' ),
    WorldTime(location:'Hong Kong' ,flag:'hongkong.png' ,url:'Asia/Hong_Kong' ),
    WorldTime(location:'Kolkata' ,flag:'india.png' ,url:'Asia/Kolkata' ),
    WorldTime(location:'Qatar' ,flag:'qatar.png' ,url:'Asia/Qatar' ),
    WorldTime(location:'Seoul' ,flag:'southkoria.png' ,url:'Asia/Seoul' ),
    WorldTime(location:'Shanghai' ,flag:'china.png' ,url:'Asia/Shanghai' ),
    WorldTime(location:'Taipei' ,flag:'taiwan.png' ,url:'Asia/Taipei' ),
    WorldTime(location: 'Dubai',flag: 'uae.png',url:'Asia/Dubai'),
    WorldTime(location:'Melbourne' ,flag:'australia.png' ,url:'Australia/Melbourne' ),
    WorldTime(location:'Sydney' ,flag:'australia.png' ,url:'Australia/Sydney' ),
    WorldTime(location:'Berlin' ,flag:'germany.png' ,url:'Europe/Berlin' ),
    WorldTime(location:'Athens' ,flag:'greece.png' ,url:'Europe/Athens' ),
    WorldTime(location:'Budapest' ,flag:'hangary.png' ,url:'Europe/Budapest' ),
    WorldTime(location:'Moscow' ,flag:'russia.png' ,url:'Europe/Moscow' ),
    WorldTime(location:'Paris' ,flag:'france.png' ,url:'Europe/Paris' ),
    WorldTime(location:'Rome' ,flag:'italy.png' ,url:'Europe/Rome' ),
    WorldTime(location:'Zurich' ,flag:'switzerland.png' ,url:'Europe/Zurich' ),
    WorldTime(location:'New York' ,flag:'usa.png' ,url:'America/New_York' ),
    WorldTime(location:'Mexico City' ,flag:'mexico.png' ,url:'America/Mexico_City' ),
    WorldTime(location:'Jamaica' ,flag:'jamaica.png' ,url:'America/Jamaica' ),
    WorldTime(location:'Toronto' ,flag:'canada.png' ,url:'America/Toronto' ),
    WorldTime(location:'Santiago' ,flag:'chile.png' ,url:'America/Santiago' ),
    WorldTime(location:'Sao Paulo' ,flag:'brazil.png' ,url:'America/Sao_Paulo' ),
    WorldTime(location:'Buenos Aires' ,flag:'argentina.png' ,url:'America/Argentina/Buenos_Aires' ),
    WorldTime(location:'Bolivia' ,flag:'bolivia.png' ,url:'America/La_Paz' ),
    WorldTime(location:'Peru' ,flag:'peru.png', url:'America/Lima')
  ];

  void updateTime(index) async {
    WorldTime instance =locations[index];
    await instance.getTime();
    Navigator.pop(context , {
      'location': instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDayTime' : instance.isDayTime});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
      title: Text('Choose Location'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical:1.0, horizontal: 4.0),             child: Card(
             child: ListTile(
               onTap: () {
                 updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
            ),
            );
          },
        )
    );
  }
}
