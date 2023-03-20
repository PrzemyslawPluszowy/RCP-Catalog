import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/api.dart';
import 'package:rcp/api_data/sort_data.dart';
import 'package:rcp/material_theme/color_schemes.g.dart';
import 'package:rcp/screens/loading_screen/loading_screen.dart';
import 'package:rcp/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.amber);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.grey, brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ApiData(),
          ),
          ChangeNotifierProvider.value(value: SortData())
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          routes: {MainScreen.pageRoute: (context) => MainScreen()},
          home: const LoadingScreen(),
        ));
  }
}
