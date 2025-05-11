import 'package:flutter/material.dart';
import 'package:souhaits_app/views/pages/home.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized() prépare l’environnement Flutter pour que toutes les API liées soient charger 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

