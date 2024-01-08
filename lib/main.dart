import 'package:flutter/material.dart';
import 'package:kuki/KukiApp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light, // Default theme
        // Diğer ThemeData özellikleri buraya eklenebilir.
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark mode theme
        scaffoldBackgroundColor:
            const Color.fromARGB(255, 40, 39, 39), // Dark mode arka plan rengi
        primaryColor: Colors.white, // Dark mode başlık, buton, vs. rengi
        colorScheme: const ColorScheme.dark(
          secondary: Color.fromARGB(255, 25, 27, 27),
          primary: Colors.white, // Dark mode vurgu rengi
          onPrimary: Color.fromARGB(
              255, 59, 59, 59), // Dark mode vurgu rengi yazı rengi
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white), // Dark mode yazı rengi
          bodyText2: TextStyle(color: Color.fromARGB(255, 34, 185, 244)),
          headline6: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor:
              Color.fromARGB(255, 58, 214, 245), // Primary button color
          textTheme:
              ButtonTextTheme.primary, // Use primary color for button text
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 253, 254, 254),
              secondary: const Color.fromARGB(255, 0, 0, 0) // Button text color
              ),
        ),
        // Diğer ThemeData özellikleri buraya eklenebilir.
      ),
      themeMode: ThemeMode.dark,
      home: KukiApp(),
    );
  }
}
