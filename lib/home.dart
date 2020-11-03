import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImg = data['isDayTime'] ? 'day.jpeg' : 'night1.jpeg';
    Color bgColor = data['isDayTime'] ? Colors.lightBlue[50] : Colors.grey[900];
    Color texcolor = data['isDayTime'] ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,

    body: SafeArea(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover
            )
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,150,10,10),
            child: Column(
              children: <Widget>[
                Center(
                  child: FlatButton.icon(
                    onPressed: () async{
                      dynamic result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data= {'time' : result['time'],
                        'location': result['location'],
                        'isDayTime' : result['isDayTime'],
                          'flag' : result['flag'],
                        };
                        String bgImg = data['isDayTime'] ? 'day.jpeg' : 'night1.jpeg';
                        Color bgColor = data['isDayTime'] ? Colors.lightBlue[50] : Colors.grey[900];
                        Color texcolor = data['isDayTime'] ? Colors.black : Colors.white;
                      });
                    },
                    icon: Icon(Icons.edit_location,
                    color: Colors.red,
                    size: 35,),
                    label: Text('Change Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: texcolor
                    ),),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
                  ),
                ),
                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: texcolor
                  ),
                )
              ],
            ),
          ),
        )
    ),
    );
  }
}
