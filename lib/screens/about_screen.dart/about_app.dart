import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../question_screen/round_logo.widgtet.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
      child: Center(
        child: Column(
          children: [
            const RoundLogo(),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.black38)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Racing Custom Parts',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        '"All parts are custom made, please check before use"',
                        softWrap: true,
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'This aplication is official parts of ',
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse('https://racingcustomparts.com/'));
                      },
                      child: Text('www.racingcustomparts.com',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Copyright © 2019 Racing Custom Parts.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
