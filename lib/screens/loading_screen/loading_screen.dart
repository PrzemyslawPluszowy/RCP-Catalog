import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/api.dart';
import 'package:rcp/screens/main_screen/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ApiData>(context).productCount();
      Provider.of<ApiData>(context, listen: true).getRCPdata().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
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
                      Consumer<ApiData>(
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
                        Navigator.of(context).pushNamed(MainScreen.pageRoute);
                      },
                      child: const Text('Go to catalog')))
        ],
      ),
    ));
  }
}
