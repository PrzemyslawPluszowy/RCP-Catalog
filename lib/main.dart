import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/material_theme/color_schemes.g.dart';
import 'package:rcp/screens/loading_screen/loading_screen.dart';
import 'package:rcp/screens/main_screen/main_bottombar_screen.dart';

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
            create: (context) => RcpData(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          routes: {
            MainScreenBootomBar.pageRoute: (context) => MainScreenBootomBar()
          },
          home: const LoadingScreen(),
        ));
  }
}
