import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rcp/material_theme/color_schemes.g.dart';
import 'package:rcp/providers/cart_provider.dart';
import 'package:rcp/providers/list_method_provider.dart';
import 'package:rcp/providers/rcp_init_data_provider.dart';
import 'package:rcp/providers/setting_app_data_provider.dart';
import 'package:rcp/screens/loading_screen/loading_screen.dart';
import 'package:rcp/screens/main_screen/main_bottombar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static final _defaultLightColorScheme =
  //     ColorScheme.fromSwatch(primarySwatch: Colors.red);

  // static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
  //     primarySwatch: Colors.grey, brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<RcpData>(
        create: (context) => RcpData(),
      ),
      ChangeNotifierProxyProvider<RcpData, ListMethod>(
        create: (context) => ListMethod(),
        update: (context, value, data) =>
            data!..update(value.rcpListAllProduct),
      ),
      ChangeNotifierProvider<SettingAppProvider>(
        create: (context) => SettingAppProvider(),
      ),
      ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
      )
    ], child: const ThemeChanger());
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({
    super.key,
  });

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  late bool isLightMode;
  @override
  void initState() {
    Provider.of<SettingAppProvider>(context, listen: false).setInitThemeMode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isLightMode = Provider.of<SettingAppProvider>(context).isLightThemeMode;

    return Builder(builder: (context) {
      return Consumer<SettingAppProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
            ),
            themeMode: isLightMode ? ThemeMode.dark : ThemeMode.light,
            routes: {
              MainScreenBootomBar.pageRoute: (context) =>
                  const MainScreenBootomBar()
            },
            home: const LoadingScreen(),
          );
        },
      );
    });
  }
}
