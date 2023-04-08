import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/setting_app_data_provider.dart';
import 'package:rcp/screens/main_screen/last_product_widget.dart';
import 'package:rcp/screens/main_screen/sail_button_widget.dart';
import 'package:rcp/screens/main_screen/section_tittle_widget.dart';
import 'package:rcp/screens/main_screen/silver_appbar_widget.dart';
import 'package:rcp/screens/main_screen/single_cat_grid_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main_bottombar_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Uri _url = Uri.parse('https://racingcustomparts.com/');
  late bool switchThemeMode;

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          SliverList(
              delegate: SliverChildListDelegate([
            Align(
              alignment: Alignment.topRight,
              child: Switch(
                onChanged: (bool value) {
                  setState(() {
                    switchThemeMode = value;
                    Provider.of<SettingAppProvider>(context, listen: false)
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
            const SectionTitle(title: 'Newset Product'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SailButtonWidget(
                  callback: _launchUrl,
                  imageSrc: 'assets/images/other/rcp-web.png',
                  icon: Icons.web,
                  title: 'Go to Official Page',
                ),
                SailButtonWidget(
                  callback: _launchUrl,
                  imageSrc: 'assets/images/other/rcp-web.png',
                  icon: Icons.question_answer,
                  title: 'FAQ',
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Divider(),
          ]))
        ],
      ),
    );
  }
}
