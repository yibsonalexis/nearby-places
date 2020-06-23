import 'package:flutter/material.dart';
import 'package:nearby_places/appTheme.dart';
import 'package:nearby_places/pages/homePage.dart';
import 'package:nearby_places/pages/loginPage.dart';
import 'package:nearby_places/pages/placeDetailPage.dart';
import 'package:nearby_places/pages/registerPage.dart';
import 'package:nearby_places/preferences/userPreference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final UserPreferences prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: HomePage(),
      initialRoute: 'login',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => LoginPage());
          case 'login':
            return MaterialPageRoute(builder: (_) => LoginPage());
          case 'register':
            return MaterialPageRoute(builder: (_) => RegisterPage());
          case 'home':
            return MaterialPageRoute(builder: (_) => HomePage());
          // case 'categoriesDetails':
          //   return MaterialPageRoute(
          //       builder: (_) => PlaceDetailPage(settings.arguments));
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Center(
                          child: Text('No route defined for ${settings.name}')),
                    ));
        }
      },
    );
  }
}
