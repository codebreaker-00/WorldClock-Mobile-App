import 'loading.dart';
import 'chose_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home' : (context) =>  Home(),
        '/location' : (context) => Choselocation(),
      },
    )
  );
}




