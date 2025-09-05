import 'package:crud_api_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(155, 72, 173, 255),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFC7D9E5),
          contentPadding: EdgeInsets.all(24),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 1),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
