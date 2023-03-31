import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/api_data/test_controller.dart';
import 'package:rcp/screens/main_screen/main_bottombar_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  showSnackBar2(err) {}

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<RcpData>(context, listen: false)
            .initData()
            .then((value) => setState(() {
                  _isLoading = false;
                }));
      } catch (error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Samething going wrong :('),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$error'),
                  Text('%^%^%&^&&'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Hive.resetAdapters();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()));
                },
              ),
            ],
          ),
        );
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(transform: GradientRotation(20), colors: [
        Color.fromARGB(255, 240, 26, 11),
        Color.fromARGB(221, 246, 103, 1)
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 15)),
                      const Text(
                        "Loading catalog RCP",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Text(
                        'please wait a moment',
                        style: TextStyle(
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                      Consumer<RcpData>(
                        builder: (context, value, child) => Text(
                            'Getting product ${value.count}/${value.numberProduct + 2}',
                            style: const TextStyle(
                                color: Colors.white,
                                decorationStyle: TextDecorationStyle.dashed)),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: FilledButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MainScreenBootomBar.pageRoute);
                      },
                      child: const Text('Go to catalog')))
        ],
      ),
    ));
  }
}
