import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/accessibility_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/tunarungu_screen.dart';
import 'screens/tunawicara_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intema',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color(0xFFBF7D4A),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetailScreen(
              name: args['name'],
              price: args['price'],
            ),
          );
        }

        // Default routes
switch (settings.name) {
  case '/':
    return MaterialPageRoute(builder: (_) => WelcomeScreen());
  case '/login':
    return MaterialPageRoute(builder: (_) => LoginScreen());
  case '/register':
    return MaterialPageRoute(builder: (_) => RegisterScreen());
  case '/accessibility':
    return MaterialPageRoute(builder: (_) => AccessibilityScreen());
  case '/menu':
    return MaterialPageRoute(builder: (_) => MenuScreen());
  case '/tunarungu':
    return MaterialPageRoute(builder: (_) => TunarunguScreen());
  case '/tunawicara':
    return MaterialPageRoute(builder: (_) => TunawicaraScreen());
  default:
    return null;
}
      },
    );
  }
}
