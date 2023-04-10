import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _textCV =
    "Hi, my name is Przemek, for friends Pluszowy. I come from Cracov, a city in Poland. I'm not proffessional developer but I'm willing to be. I created this app, for my friends company, and I learn Flutter and Dart on this app. I hope you'll like it. I have a little expierence in Java Script, html, angular and css but I focus on Flutter and Dart. \n If you are company's developer and my work is good for you I'm searching for employment in this industry as trainee.";

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});
  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
        child: Column(children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color.fromARGB(119, 113, 113, 113),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color.fromARGB(255, 118, 117, 117),
              child: FittedBox(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 112, 112, 112),
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/me.jpeg'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Nowak Przemysław',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(_textCV)
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
