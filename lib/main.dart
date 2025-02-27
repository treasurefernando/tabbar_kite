import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar/bloc/bloc.dart';
import 'package:tabbar/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kite',
        theme: ThemeData.dark(),
        home: BlocProvider(
            create: (context) => StockBloc(), child: Homescreen()));
  }
}
