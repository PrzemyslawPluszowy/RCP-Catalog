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
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://d80a274481f24e148a1c3bb5366290c4@o4505013410136064.ingest.sentry.io/4505013411250176';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const RCP()),
  );
}

class RCP extends StatelessWidget {
  const RCP({super.key});

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
            debugShowCheckedModeBanner: false,
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
