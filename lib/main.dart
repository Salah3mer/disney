import 'package:bloc/bloc.dart';
import 'package:disney/core/bloc_observer.dart';
import 'package:disney/core/services/service_locator.dart';
import 'package:disney/movies/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';

void main() {
    ServiceLocator().init();
    Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieScreen(),
    );
  }
}


