import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/setting_app_data_provider.dart';
import 'package:rcp/screens/about_screen/about_screen.dart';
import 'package:rcp/screens/main_screen/last_product_widget.dart';
import 'package:rcp/screens/main_screen/sail_button_widget.dart';
import 'package:rcp/screens/main_screen/section_tittle_widget.dart';
import 'package:rcp/screens/main_screen/silver_appbar_widget.dart';
import 'package:rcp/screens/main_screen/single_cat_grid_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'carusel_widget.dart';
import 'main_bottombar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Uri _url = Uri.parse('https://racingcustomparts.com/');

  final instaLink = Uri.parse('https://www.instagram.com/racingcustomparts/');
  final fbLink = Uri.parse('https://www.facebook.com/RacingCustomParts/');
  late bool switchThemeMode;

  Future<void> _launchUrlToBroswer() async {
    HapticFeedback.lightImpact();
    try {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (error) {
      Provider.of<SettingAppProvider>(context, listen: false)
          .showErrorDialog(error, context);
    }
  }

  Future<void> _launchSocialMediaAppIfInstalled({
    required Uri url,
  }) async {
    HapticFeedback.lightImpact();

    try {
      bool launched = await launchUrl(url,
          mode: LaunchMode.externalApplication); // Launch the app if installed!

      if (!launched) {
        launchUrl(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launchUrl(url); // Launch web view if app is not installed!
    }
  }

  void _goToAboutScreen() {
    HapticFeedback.lightImpact();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AboutScreen(
        initialPageIndex: 0,
      ),
    ));
  }

  String imageBgSwitch() {
    String image = 'assets/images/bg.dark.webp';
    setState(() {
      switchThemeMode
          ? (image = 'assets/images/bg.dark.webp')
          : (image = 'assets/images/bg.light.jpg');
    });
    return image;
  }

  @override
  void initState() {
    switchThemeMode = Provider.of<SettingAppProvider>(context, listen: false)
        .isLightThemeMode;
    super.initState();
  }

  final List<MainCategory> category = [
    MainCategory(
        assetImage: 'assets/images/category/engine-new.jpg',
        categoryName: 'Engine',
        idCategory: 20),
    MainCategory(
        assetImage: 'assets/images/category/Gearboxnew.jpg',
        categoryName: 'GearBox',
        idCategory: 35),
    MainCategory(
        assetImage: 'assets/images/category/Brakes-adpater.jpg',
        categoryName: 'Breake adapter',
        idCategory: 18),
    MainCategory(
        assetImage: 'assets/images/category/Laser-cutting2.jpg',
        categoryName: 'Laser cut parts',
        idCategory: 40),
    MainCategory(
        assetImage: 'assets/images/category/others2-1.jpg',
        categoryName: 'Others parts',
        idCategory: 38)
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(imageBgSwitch(),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            const AppBarWidget(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Align(
                    alignment: Alignment.topRight,
                    child: Switch(
                      onChanged: (bool value) {
                        setState(() {
                          switchThemeMode = value;
                          Provider.of<SettingAppProvider>(context,
                                  listen: false)
                              .setThemeMode(value);
                        });
                      },
                      value: switchThemeMode,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SectionTitle(title: 'Select Main Category'),
                  SingleCategoryGrid(category: category),
                  const SectionTitle(title: 'Newset Product'),
                  const LastProductList(),
                  const SectionTitle(title: "Social media"),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SailButtonWidget(
                          boxShadowColor: const Color.fromARGB(255, 19, 7, 79)
                              .withOpacity(0.4),
                          blendColorl: const Color.fromARGB(209, 9, 37, 83),
                          callback: () {
                            _launchSocialMediaAppIfInstalled(url: fbLink);
                          },
                          imageSrc: 'assets/images/tsunami.jpeg',
                          icon: Icons.facebook,
                          title: 'Like us ',
                        ),
                        SailButtonWidget(
                          boxShadowColor: const Color.fromARGB(255, 43, 2, 38)
                              .withOpacity(0.4),
                          blendColorl: const Color.fromARGB(190, 73, 6, 62),
                          callback: () {
                            _launchSocialMediaAppIfInstalled(url: instaLink);
                          },
                          imageSrc: 'assets/images/drag.jpeg',
                          icon: Icons.photo_camera,
                          title: 'Fallow us',
                        ),
                      ],
                    ),
                  ),
                  const SectionTitle(title: ''),
                  CaruselInMain(),
                  const SectionTitle(title: 'About us'),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SailButtonWidget(
                          boxShadowColor: const Color.fromARGB(255, 236, 5, 5)
                              .withOpacity(0.4),
                          blendColorl: const Color.fromARGB(204, 0, 0, 0),
                          callback: _launchUrlToBroswer,
                          imageSrc: 'assets/images/tsunami.jpeg',
                          icon: Icons.web,
                          title: 'Go to Official Page',
                        ),
                        SailButtonWidget(
                          boxShadowColor: const Color.fromARGB(255, 236, 5, 5)
                              .withOpacity(0.4),
                          blendColorl: const Color.fromARGB(204, 0, 0, 0),
                          callback: _goToAboutScreen,
                          imageSrc: 'assets/images/engine.jpeg',
                          icon: Icons.car_crash,
                          title: 'About this app',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
