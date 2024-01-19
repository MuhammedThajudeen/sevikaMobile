import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevika/view/loginscreen.dart';
import 'package:sevika/viewmodel/carousel_provider.dart';
import 'package:sevika/viewmodel/login_provider.dart';
import 'package:sevika/viewmodel/services_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> carouseldata(),),
        ChangeNotifierProvider(create: (context)=> Servicesdata(),),
        ChangeNotifierProvider(create: (context)=> login())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white
        ),
        home: const loginscreen(),
      ),
    );
  }
}


