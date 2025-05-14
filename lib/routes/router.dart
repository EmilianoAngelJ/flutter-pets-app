import 'package:flutter/widgets.dart';
import 'package:pets_app/screens/home.dart';

class AppRouter {
  // Define the routes for navigation in the app
  static const String homeScreenRoute = '/home';

  // Map of route names to widget builders
  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreenRoute: (context) => const HomeScreen(), 

  };
  
}