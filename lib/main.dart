import 'package:flutter/material.dart';
import 'package:newsapp1/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API News',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: Home(),
      title: new Text(
        'News App',
        textScaleFactor: 2,
      ),
      image: new Image.network(
          'https://img.freepik.com/free-vector/gradient-national-sports-day-illustration_23-2148995776.jpg?w=1380&t=st=1668687153~exp=1668687753~hmac=60a9421f21073b69bdac3cd0a46797f0a98b845a526e4ab3c6f4387531d248f0'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Color.fromARGB(255, 147, 205, 253),
    );
  }
}
