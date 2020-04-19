import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_stations/provider/radio_provider.dart';

import 'screens/all_stations_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => RadioProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.cyan),
        home: RadioPlayer(),
      ),
    );
  }
}
